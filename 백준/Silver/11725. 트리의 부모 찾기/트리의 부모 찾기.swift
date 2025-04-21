
Q11725().main()
class Q11725{
    func main(){
        let n = Int(readLine()!)!
        var graph:[[Int]] = Array(repeating: [], count: n+1)
        for _ in 0..<n-1{
            let split = readLine()!.split(separator: " ").map{Int($0)!}
            graph[split[0]].append(split[1])
            graph[split[1]].append(split[0])
        }
        
        solution(graph)
    }
    
    var graph = [[Int]]()
    var visited = [Bool]()
    var parents = [Int]()
    func solution(_ graph:[[Int]]){
        self.graph = graph 
        visited = Array(repeating: false, count: graph.count)
        parents = Array(repeating: 0, count: graph.count)
        
        dfs(parent: 0, 1)
        
        parents[2...].forEach{ print($0)}
    }
    
    private func dfs(parent:Int, _ node:Int){
        if visited[node] {
            return
        }
        
        visited[node] = true
        parents[node] = parent
        
        
        for n in graph[node]{
            dfs(parent:node, n)
        }
    }
}