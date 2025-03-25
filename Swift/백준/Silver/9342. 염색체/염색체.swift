import Foundation

Q9342().main()

class Q9342{
    func main(){
        let n = Int(readLine()!)!
        var arr:[String] = []
        for _ in 0..<n{
            arr.append(readLine()!)
        }
        solution(arr: arr)
        
    }
    
    func solution(arr:[String]){
        
        for str in arr{
            
            let strArr = Array(str)
            
            var start = 0
            var end = strArr.count-1
            //처음과 마지막 문자 확인
            if !"ABCDEF".contains(strArr[0]) || !"ABCDEF".contains(strArr[strArr.count-1]){
                print("Good")
                continue
            }
            
            if strArr[0] != "A"{
                start += 1
            }
            
            if strArr[strArr.count-1] != "C"{
                end -= 1
            }
            
            var temp = [strArr[start]]
            start += 1
            while start <= end{
                if strArr[start] != strArr[start-1]{
                    temp.append(strArr[start])
                }
                start += 1
            }
            
            print(String(temp) == "AFC" ? "Infected!" : "Good")
            
        }
    }
}
