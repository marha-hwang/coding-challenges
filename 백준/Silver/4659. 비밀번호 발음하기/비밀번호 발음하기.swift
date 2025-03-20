import Foundation

Q4659().main()
class Q4659{
    let moeum:Set<Character> = ["a", "e", "i", "o", "u"]
    func main(){
        var arr:[String] = []
        while let input = readLine(){
            
            if input == "end" { break}
            
            arr.append(input)
        }
        
        solution(arr: arr)
    }
    
    func solution(arr:[String]){
        for str in arr{
            
            //a e i o u중 한개를 포함조건 검증
            if !isContainMoeum(str: str){
                print("<\(str)> is not acceptable.")
                continue
            }
            
            //ee, oo를 제외하고는 2개연속 불가조건 검증
            if checkDuplicate(str: str){
                print("<\(str)> is not acceptable.")
                continue
            }
            
            //모음, 자음 3개연속 불가조건 검증
            if checkDuplicateType(str: str){
                print("<\(str)> is not acceptable.")
                continue
            }
            
            print("<\(str)> is acceptable.")
        }
    }
    
    private func isContainMoeum(str:String)->Bool{
        var result = false
        
        for c in str{
            if moeum.contains(c){
                result = true
                break
            }
        }
        return result
    }
    
    private func checkDuplicate(str:String)->Bool{
        var result = false
        
        for i in 0..<str.count-1{
            let now = str[str.index(str.startIndex, offsetBy: i)]
            let next = str[str.index(str.startIndex, offsetBy: i+1)]
            
            if now != "e" && now != "o" && now == next{
                result = true
                break
            } 
        }
        
        return result
    }
    
    private func checkDuplicateType(str:String)->Bool{
        var result = false
        
        guard str.count > 1 else{
            if moeum.contains(Character(str)) { return false}
            else { return true}
        }
        
        for i in 0..<str.count-2{
            let now = str[str.index(str.startIndex, offsetBy: i)]
            let next = str[str.index(str.startIndex, offsetBy: i+1)]
            let nnext = str[str.index(str.startIndex, offsetBy: i+2)]

            
            if moeum.contains(now) == moeum.contains(next) && moeum.contains(next) == moeum.contains(nnext){
                result = true
                break
            } 
        }
        
        return result
    }
}

