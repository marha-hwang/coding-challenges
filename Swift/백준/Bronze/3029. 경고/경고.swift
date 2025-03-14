Q3029().main()

import Foundation

class Q3029{
    
    func main(){
        let nowTime = readLine()!
        let waitTime = readLine()!
        
        solution(nowTime: nowTime, waitTime: waitTime)
    }
    
    func solution(nowTime:String, waitTime:String){
        var nowTimeArr = nowTime.split(separator: ":").map{Int($0)!}
        var waitTimeArr = waitTime.split(separator: ":").map{Int($0)!}
        
        var hour = 0, min = 0, sec = 0
        
        sec = waitTimeArr[2] - nowTimeArr[2]
        if sec < 0 {
            sec = 60+sec
            nowTimeArr[1] += 1
        }
        
        min = waitTimeArr[1] - nowTimeArr[1]
        if min < 0 {
            min = 60+min
            nowTimeArr[0] += 1
        }
        
        hour += waitTimeArr[0] - nowTimeArr[0]
        if hour < 0 {
            hour = 24+hour
        }
        
        let rhour = hour < 10 ? "0" + String(hour):String(hour)
        let rmin = min < 10 ? "0" + String(min):String(min)
        let rsec = sec < 10 ? "0" + String(sec):String(sec)
        
        let result = "\(rhour):\(rmin):\(rsec)"
        if result == "00:00:00" {print("24:00:00")}
        else {print("\(rhour):\(rmin):\(rsec)")}
    }
}
