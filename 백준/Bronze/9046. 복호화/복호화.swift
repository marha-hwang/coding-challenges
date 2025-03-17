import Foundation
Q9046().main()

import Foundation

class Q9046{
    func main(){
        let n = Int(readLine()!)!
        var arr:[String] = []
        for i in 0..<n{
            arr.append(readLine()!)
        }
        solution(arr: arr)
    }
    
    func solution(arr:[String]){
        
        arr.forEach{
            var dict:[Character:Int] = [:]
            $0.forEach{ char in
                
                guard char != " " else{return}
                
                if dict[char] == nil{ dict[char] = 1 }
                else { dict[char]! += 1 }
            }
            
            let max = dict.max{ $0.value < $1.value }!
            let result = dict.filter{ $0.value == max.value }
            
            
            if result.count > 1 {print("?")}
            else {print(result.first!.key)}
        }
    }
}
