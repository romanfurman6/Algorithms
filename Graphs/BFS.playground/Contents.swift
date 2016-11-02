import Foundation

//1 Implement BFS for the Matrix Graph

/*
class GraphArr {
    var arrOfValues: [Int] = []
    var arrOfLinks: [[Int]] = []
    
    
    func addElem(value: Int) {
        arrOfValues.append(value)
        arrOfLinks.append(Array(repeatElement(0, count: arrOfValues.count-1)))
        arrOfLinks = arrOfLinks.map({ $0 + [0] })
    }
    
    func addLink(fromIndex: Int, toIndex: Int, feedback: Bool) {
        arrOfLinks[toIndex][fromIndex] = 1
        if feedback {
            arrOfLinks[fromIndex][toIndex] = 1
        }
    }
    
    
    func BFS(key: Int) -> Bool {
        var visited = [Bool](repeatElement(false, count: arrOfValues.count))
        var queue: [Int] = []
        
        func isVisited(i: Int) -> Int? {
            
            if !visited[i] {
                return i
            }
            if !queue.isEmpty {
                return isVisited(i: queue.removeFirst())
            }
            return nil
        }
        func BFS(key: Int, indexOfHead: Int) -> Bool {
            
            print("take head: \(arrOfValues[indexOfHead])")
            if key == arrOfValues[indexOfHead] {
                return true
            }
            
            for i in 0..<arrOfLinks[indexOfHead].count {
                if arrOfLinks[indexOfHead][i] == 1 {
                    print("found childs: \(arrOfValues[i])")
                    queue.append(i)
                    visited[indexOfHead] = true
                }
            }
            
            for _ in 0..<queue.count {
                guard let index = isVisited(i: queue.removeFirst()) else {
                    return false
                }
                return BFS(key: key, indexOfHead: index)
            }
            return false
        }
        return BFS(key: key, indexOfHead: 0)
    }
    

    
    func printGraph() {
        let newArr: [String] = arrOfValues.map{ String($0) }
        
        print( "   " + newArr.joined(separator: "  "))
        for i in 0..<arrOfValues.count {
            let newArrLinks: [String] = arrOfLinks[i].map{ String($0) }
            let n = newArrLinks.joined(separator: "  ")
            print("\(arrOfValues[i])| \(n)")
        }
    }
}
var obj = GraphArr()
obj.addElem(value: 1)
obj.addElem(value: 2)
obj.addElem(value: 3)
obj.addElem(value: 4)
obj.addElem(value: 5)
obj.addElem(value: 6)
obj.addLink(fromIndex: 0, toIndex: 1, feedback: true)
obj.addLink(fromIndex: 0, toIndex: 2, feedback: true)
obj.addLink(fromIndex: 2, toIndex: 4, feedback: true)
obj.addLink(fromIndex: 2, toIndex: 3, feedback: true)
obj.addLink(fromIndex: 1, toIndex: 5, feedback: true)
obj.addLink(fromIndex: 1, toIndex: 4, feedback: true)

//take head: 1
//found childs: 2
//found childs: 3
//take head: 2
//true
*/
