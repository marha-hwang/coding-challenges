
import Foundation
Q16171().main()

class Q16171{
    func main(){
        let origin = readLine()!
        let find = readLine()!
        
        solution(origin: origin, find: find)
    }
    
    func solution(origin:String, find:String){
        //문자열을 순회하면서 숫자인 경우 제거
        let replace = origin.filter{
            $0.isNumber == true ? false : true
        }
        print(String(replace).contains(find) ? 1 : 0)
    }
}