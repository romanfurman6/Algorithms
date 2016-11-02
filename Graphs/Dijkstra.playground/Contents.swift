import Foundation


//3. Dijkstra for the Data Structures Representation


class Node {
    var value: Int
    var visited: Bool
    var pathValue: Int = 0
    var links: [Link] = []
    init(value: Int) {
        self.value = value
        self.visited = false
    }
    
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
    var head: Node
    var queue: [Node] = []
    
    init(valueOfHead: Int) {
        self.head = Node(value: valueOfHead)
        head.pathValue = 0
    }
    
    func add(value: Int) -> Node {
        return Node(value: value)
    }
    
    func addLink(from: Node, to: Node, weight: Int , weightBack: Int?, feedback: Bool) {
        from.links.append(Link(to: to, weight: weight))
        if feedback && weightBack != nil {
            to.links.append(Link(to: from, weight: weightBack!))
        }
    }
    
    func isVisited(node: Node) -> Node? {
        
        if !node.visited {
            return node
        }
        if !queue.isEmpty {
            return isVisited(node: queue.removeFirst())
        }
        return nil
    }
    
    func Dijkstra() {
        func Dijkstra(head: Node) {
            
            
            for i in 0..<head.links.count {
                if !head.links[i].to.visited {
                    print("\(head.value)")
                    if head.links[i].to !== head {
                        queue.append(head.links[i].to)
                        let node = head.links[i].to
                        node.visited = true
                    }
                }
            }
            for _ in 0..<queue.count {
                guard let node = isVisited(node: queue.removeFirst()) else {
                    return
                }
                return Dijkstra(head: node)
            }

        }
        return Dijkstra(head: head)
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
test.Dijkstra()