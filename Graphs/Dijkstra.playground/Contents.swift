import Foundation

//3. Dijkstra for the Data Structures Representation


class NodeData {
    var value: Int
    var visited: Bool
    var links: [Link] = []
    init(value: Int) {
        self.value = value
        self.visited = false
    }
}

class Link {
    var to: NodeData
    var weight: Int
    init(to: NodeData, weight: Int) {
        self.to = to
        self.weight = weight
    }
}

class GraphData {
    var head: NodeData
    var numberOfNodes: Int {
        get {
            return self.numberOfNodes
        }
        set {
            self.numberOfNodes = newValue
        }
    }
    init(valueOfHead: Int) {
        self.head = NodeData(value: valueOfHead)
    }
    func add(value: Int) -> NodeData {
        self.numberOfNodes += 1
        return NodeData(value: value)
    }
    func addLink(from: NodeData, to: NodeData, weight: Int , weightBack: Int?, feedback: Bool) {
        from.links.append(Link(to: to, weight: weight))
        if feedback && weightBack != nil {
            to.links.append(Link(to: from, weight: weightBack!))
        }
    }
    func Dijkstra() -> Int {
        var pathValue: [Int] = []
        func DijkstraSearch(head: NodeData) -> Int {
            
//            for i in 0..<
            
            return 0
        }
        return DijkstraSearch(head: head)
    }
}

var test = GraphData(valueOfHead: 1)
var head = test.head
var sN = test.add(value: 2)
var tN = test.add(value: 3)
var zN = test.add(value: 4)
var xN = test.add(value: 5)
var yN = test.add(value: 6)
test.addLink(from: head, to: sN, weight: 10, weightBack: nil, feedback: true)
test.addLink(from: head, to: tN, weight: 7, weightBack: nil, feedback: true)
test.addLink(from: sN, to: zN, weight: 1, weightBack: 5, feedback: true)
test.addLink(from: sN, to: xN, weight: 5, weightBack: nil, feedback: true)
test.addLink(from: tN, to: yN, weight: 3, weightBack: 7, feedback: true)
test.addLink(from: tN, to: xN, weight: 13, weightBack: nil, feedback: false)
test.addLink(from: xN, to: yN, weight: 2, weightBack: nil, feedback: true)
//test.numberOfNodes
print(1234)

