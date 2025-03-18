import Foundation

Q20154().main()
class Q20154{
    func main(){
        let str = readLine()!
        solution(str: str)
    }
    
    func solution(str:String){
        //문자 딕셔너리 만들기
        let charDict = ["A":3, "B":2, "C":1, "D":2, "E":3, "F":3, "G":3, "H":3, "I":1, "J":1, "K":3, "L":1, "M":3, "N":3, "O":1, "P":2, "Q":2, "R":2, "S":1, "T":2, "U":1, "V":1, "W":2, "X":2, "Y":2, "Z":1]
        
        var result = str.map{ charDict[String($0)]!}
        
        while result.count > 1{
            let value = result.count/2
            let remain = result.count%2 == 1 ? true:false
            
            var temp:[Int] = []
            for i in 0..<value{
                let sum = result[i*2] + result[i*2+1]
                temp.append(sum>=10 ? sum%10:sum)
            }
            
            if remain { temp.append(result.last!)}
            result = temp
        }
        
        print(result[0]%2 > 0 ? "I'm a winner!":"You're the winner?")
        
    }
}