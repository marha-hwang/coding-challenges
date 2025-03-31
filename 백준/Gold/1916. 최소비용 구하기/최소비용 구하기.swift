import Foundation

Q1916().main()

class Q1916{
    func main(){
        let cityCount = Int(readLine()!)! //도시개수
        let roadCount = Int(readLine()!)! //노선개수
        
        var graph:[[(Int, Int)]] = Array(repeating: [], count: cityCount+1)
        
        for _ in 0..<roadCount{
            let input = readLine()!.split(separator: " ").map{ Int($0)!}
            let start = input[0], end = input[1], cost = input[2] 
            graph[start].append((end, cost))
        }
        
        let input = readLine()!.split(separator: " ").map{Int($0)! }
        let start = input[0], end = input[1] 
        
        solution(start: start, end: end, graph: graph)
    }
    
    func solution(start:Int, end:Int, graph:[[(Int, Int)]]){
        var distance = Array(repeating: Int.max, count: graph.count+1)
        var visit = Array(repeating: false, count: graph.count+1)
        
        var pq = PriorityQueue<(Int, Int)>{ $0.1 < $1.1}
        pq.add((start, 0))
        
        while !pq.isEmpty{
            let (now, cost) = pq.poll()!
            
            if visit[now] { continue }
            
            visit[now] = true
            distance[now] = cost
            
            for node in graph[now]{
                if visit[node.0] { continue }
                
                let next = (node.0, distance[now] + node.1)
                pq.add(next)
            }
            
        }
        
        print(distance[end])
    }
}


struct PriorityQueue<T>{
    private var elements:[T] = []
    private var compare:(T, T) -> Bool
    
    init(_ compare:@escaping(T, T) -> Bool){
        self.compare = compare
    }
    
    func parent(_ index:Int) -> Int{
        return index/2
    }
    
    func leftChild(_ index:Int) -> Int{
        return index*2
    }
    
    func rightChild(_ index:Int) -> Int{
        return index*2+1
    }
    
    var isEmpty:Bool{
        return elements.count < 2
    }
    
    var count:Int{
        if elements.count < 2 { return 0 }
        return elements.count-1
    }
    
    var peek:T?{
        if elements.count < 2{ return nil }
        return elements[1]
    }
    
    mutating public func add(_ element:T){
        if elements.count == 0{
            elements.append(element)
        }
        elements.append(element)
        
        var index = elements.count-1
        while index != 1 && compare(elements[index], elements[parent(index)]){
            elements.swapAt(index, parent(index))
            index = parent(index)
        }
        
    }
    
    mutating public func poll() -> T?{
        guard elements.count > 1 else{
            return nil
        }
        
        elements.swapAt(1, elements.count-1)
        let result = elements.remove(at: elements.count-1)
        down(1)
        return result
    }
    
    mutating func down(_ index:Int) {
        guard leftChild(index) < elements.count else{
            return
        }
        
        var swapIndex = index
        if compare(elements[leftChild(index)], elements[index]){
            swapIndex = leftChild(index)
        }
        if rightChild(index) < elements.count && compare(elements[rightChild(index)], elements[swapIndex]){
            swapIndex = rightChild(index)
        }
        
        if swapIndex != index{
            elements.swapAt(index, swapIndex)
            down(swapIndex)
        }
        
    }
    
}

