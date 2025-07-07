def solution(answers) :
    student1 = [1, 2, 3, 4, 5]
    student2 = [2, 1, 2, 3, 2, 4, 2, 5]
    student3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

    correct1 = 0
    correct2 = 0
    correct3 = 0
    for i in range(0, len(answers)) :
        if student1[int(i%len(student1))] == answers[i] : correct1 += 1
        if student2[int(i%len(student2))] == answers[i] : correct2 += 1
        if student3[int(i%len(student3))] == answers[i] : correct3 += 1

    result = []
    maxScore = max(max(correct1, correct2), correct3)
    if correct1 == maxScore : result.append(1)
    if correct2 == maxScore : result.append(2)
    if correct3 == maxScore : result.append(3)

    return result