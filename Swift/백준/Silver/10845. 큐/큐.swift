Q18258().main()

class Q18258{
    func main(){
        let n = Int(readLine()!)!
        var arr:[String] = []
        for _ in 0..<n{
            arr.append(readLine()!)
        }
        solution(arr: arr)
    }
    
    func solution(arr:[String]){
        var que = Queue()
        for str in arr{
            let split = str.split(separator: " ")
            switch split[0] {
            case "push":
                que.add(n:Int(split[1])!)
            case "pop":
                print(que.pop() ?? -1)
            case "size":
                print(que.size())
            case "empty":
                print(que.size() == 0 ? 1:0)
            case "front":
                print(que.first() ?? -1)
            case "back":
                print(que.last() ?? -1)
            default:
                print()
            }
        }
    }
}


struct Queue {
    var queue: [Int] = []
    var head = 0
    
    func size()->Int{
        return queue.count - head
    }
    
    func empty()->Bool{
        return size() > 0 ? false:true
    }
    
    func first()->Int?{
        return empty() ? nil:queue[head]
    }
    
    func last()->Int?{
        return empty() ? nil:queue.last
    }
    
    mutating func add(n:Int){
        queue.append(n)
    }
    
    mutating func pop() -> Int? {
        guard !empty() else{
            return nil
        }
        
        let result = queue[head]
        head+=1
        return result
    }
}