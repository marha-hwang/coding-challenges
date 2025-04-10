import Foundation

Q14567().main()

class Q14567{
    func main(){
        let input = readLine()!.split(separator: " ").map{ Int($0)!}
        let n = input[0], m = input[1]
        
        var inDegree = Array(repeating: 0, count: n+1)
        var graph:[[Int]] = Array(repeating: [], count: n+1)
        
        for _ in 0..<m{
            let input = readLine()!.split(separator: " ").map{ Int($0)!}
            graph[input[0]].append(input[1])
            inDegree[input[1]] += 1
        }
        
        solution(inDegree: &inDegree, graph: graph)
        
    }
    
    func solution(inDegree: inout [Int], graph:[[Int]]){
        var result = Array(repeating: 0, count: inDegree.count)
        var que = Queue<(node:Int, term:Int)>()
        
        for i in 1..<inDegree.count{
            if inDegree[i] == 0 {que.add(n: (node:i, term:1)) }
        }
        
        while !que.empty(){
            let now = que.pop()!
            result[now.node] = now.term
            
            graph[now.node].forEach{
                inDegree[$0] -= 1
                
                if inDegree[$0] == 0 { que.add(n: (node:$0, term: now.term+1)) }
            }
        }
        
        print(result[1...].map{String($0)}.joined(separator: " "))
    }
}

struct Queue<T> {
    var queue: [T] = []
    var head = 0
    
    func size()->Int{
        return queue.count - head
    }
    
    func empty()->Bool{
        return size() > 0 ? false:true
    }
    
    func first()->T?{
        return empty() ? nil:queue[head]
    }
    
    func last()->T?{
        return empty() ? nil:queue.last
    }
    
    mutating func add(n:T){
        queue.append(n)
    }
    
    mutating func pop() -> T? {
        guard !empty() else{
            return nil
        }
        
        let result = queue[head]
        head+=1
        return result
    }
}
