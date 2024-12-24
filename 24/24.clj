#!/usr/bin/env bb
(def wires (atom {}))
(def rules (atom {}))

(doseq [line (-> *in* slurp (str/split-lines))]
  (when-let [[_ k v] (re-matches #"(.*): ([01])" line)]
    (swap! wires assoc k (parse-long v)))
  (when-let [[_ a op b k] (re-matches #"(.*) (.*) (.*) -> (.*)" line)]
    (swap! rules assoc k [a op b])))

(defn get-wire [k]
  (or (get @wires k)
      (let [[a op b] (get @rules k)
            x (get-wire a)
            y (get-wire b)
            v (case op
                "AND" (bit-and x y)
                "OR" (bit-or x y)
                "XOR" (bit-xor x y))]
        (swap! wires assoc k v)
        v)))

(defn zvalues []
  (reverse (for [k (sort (keys @rules))
                 :when (str/starts-with? k "z")]
            (get-wire k))))

(println (edn/read-string (apply str "2r" (str/join (zvalues)))))
