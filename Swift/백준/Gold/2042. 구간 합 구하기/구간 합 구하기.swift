import Foundation
Q2042().main()
class Q2042{
    func main(){
        let input = readLine()!.split(separator: " ").map{ Int($0)!}
        let N = input[0], M = input[1], K = input[2]
        var arr = [Int]()
        for _ in 0..<N{
            arr.append(Int(readLine()!)!)
        }
        
        let segmentTree = SegmentTree(arr: arr)
        
        for _ in 1...M+K{
            let input = readLine()!.split(separator: " ").map{ Int($0)!}
            let a = input[0], b = input[1], c = input[2]
            switch a{
            case 1:
                segmentTree.update(target: b-1, value: c)
            case 2:
                print(segmentTree.query(l: b-1, r: c-1))
            default:
                break
            }
        }
        
    }
    
    
}

class SegmentTree{
    var arr:[Int]
    var tree:[Int]
    
    init(arr: [Int]) {
        self.arr = arr
        self.tree = Array(repeating: 0, count: arr.count * 4)
        build(node: 1, s: 0, e: arr.count-1)
    }
    
    private func build(node:Int, s:Int, e:Int){
        if s == e {
            tree[node] = arr[s]
            return
        }
        
        let mid = (s+e)/2
        let left = node*2
        let right = node*2+1
        build(node: left, s: s, e: mid)
        build(node: right, s: mid+1, e: e)
        
        tree[node] = tree[left]+tree[right]
    }
    
    func query(l:Int, r:Int)->Int{
        query(node: 1, s: 0, e: arr.count-1, l: l, r: r)
    }
    
    //s, e : 현재 노드가 포함하는 원본데이터의 범위
    //l, r : 구해야 할 구간합의 범위
    private func query(node:Int, s:Int, e:Int, l:Int, r:Int)->Int{
        if s > r || e < l{ return 0 } //현재 노드가 구해야 할 범위를 완전히 벗어나는 경우
        if s >= l && e <= r { return tree[node] } // 현재노드가 구해야 할 범위를 모두 포함하는 경우
        
        let mid = (s+e)/2
        let left = node*2
        let right = node*2+1
        
        let ll = query(node: left, s: s, e: mid, l: l, r: r)
        let rr = query(node: right, s: mid+1, e: e, l: l, r: r)
        
        return ll+rr
    }
    
    func update(target:Int, value:Int){
        let _ = update(node: 1, s: 0, e: arr.count-1, target: target, value: value)
    }
    
    private func update(node:Int, s:Int, e:Int, target:Int, value:Int)->Int{
        if s > target || e < target { return 0 } //현재 노드가 구해야 할 범위를 완전히 벗어나는 경우
        if s == e && s == target{
            let gap = value-tree[node]
            tree[node] = value
            return gap
        }
        
        let mid = (s+e)/2
        let left = node*2
        let right = node*2+1
        
        let l = update(node: left, s: s, e: mid, target: target, value: value)
        let r = update(node: right, s: mid+1, e: e, target: target, value: value)
        tree[node] = tree[node]+l+r
        
        return l+r
    }
    
    
}
