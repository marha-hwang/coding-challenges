def solution(array, commands):
    result:list[int] = []
    for command in commands :
        temp:list[int] = array[command[0]-1:command[1]]
        result.append(sorted(temp)[command[2]-1])

    return result