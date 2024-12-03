import re
inp = open(0).read()

def mulsum(s):
    ms = re.findall(r"mul\((\d+),(\d+)\)", s)
    return sum(int(a)*int(b) for a,b in ms)

print(mulsum(inp))

inp2 = re.sub(r"don't\(\).*", "", re.sub(r"don't\(\).*?do\(\)", "", re.sub("\n", "", inp)))
print(mulsum(inp2))
