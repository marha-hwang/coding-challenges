import Foundation
Q1976().main()

class Q1976{
    var arr = [Int]()
    func main(){
        let n = Int(readLine()!)!, m = Int(readLine()!)!
        arr = [Int]()
        for i in 0...n{
            arr.append(i)
        }
        
        for i in 1...n{
            let split = readLine()!.split(separator:  " ")
            for j in 1...n{
                if split[j-1] == "1"{
                    union(i, j)
                }
            }
        }
        
        let visitCities = readLine()!.split(separator: " ").map{ Int($0)!}
        let root = find(visitCities[0])
        
        for city in visitCities[1...]{
            if find(city) != root {
                print("NO")
                return
            }
        }
        print("YES")
    }
    
    private func find(_ i:Int)->Int{
        if i == arr[i] { return i }
        
        arr[i] = find(arr[i])
        return arr[i]
    }
    
    private func union(_ i:Int, _ j:Int){
        if find(i) != find(j){
            arr[find(i)] = find(j)
        }
    }
}
