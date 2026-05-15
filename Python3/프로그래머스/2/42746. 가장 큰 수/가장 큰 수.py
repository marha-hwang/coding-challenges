# 주어진 수를 모두 이어붙였을 때, 가장 큰 수를 알아내기
# 모든 조합을 이어붙여 정렬 -> 시간초과
# 만약 주어진 수가 2개만 있다면? 두 수를 이어붙였을 때를 비교하여 정렬
from functools import cmp_to_key

# 우선순위를 정하는 함수
# a의 우선순위가 높은경우 음수, b의 우선순위가 높은 경우 양수
def compare(a, b):
    if int(str(a)+str(b)) >= int(str(b)+str(a)): return -1
    else: return 1

def solution(numbers) :
	# 내림차순 정렬 -> 리스트 문자열 변환
	return str(int("".join(list(map(str, sorted(numbers, key=cmp_to_key(compare)))))))