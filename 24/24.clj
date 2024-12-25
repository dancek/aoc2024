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

(def zs (filter #(str/starts-with? % "z")
                (reverse (sort (keys @rules)))))

(println (edn/read-string (apply str "2r"
                                 (str/join (map get-wire zs)))))

(defn full-rule [i k]
  (let [indent (apply str (repeat i " "))]
    (if (re-matches #"[xy].*" k)
      (str indent k)
      (when-let [[a op b] (get @rules k)]
        (let [[s t] (sort-by count [(full-rule (inc i) a)
                                    (full-rule (inc i) b)])]
          (str indent "(" op "  ; " k "\n"
                  indent s "\n"
                  indent t ")"))))))
(defn swap-wires [a b]
  (let [s (get @rules a)
        t (get @rules b)]
    (swap! rules assoc a t b s)))

;; manually found from output:
(swap-wires "wpq" "grf")
(swap-wires "z36" "nwq")
(swap-wires "z22" "mdb")
(swap-wires "z18" "fvw")
;; fvw,grf,mdb,nwq,wpq,z18,z22,z36

(doseq [k zs]
  (println k (full-rule 4 k)))
