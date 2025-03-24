import Foundation

Q1764().main()
class Q1764{
    func main(){
        let input = readLine()!.split(separator: " ")
        let n = Int(input[0])!, m = Int(input[1])!
        var arr1:[String] = []
        var arr2:[String] = []
        
        for _ in 0..<n{ arr1.append(readLine()!) }
        for _ in 0..<m{ arr2.append(readLine()!) }
        
        solution(arr1: arr1, arr2: arr2)
    }
    
    func solution(arr1:[String], arr2:[String]){
        var result:[String] = []
        let set1 = Set(arr1)
        
        arr2.forEach{
            if set1.contains($0) { result.append($0) }
        }
        
        result.sort{ $0 < $1}
        
        print(result.count)
        result.forEach{ print($0)}
    }
}