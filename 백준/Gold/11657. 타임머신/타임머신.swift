import Foundation

// n: 도시갯수, m:버스갯수
Q11657().main()

class Q11657{
    func main(){
        let input = readLine()!.split(separator: " ").map{ Int($0)!}
        let n = input[0], m = input[1]
        
        var arr = [(Int,Int,Int)]()
        for _ in 0..<m{
            let input = readLine()!.split(separator: " ").map{ Int($0)}
            arr.append((input[0]!, input[1]!, input[2]!))
        }
        
        solution(n:n, arr:arr)
        
    }
    
        func solution(n:Int, arr:[(s: Int, e: Int, w: Int)]){
        
        let intMax = 999999999999
        
        var distance = Array(repeating: intMax, count: n+1)
        
        distance[1] = 0
        for _  in 0..<n-1{
            for edge in arr where distance[edge.s] != intMax{
                distance[edge.e] = min(distance[edge.s] + edge.w, distance[edge.e])
            }
        }
        
        //음수의 간선이 존재하는지 확인
        for edge in arr where distance[edge.s] != intMax{
            if distance[edge.s] + edge.w < distance[edge.e] {
                print(-1)
                return
            }
        }
        
        distance[2...].forEach {
            print($0 == intMax ? -1 : $0)
        }
        
    }
}
