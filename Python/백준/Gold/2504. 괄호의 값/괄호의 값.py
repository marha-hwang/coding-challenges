# input의 크기만큼 반복
    # 현재 요소가 ')' 또는 ']'가 아닌 경우 continue

    # 가장 가까운 괄호가 나올때까지 반복
        #인덱스를 초과하는 경우 exit0
        #괄호의 종류가 다른 경우 exit0

        #만약 현재 요소가 숫자인 경우 누적합을 구함
        #만약 괄호가 매칭되는 경우
            # 누적된 합 * 괄호 값을 계산 후 괄호 마지막에 할당
            # 괄호의 나머지 부분은 0으로 채움

# 알아둘것
'''
1. 문자열은 인덱스에 접근하는 수정이 불가하다. list("문자열")과 같은 방식으로 list변환 후 수정해야 한다.
2. 변수 네이밍시에 sum, str등의 내장함수와 같은 이름은 사용하지 않아야 한다.
3. 프로그램 종료는 exit(0)과 같이 해야한다.
4. 커맨트창에서 입력을 받을때 rstrip()을 사용하여 \n을 제거해줘야 한다.
'''

import sys

input = sys.stdin.readline().rstrip()
arr = list(input)

def adjustArray(arr ,start, end):
    arr[start:end+1] = ['0']*(end-start+1)

for i in range(0, len(arr)):
    now = arr[i]
    if now != ')' and now != ']':continue

    j = i-1
    value = 0
    while True:
        if j < 0 :
            print(0)
            exit(0)
        prev = arr[j]
        if (now == ')' and prev == '[') or (now == ']' and prev == '('):
            print(0)
            exit(0)

        if prev.isdigit() : value+=int(prev)

        if (now == ')' and prev == '('):
            value = value*2 if value > 0 else 2
            arr[i] = str(value)
            adjustArray(arr, int(j), int(i-1))
            break
        
        if (now == ']' and prev == '['):
            value = value*3 if value > 0 else 3
            arr[i] = str(value)
            adjustArray(arr, int(j), int(i-1))
            break

        j-=1

try:  
    print(sum(map(int, arr)))       
except:
    print(0)     