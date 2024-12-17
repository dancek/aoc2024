pseudocode:

start:
    b = a & 7
    b = b ^ 5
    c = a / 2**b
    b = b ^ 6
    a = a / 8
    b = b ^ c
    out(b & 7)
    jnz start

b = ((a & 7) ^ 3) ^ (a / ((a & 7) ^ 5))
