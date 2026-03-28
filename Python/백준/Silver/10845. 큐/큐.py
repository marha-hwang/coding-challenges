import sys
from collections import deque

N = int(sys.stdin.readline())
q = deque()

for i in range(0, N):
    cmd =  list(sys.stdin.readline().split())

    match cmd[0] :
        case "push" : 
            q.append(cmd[1])
        case "pop" :
            pop = -1 if len(q) <= 0 else q.popleft()
            print(pop)
        case "size" : 
            print(len(q))
        case "empty" :
            print(0 if len(q) != 0 else 1)
        case "front" : 
            front = -1 if len(q) <= 0 else q[0]
            print(front)
        case "back" : 
            back = -1 if len(q) <= 0 else q[len(q)-1]
            print(back)