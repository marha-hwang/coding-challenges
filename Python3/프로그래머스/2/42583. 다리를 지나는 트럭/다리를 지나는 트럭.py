
from collections import deque
def solution(bridge_length, weight, truck_weights):

    remainTruck = 0
    nowWeight = 0
    nowTime = 0
    que = deque()
    
    # 남은 트럭이 존재하지 않을 때 까지 반복
    while remainTruck < len(truck_weights) :
        
        # 다리위 트럭의 시간 업데이트 및 제거
        nowTime += 1
        for i in range(0, len(que)) :
            que[i][0] += 1
        
        while True :
            if (len(que) > 0 and que[0][0] > bridge_length) : 
                outed = que.popleft()
                nowWeight -= outed[1]
            else : break
        
        nowTruck = truck_weights[remainTruck]
        # if 현재 트럭이 다리에 올라갈 수 있는지 확인 
        if nowWeight+nowTruck <= weight : 
            # 남은 트럭, 다리위 트럭, 무게 업데이트
            remainTruck += 1
            que.append([1, nowTruck])
            nowWeight += nowTruck
    
    nowTime += (bridge_length-que[-1][0]+1)

    return nowTime