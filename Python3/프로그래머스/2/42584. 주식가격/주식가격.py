# 주식이 떨어지지 않는 시간을 모두 계산
# 배열 전체를 순회하면서 떨어지지 않는 시점을 구함 -> 가장 쉽지만 시간초과
# 한번의 순회로 문제를 풀수는 없을까?
### 기록을 해놓으면 효율적으로 풀 수 있지 않을까?
# 현시점에서 모르는 요소를 저장해놓음 -> 다음을 확인할때 최근것과 비교
### 근데 몇초간 떨어진건지 모름 -> 스택에 인덱스와 같이 저장 필요

def solution(prices):
    
    stack = []
    answer = [0] * len(prices)

    
    for i, price in enumerate(prices):
        # 최상단 값이 더 작거나 같은 경우
        if not stack or stack[-1][1] <= price:
            stack.append((i, price))      
        # 최상단 갑이 더 큰 경우 
        else :
            # 같거나 작은 값이 나올 때까지 스택을 비움
            while stack and stack[-1][1] > price:
                a, b = stack.pop()
                # 인덱스 값 비교를 통해 정답 기록
                answer[a] = i-a
                
            stack.append((i, price))
    
    for p in stack:
        answer[p[0]] = len(prices) -1 - p[0]
        
    return answer