import Foundation

Q11365().main()
class Q11365{
    func main(){
        
        var arr:[String] = []
        while true{
            let str = readLine()!
            
            if str == "END" {break}
            arr.append(str)
        }
        
        solution(arr: arr)
    }
    
    func solution(arr:[String]){
        for str in arr{
            print(String(str.reversed()))
        }
    }
}