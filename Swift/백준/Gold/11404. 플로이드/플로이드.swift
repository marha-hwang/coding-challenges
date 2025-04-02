import Foundation
Q11404().main()

class Q11404{
    func main(){
        let n = Int(readLine()!)!
        let m = Int(readLine()!)!
        var arr = [(s:Int, e:Int, k:Int)]()
        for _ in 0..<m{
            let line = readLine()!.split(separator: " ").map{ Int($0)!}
            arr.append((line[0], line[1], line[2]))
        }
        solution(n: n, arr: arr)
    }
    
    func solution(n:Int, arr:[(s:Int, e:Int, k:Int)]){
        let intMax = 9999999999
        var distance = Array(repeating: Array(repeating: intMax, count: n+1), count: n+1)
        for i in 1...n{
            distance[i][i] = 0
        }
        
        //같은 노선이 있을 수 있음
        arr.forEach{ distance[$0.s][$0.e] = min(distance[$0.s][$0.e], $0.k) }
        
        for m in 1...n{
            for s in 1...n{
                for e in 1...n{
                    distance[s][e] = min(distance[s][e], distance[s][m] + distance[m][e])
                }
            }
        }
        
        distance[1...].forEach{
            let result = $0.map{ $0 == intMax ? "0":String($0)}
            print(result[1...].joined(separator: " "))
        }
    }
}
