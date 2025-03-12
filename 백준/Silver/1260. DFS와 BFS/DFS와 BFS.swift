import Foundation

Dfs().main()

class Dfs{
    
    var visit:[Bool]!
    var graph:[[Int]]!
    
    public func main(){
        let input = readLine()!.split(separator: " ").map{ Int($0)!}
        let n = input[0], m = input[1], v = input[2]
        
        graph = Array(repeating: [], count: n+1)
        
        for _ in 0..<m{
            let edge = readLine()!.split(separator: " ").map{ Int($0)! }
            let s = edge[0], e = edge[1]
            graph[s].append(e)
            graph[e].append(s)
        }
        
        graph = graph.map{ $0.sorted{ $0 < $1} }
        
        visit = Array(repeating: false, count: n+1)
        dfs(now:v)
        
        print()
        visit = Array(repeating: false, count: n+1)
        bfs(now:v)
    }
    
    private func dfs(now:Int){
        //종료조건
        if visit[now] == true { return }
        
        //종료 접근조건
        visit[now] = true
        print(now, terminator: " ")
        
        for next in graph[now]{
            //재귀실행
            dfs(now:next)
        }
        
    }
    
    private func bfs(now:Int){
        var que = [now]
        visit[now] = true
        
        while !que.isEmpty{
            let now = que.removeFirst()
            print(now, terminator: " ")
            
            for next in graph[now]{
                if !visit[next] {
                    que.append(next)
                    visit[next] = true
                }
            }
        }
    }
}
