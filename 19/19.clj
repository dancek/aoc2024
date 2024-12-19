#!/usr/bin/env bb
(let [[ptrn-l _ & towels](-> *in* slurp (str/split #"\n"))]
  (def patterns (str/split ptrn-l #", "))
  (def towels towels))

(defn possible [patterns towel]
  (if (empty? towel)
    true
    (some true?
          (for [p (filter #(str/starts-with? towel %) patterns)]
            (possible patterns (str/replace-first towel p ""))))))

(println (->> towels
             (map (partial possible patterns))
             (filter true?)
             count))
