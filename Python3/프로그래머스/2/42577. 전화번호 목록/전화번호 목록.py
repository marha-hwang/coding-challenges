# 전화번호 배열이 존재, 특정 번호가 다른 번호의 접두어가 되는 경우 False리턴
# 만약 set을 사용한다면? 접두어는 찾아내지 못함 -> 문자열의 길이가 다르기 때문에
# 문자열의 길이를 같게 만든다면? -> 같은 문자열을 찾아낼 수 있음
# 문자열의 길이가 부족한 경우? -> 해당 문자열은 포함시키지 않아도 됨

def solution(phone_book):
    
    # 문자열 최대 길이 구하기
    maxLength = max(list(map(lambda x:len(x), phone_book)))
    phone_book.sort(key = lambda x:len(x),reverse=True)
    
    for i in range(1, maxLength+1) : 
        sset = set()
        for st in phone_book :
            if len(st) >= i :
                if st[0:i] in sset and len(st) == i : return False
                else : sset.add(st[0:i])
    
    return True
        