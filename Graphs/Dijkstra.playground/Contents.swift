import Foundation


//3. Dijkstra for the Data Structures Representation


class Node: Equatable {
    var value: Int?
    var visited: Bool?
    var pathValue: Int = Int.max
    var links: [Link] = []
    init(value: Int) {
        self.value = value
        self.visited = false
    }
    init() {}
    
    
}

func ==(lhs: Node, rhs: Node) -> Bool {
    return lhs.value == rhs.value && lhs.pathValue == rhs.pathValue
}

class Link {
    var to: Node
    var weight: Int
    init(to: Node, weight: Int) {
        self.to = to
        self.weight = weight
    }
}

class GraphData {
    var arrNodes = [Node]()
    
    func add(value: Int) -> Node {
        let newNode = Node(value: value)
        arrNodes.append(newNode)
        return newNode
    }
    
    func addLink(from: Node, to: Node, weight: Int, weightBack: Int?) {
        from.links.append(Link(to: to, weight: weight))
        if let weightBack = weightBack {
            to.links.append(Link(to: from, weight: weightBack))
        }
    }
    
    
    func Dijkstra() {
        arrNodes[0].pathValue = 0
        func Dijkstra(head: Node) {
            var minNodes = Node()
            for i in 0..<arrNodes.count {
                if arrNodes[i].pathValue < minNodes.pathValue && !arrNodes[i].visited! {
                    minNodes = arrNodes[i]
                }
            }
            minNodes.visited = true
            var minNext = Node()
            for i in minNodes.links {
                if (i.to.pathValue > minNodes.pathValue + i.weight) && !i.to.visited! {
                        i.to.pathValue = minNodes.pathValue + i.weight
                    if i.to.pathValue < minNext.pathValue {
                        minNext = i.to
                    }
                }
            }
            guard minNext.visited != nil else {
                return
            }
            return Dijkstra(head: minNext)
        }
        return Dijkstra(head: arrNodes[0])
    }
}


/*
var test = GraphData()
var head = test.add(value: 1)
var sN = test.add(value: 2)
var tN = test.add(value: 3)
var zN = test.add(value: 4)
var xN = test.add(value: 5)
var yN = test.add(value: 6)
test.addLink(from: head, to: sN, weight: 10, weightBack: 10)
test.addLink(from: head, to: tN, weight: 7, weightBack: 7)
test.addLink(from: sN, to: zN, weight: 1, weightBack: 5)
test.addLink(from: sN, to: xN, weight: 5, weightBack: 5)
test.addLink(from: tN, to: yN, weight: 3, weightBack: 7)
test.addLink(from: tN, to: xN, weight: 13, weightBack: 13)
test.addLink(from: xN, to: yN, weight: 2, weightBack: nil)
test.Dijkstra()
head.pathValue
sN.pathValue
tN.pathValue
zN.pathValue
xN.pathValue
yN.pathValue
*/


