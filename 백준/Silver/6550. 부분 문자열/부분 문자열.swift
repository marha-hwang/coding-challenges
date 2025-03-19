        while let str = readLine(){
            let sub = Array(String(str.split(separator: " ")[0]))
            let main = Array(String(str.split(separator: " ")[1]))
            
            var find = 0
            for ch in main where find < sub.count{
                if ch == sub[find]{ find += 1}
            }
            
            if find >= sub.count {
                print("Yes")
            }
            else{
                print("No")
            }
        }