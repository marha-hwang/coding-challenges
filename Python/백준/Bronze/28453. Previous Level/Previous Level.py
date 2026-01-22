import sys

n = int(sys.stdin.readline())
input = list(map(int, sys.stdin.readline().split()))

result = []             
for i in input :
    if i == 300 : result.append(1)
    elif i >= 275 :  result.append(2)
    elif i >= 250 : result.append(3)
    else : result.append(4)

print(" ".join(map(str,result)))