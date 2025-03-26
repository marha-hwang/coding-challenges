import Foundation

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
        var que:[Int] = []
        for str in arr{
            let split = str.split(separator: " ")
            switch split[0] {
            case "push":
                que.append(Int(split[1])!)
            case "pop":
                if que.isEmpty{
                    print(-1)
                }
                else{
                    print(que.removeFirst())
                }
            case "size":
                print(que.count)
            case "empty":
                print(que.count == 0 ? 1:0)
            case "front":
                print(que.first ?? -1)
            case "back":
                print(que.last ?? -1)
            default:
                print()
            }
        }
    }
}
