import Foundation
Q1197().main()
class Q1197{
    func main(){
        let split = readLine()!.split(separator: " ").map{ Int($0)!}
        let V = split[0], E = split[1]
        
        var edges:[(s:Int, e:Int, v:Int)] = []
        for _ in 0..<E{
            let split = readLine()!.split(separator: " ").map{ Int($0)!}
            edges.append((s:split[0], e:split[1], v:split[2]))
        }
        
        edges.sort{ $0.v < $1.v }
        solution(V: V, edges: edges)
    }
    
    var parents = [Int]()
    func solution(V:Int, edges:[(s:Int, e:Int, v:Int)]){
        for i in 0...V { parents.append(i)}
        
        var sum = 0
        var edgeCount = 0
        
        for edge in edges {
            guard edgeCount < V-1 else { break }
            guard find(edge.s) != find(edge.e) else { continue }
            
            union(a: edge.s, b: edge.e)
            edgeCount += 1
            sum += edge.v
        }
        
        print(sum)
    }
    
    private func union(a:Int, b:Int){
        if find(a) != find(b) {
            parents[find(a)] = find(b)
        }
    }
    
    private func find(_ a:Int)->Int{
        if parents[a] == a { return a }
        parents[a] = find(parents[a])
        return parents[a]
    }
}
