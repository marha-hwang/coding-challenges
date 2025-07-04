def solution(arr) :

    result = [arr[0]]

    for n in arr[1:]:
        if result[-1] != n : result.append(n)

    return result