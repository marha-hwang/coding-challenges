import math


_numbers:str
numbersSet = set()

def verifySosu(number:int)->bool:
    if number <= 1:
        return False
    for i in range(2, int(math.sqrt(number)) + 1):
        if number % i == 0:
            return False
    return True

def dfs(number:str, checks:int) :

    if ((1 << len(_numbers)) -1) == checks :
        return
    
    for i in range(0, len(_numbers)) :
        #종료접근
        if (1 << i) & checks == 0 :
            # 재귀
            tempChecks = (1 << i) | checks
            dfs(number+_numbers[i], tempChecks)
            numbersSet.add(int(number+_numbers[i]))

def solution(numbers) :
    global _numbers
    _numbers = numbers

    dfs("", 0)
    result = 0
    for num in numbersSet :
        if verifySosu(num) : result += 1
    return result