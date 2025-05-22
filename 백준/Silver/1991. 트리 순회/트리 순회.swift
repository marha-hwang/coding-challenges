import Foundation
Q1991().main()
class Q1991{
    var tree = [String:[String]]()
    var result:[String] = []
    func main(){
        let n = Int(readLine()!)!
        
        for _ in 0..<n{
            let input = readLine()!.split(separator: " ").map{ String($0)}
            tree[input[0]] = [input[1], input[2]]
        }
        
        solution(tree: tree)
    }
    
    func solution(tree:[String:[String]]){
        preorder(now: "A")
        printResult()
        
        inorder(now: "A")
        printResult()
        
        postorder(now: "A")
        printResult()
    }
    
    /*
     1.이진트리는 사이클이 절대 발생하지 않기 때문에 종료조건이 필요없음
     2.이진트리는 탐색을 할 수록 자동으로 종료조건에 가까워지므로 종료에 가까워지기 위한 로직이 필요없음
     */
    func preorder(now:String){
        
        result.append(now)
        if tree[now]![0] != "." { preorder(now: tree[now]![0]) }
        if tree[now]![1] != "." { preorder(now: tree[now]![1]) }
    }
    
    func inorder(now:String){
        
        if tree[now]![0] != "." { inorder(now: tree[now]![0]) }
        result.append(now)
        if tree[now]![1] != "." { inorder(now: tree[now]![1]) }
    }
    
    func postorder(now:String){
        
        if tree[now]![0] != "." { postorder(now: tree[now]![0]) }
        if tree[now]![1] != "." { postorder(now: tree[now]![1]) }
        result.append(now)
    }
    
    func printResult(){
        result[0..<result.count-1].forEach{
            print($0, terminator: "")
        }
        print(result[result.count-1])
        
        result = []
    }
}