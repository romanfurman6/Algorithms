import Foundation

//1. Array representation
/*
class GraphArr {
    var arrOfValues: [Int] = []
    var arrOfLinks: [[Int]] = []
    var count: Int
    init(count: Int) {
        self.count = count
    }
    func addElem(value: Int) {
        arrOfValues.append(value)
        arrOfLinks.append(Array(repeatElement(0, count: count)))
        if arrOfValues.count > arrOfLinks.count {
            arrOfLinks.append([])
        }
    }
    func addLink(fromIndex: Int, toIndex: Int) {
        arrOfLinks[toIndex][fromIndex] = 1
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
var obj = GraphArr(count: 3)
obj.addElem(value: 1)
obj.addElem(value: 2)
obj.addElem(value: 3)
obj.arrOfValues
obj.addLink(fromIndex: 0, toIndex: 1)
obj.addLink(fromIndex: 1, toIndex: 2)
obj.addLink(fromIndex: 0, toIndex: 2)
obj.printGraph()
*/

//1.1 Implement BFS for the Matrix Graph


class Queue<T> {
    
    var container: [T] = []
    
    var isEmpty: Bool {
        get {
            return container.isEmpty
        }
    }
    var sizeOfContainer: Int {
        get {
            return container.count
        }
    }
    var topElem: T? {
        get {
            return isEmpty ? nil : (container.last)!
        }
    }
    var botElem: T? {
        get {
            return isEmpty ? nil : (container.first)!
        }
    }
    func dequeue() -> T? {
        
        return isEmpty ? nil : (container.removeFirst())
    }
    func enqueue(x: T) {
        return container.append(x)
    }
}

//1.1 Implement BFS for the Matrix Graph

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
        var queue = Queue<Int>()
        
        func isVisited(i: Int) -> Int? {
            
            if !visited[i] {
                return i
            }
            if !queue.isEmpty {
                return isVisited(i: queue.dequeue()!)
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
                    queue.enqueue(x: i)
                    visited[indexOfHead] = true
                }
            }
            
            for _ in 0..<queue.sizeOfContainer-1 {
                guard let index = isVisited(i: queue.dequeue()!) else {
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

obj.BFS(key: 2)
//take head: 1
//found childs: 2
//found childs: 3
//take head: 2
//true







//2. Linked Nodes representation

/*
class Node {
    var value: Int
    var childs: [Node] = []
    init(value: Int) {
        self.value = value
    }
}

class GraphNode {
    
    var arr: [Node] = []
    
    func add(value: Int) -> Node {
        let newNode = Node(value: value)
        arr.append(newNode)
        return newNode
    }
    
    func addLink(first: Node, second: Node) {
        first.childs.append(second)
        second.childs.append(first)
    }
    func printGraph() {
        for i in 0..<arr.count {
            var z = arr[i].childs
            for x in 0...z.count-1 {
                print("\(arr[i].value) --> \(z[x].value)")
            }
        }
    }

}

var test = GraphNode()
var firstNode = test.add(value: 1)
var secondNode = test.add(value: 2)
var thirdNode = test.add(value: 3)
test.addLink(first: firstNode, second: secondNode)
test.addLink(first: secondNode, second: thirdNode)
test.addLink(first: firstNode, second: thirdNode)
test.printGraph()
*/

//2.1 DFS for the linked

class Node {
    var value: Int
    var childs: [Node] = []
    var visited: Bool = false
    init(value: Int) {
        self.value = value
    }
}

class GraphNode {
    
    var arr: [Node] = []
    var queue = Queue<Node>()
    func add(value: Int) -> Node {
        let newNode = Node(value: value)
        arr.append(newNode)
        return newNode
    }
    func addLink(first: Node, second: Node, feedback: Bool) {
        first.childs.append(second)
        if feedback {
            second.childs.append(first)
        }
    }
    
    func DFS(key: Int, head: Node) -> Bool {
        print("take node with value: \(head.value)")
        head.visited = true
        if head.value == key {
            return true
        }
        
        for i in 0..<head.childs.count {
            if !head.childs[i].visited {
                print("head have childs with value: \(head.childs[i].value)")
                head.childs[i].visited = true
                queue.enqueue(x: head.childs[i])
            }
        }
        
        if !queue.isEmpty {
            let node = queue.dequeue()
            return DFS(key: key, head: node!)
        }
        return false
    }
    
    
    func printGraph() {
        for i in 0..<arr.count {
            var z = arr[i].childs
            for x in 0...z.count-1 {
                print("\(arr[i].value) --> \(z[x].value)")
            }
        }
    }
}
var test = GraphNode()
var fN = test.add(value: 1)
var sN = test.add(value: 2)
var tN = test.add(value: 3)
var zN = test.add(value: 4)
var xN = test.add(value: 5)
var yN = test.add(value: 6)
test.addLink(first: fN, second: sN, feedback: true)
test.addLink(first: fN, second: tN, feedback: true)
test.addLink(first: sN, second: zN, feedback: true)
test.addLink(first: sN, second: xN, feedback: true)
test.addLink(first: tN, second: yN, feedback: true)
test.addLink(first: tN, second: zN, feedback: true)
//test.DFS(key: 6, head: fN)


//3. Data Structures Representation

/*
class NodeData {
    var value: Int
    var links: [Link] = []
    init(value: Int) {
        self.value = value
    }
    
}

class Link {
    var to: NodeData
    init(to: NodeData) {
        self.to = to
    }
}

class GraphData {
    var head: NodeData
    init(valueOfHead: Int) {
        self.head = NodeData(value: valueOfHead)
    }
    func add(value: Int) -> NodeData{
        return NodeData(value: value)
    }
    func addLink(from: NodeData, to: NodeData, feedback: Bool) {
        from.links.append(Link(to: to))
        if feedback {
            to.links.append(Link(to: from))
        }
        
    }
}

var test = GraphData(valueOfHead: 1)
var head = test.head
var fNode = test.add(value: 2)
var xNode = test.add(value: 3)
var zNode = test.add(value: 4)
test.addLink(from: head, to: fNode, feedback: true)
test.addLink(from: fNode, to: xNode, feedback: true)
print(head.links)
print(fNode.links)
print(xNode.links)
*/

/*
 and Dijkstra for the last one
*/


