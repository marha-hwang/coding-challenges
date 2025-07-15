
import sys


def solution(N):
	_max5 = int(N/5)

	_result = -1
	# 5의 갯수를 감소시켜 나가면서 3으로 나누어 떨어지면 break
	for i in range(_max5, -1, -1) :
		_temp = N - (5 * i)
		if _temp % 3 == 0 :
			_result = int(_temp/3) + i
			break
	print(_result)		


N = int(sys.stdin.readline())
solution(N)