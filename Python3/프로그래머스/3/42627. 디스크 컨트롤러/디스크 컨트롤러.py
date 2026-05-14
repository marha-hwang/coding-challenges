# 작업의 소요시간이 짧은 것 -> 작업의 요청 시각이 빠른 것 -> 작업의 번호가 작은 것 순
# 모든 요청 작업의 반환 시간의 평균의 정수부분을 return

# 우선순위 큐에 다넣음 -> 시간이 맞지 않으면??
# 시간이 계속 변화하는 상황에서 요청시각을 고려하기 -> 결국 특정 시점에서 가능한것과 불가 한것을 구분
# 특정 시점마다의 작업 배열을 생성 -> 시간이 흘렀을 때 작업을 모두 힙에 추가

import heapq

def solution(jobs):
    answer = 0
    
    invalids = [[] for i in range(0, 1001)]
    valids = []
    max_time = 0
    
    # jobs를 시간별로 배열에 추가
    for i, job in enumerate(jobs):
        invalids[job[0]].append((i, job[1]))
        max_time = max(max_time, job[0])
    
    now = 0
    transfer_time = -1
    
    # valids가 빌때까지 시간을 증가
    while transfer_time < max_time or valids :
        # 현재 실행가능한 작업을 배열에서 힙으로 옮김
        for i in range(transfer_time+1, now+1):
            if i <= max_time :
                data = invalids[i]
                # 작업기간, 요청시간, 인덱스
                for d in data: heapq.heappush(valids, (d[1], i, d[0]))
        transfer_time = now
        
        # 힙에서 우선순위가 높은것 pop, answer에 기록
        if valids :
            a, b, c = heapq.heappop(valids)
            now += a
            answer += now-b
        else : now+=1
    
    return int(answer/len(jobs))