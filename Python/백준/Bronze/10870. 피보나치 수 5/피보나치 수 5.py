import sys

def solution(N) :
	arr = [0, 1]
	for i in range(2, 21) :
		arr.append(arr[i-1]+arr[i-2])

	print(arr[N])



N = int(sys.stdin.readline())
solution(N)