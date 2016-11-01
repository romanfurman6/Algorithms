import Foundation

//1. Array representation
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
/*
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


//2. Linked Nodes representation


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

}
/*
var test = GraphNode()
var firstNode = test.add(value: 1)
var secondNode = test.add(value: 2)
var thirdNode = test.add(value: 3)
test.addLink(first: firstNode, second: secondNode)
test.addLink(first: secondNode, second: thirdNode)
test.addLink(first: firstNode, second: thirdNode)

for i in 0..<test.arr.count {
    var z = test.arr[i].childs
    for x in 0...z.count-1 {
        print("\(test.arr[i].value) --> \(z[x].value)")
    }
}
*/
 
//3. Data Structures Representation

class NodeData {
    var value: Int
    var links: [Link] = []
    init(value: Int) {
        self.value = value
    }
    
}

class Link {
    var from: NodeData
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
/*
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





