import sys
from collections import deque

n = int(sys.stdin.readline())
que = deque()

for i in range(n):
    str = sys.stdin.readline()
    arr = str.split()

    if arr[0] == "push": que.append(arr[1])
    elif arr[0] == "pop":
        if len(que) == 0: print(-1)
        else: print(que.popleft())
    elif arr[0] == "size": print(len(que))
    elif arr[0] == "empty": print("0" if len(que) > 0 else 1)
    elif arr[0] == "front": print("-1" if len(que) == 0 else que[0])
    elif arr[0] == "back": print("-1" if len(que) == 0 else que[len(que)-1])