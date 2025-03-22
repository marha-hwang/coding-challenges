import Foundation
Q1316().main()
class Q1316{
    func main(){
        let n = Int(readLine()!)!
        var arr:[String] = []
        for _ in 0..<n{
            arr.append(readLine()!)
        }
        
        solution(arr: arr)
    }
    
    func solution(arr:[String]){
        var result = 0
        arr.forEach{
            if isGroup(str: $0){ result += 1}
        }
        print(result)
    }

    private func isGroup(str:String)->Bool{
        var result = true
        var cSet:Set<Character> = []
        
        let temp = Array(str)
        for i in 0..<temp.count{
            //특정문자가 처음 나온 경우
            if !cSet.contains(temp[i]){
                cSet.insert(temp[i])
            }
            //특정문자가 다시 나온 경우
            else {
                if temp[i-1] != temp[i]{
                    result = false
                    break
                }
            }
        }
        
        
        return result
    }
}
