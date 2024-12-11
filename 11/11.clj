#!/usr/bin/env bb
(def s (fn [x]
          (let [s (str x), l (count s)]
            (cond (= x 0) [1]
                  (even? l) [(parse-long (subs s 0 (/ l 2)))
                             (parse-long (subs s (/ l 2)))]
                  :else [(* 2024 x)]))))
(def C' (memoize (fn [C n x]
                   (if (zero? n) 1
                     (apply + (map (partial C C (dec n)) (s x)))))))
(def C (partial C' C'))
(defn solve [n xs] (apply + (map C (repeat n) xs)))

(def in (into [] (map parse-long (-> *in* slurp (str/split #"\s+")))))
(println (solve 25 in))
(println (solve 75 in))
