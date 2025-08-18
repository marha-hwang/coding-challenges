def solution(my_string):
    
    answer = []
        
    for s in my_string : 
        if s.isdigit() : answer.append(s)

    answer = sorted(answer, key = lambda x:x, reverse=False)
    return list(map(lambda x:int(x), answer))
