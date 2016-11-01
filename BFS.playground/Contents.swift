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

import Foundation
class Queue {
    
    var container: [Int] = []
    
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
    var topElem: Int? {
        get {
            return isEmpty ? nil : (container.last)!
        }
    }
    var botElem: Int? {
        get {
            return isEmpty ? nil : (container.first)!
        }
    }
    func dequeue() -> Int? {
        
        return isEmpty ? nil : (container.removeFirst())
    }
    func enqueue(x: Int) {
        return container.append(x)
    }
}

//1.1 Implement BFS for the Matrix Graph

class GraphArr {
    var arrOfValues: [Int] = []
    var arrOfLinks: [[Int]] = []
    var visited: [Bool] = []
    var queueOfIndex = Queue()
    var count: Int
    init(count: Int) {
        self.count = count
        self.visited = [Bool](repeatElement(false, count: count))
    }
    func addElem(value: Int) {
        arrOfValues.append(value)
        arrOfLinks.append(Array(repeatElement(0, count: count)))
        
        
    }
    
    func addLink(fromIndex: Int, toIndex: Int, feedback: Bool) {
        arrOfLinks[toIndex][fromIndex] = 1
        if feedback {
            arrOfLinks[fromIndex][toIndex] = 1
        }
    }
    
    func isVisited(i: Int) -> Int? {
        
        if visited[i] {
            if !queueOfIndex.isEmpty {
                return isVisited(i: queueOfIndex.dequeue()!)
            } else {
                return nil
            }
        }
        
        return i
    }
    
    func BFS(key: Int, indexOfHead: Int) -> Bool {
        print("take head: \(arrOfValues[indexOfHead])")
        if key == arrOfValues[indexOfHead] {
            return true
        }
        
        for i in 0..<arrOfLinks[indexOfHead].count {
            if arrOfLinks[indexOfHead][i] == 1 {
                print("found childs: \(arrOfValues[i])")
                visited[indexOfHead] = true
                queueOfIndex.enqueue(x: i)
            }
        }
        if queueOfIndex.isEmpty {
            return false
        }
        for _ in 0..<queueOfIndex.sizeOfContainer-1 {
            let i = queueOfIndex.dequeue()!
            let index = isVisited(i: i)
            if index == nil {
                return false
            }
            
            return BFS(key: key, indexOfHead: index!)
            
        }
        return false
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
var obj = GraphArr(count: 6)
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

obj.BFS(key: 2, indexOfHead: 0)
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
DFS for the linked and Dijkstra for the last one
*/


