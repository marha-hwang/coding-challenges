# 장르별로 2곡씩 노래를 수록함
# 많이 재생된 장르 -> 많이 재생된 노래 -> 고유번호가 낮은 노래
# 장르에 속한 곡이 하나라면 1곡만 수록

# 장르별로 재생횟수 산출 -> 해당 장르에서 가장많이 재생된 노래 2개 산출

def solution(genres, plays):
    answer = []
    
    genres_count = {}
    category = {}
    
    for i in range(0, len(genres)) :
        # 장르별로 분리 : 딕셔너리 {장르:[(인덱스, 재생횟수)]}
        if genres[i] not in category : category[genres[i]] = []
        category[genres[i]].append((i, plays[i]))

        # 장르별로 재생횟수 합산
        if genres[i] not in genres_count : genres_count[genres[i]] = 0
        genres_count[genres[i]] += plays[i]
    
    # 장르별 내림차순 정렬
    sort = sorted(list(genres_count.items()), key=lambda x:x[1], reverse=True)
    
    for c in sort:
        # 각 딕셔너리 재생횟수, 인덱스로 정렬 -> 2곡씩 뽑아냄
        now = category[c[0]]
        now.sort(key=lambda x:(x[1], -x[0]), reverse=True)
        answer.append(now[0][0])
        if len(now) > 1 : answer.append(now[1][0])
    
    return answer