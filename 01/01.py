S=sorted;P=print
a,b=zip(*((int(v)for v in l.split())for l in open(0).read().strip().split('\n')))
P(sum(abs(x-y)for x,y in zip(S(a),S(b))))
P(sum(x*b.count(x)for x in a))
