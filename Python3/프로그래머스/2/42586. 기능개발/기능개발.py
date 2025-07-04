import math

# 진행율, 속도 배열을 기반으로 남은 작업기간 산정
# 진행율, 속도 배열을 기반으로 남은 작업기간 산정
def getRestDays(progress:int, speed:int)->int:
    m = math.ceil((100-progress)/speed)
    return m


# 첫번째 인덱스의 값을 조회하고, 다음 인덱스를 순회하면서 더 작은 값이 존재하면 동시배포 작업 증가
def solution(progresses, speedes:list):
    restDays:list[int] = []
    for i in range(0, len(progresses)):
        restDays.append(getRestDays(progresses[i], speedes[i]))
    
    results:list[int] = [1]
    prev = restDays[0]    
    for n in restDays[1:] :
        if n > prev : 
            prev = n
            results.append(1)
        else : results[-1] += 1

    return results