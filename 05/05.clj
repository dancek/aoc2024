#!/usr/bin/env bb
(defn ->ints [line]
  (->> (str/split line #"\D")
       (map edn/read-string)))

(defn applicable-rules [rules plan]
  (let [xs (set plan)]
    (filter #(and (xs (first %)) (xs (second %)))
            rules)))

(defn valid? [rules plan]
  (let [indices (into {} (map-indexed #(hash-map %2 %1) plan))]
    (every? true? (for [[a b] (applicable-rules rules plan)]
                    (< (get indices a) (get indices b))))))

(defn swap-sort [rules plan]
  (let [indices (into {} (map-indexed #(hash-map %2 %1) plan))
        swap (first (filter (fn [[a b]]
                              (> (get indices a) (get indices b)))
                            rules))]
    (if-not swap
      plan
      (let [[a b] swap
            i (get indices a)
            j (get indices b)
            swapped (assoc plan
                           i b
                           j a)]
        (swap-sort rules swapped)))))

(defn make-valid [rules plan]
  (swap-sort (applicable-rules rules plan)
             (into [] plan)))

(defn middle-element [xs]
  (nth xs (quot (count xs) 2)))

(let [[rules plans] (->> (str/split (slurp *in*) #"\n\n")
                         (map str/split-lines)
                         (map #(map ->ints %)))
      valid-plans (filter (partial valid? rules) plans)
      invalid-plans (filter #(not (valid? rules %)) plans)]
  (println (apply + (map middle-element valid-plans)))
  (println (apply + (->> invalid-plans
                         (map make-valid (repeat rules))
                         (map middle-element)))))
