import Foundation

let n = Int(readLine()!)!

var pq = PriorityQueue({(new:Int, old:Int) in new > old})
for _ in 0..<n{
    let x = Int(readLine()!)!
    if x == 0{
        if(pq.isEmpty){
            print("0")
        }
        else {
            print(pq.poll()!)
        }
    }
    else {
        pq.add(x)
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
