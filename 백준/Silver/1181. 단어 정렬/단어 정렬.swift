Q1181().main()

class Q1181{
                        
    func main(){
        let n = Int(readLine()!)!

        var set:Set<String> = []
        
        for _ in 0..<n{
            set.insert(readLine()!)
        }
        
        solution(arr: set)
    }
    
    func solution(arr:Set<String>){
        arr.sorted{
            if $0.count < $1.count { return true}
            else if $0.count > $1.count { return false}
            else { return $0 < $1 }
        }.forEach{
            print($0)
        }
    }
}
