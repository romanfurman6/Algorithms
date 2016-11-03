import Foundation

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
    var head: Node
    var stack: [Node] = []

    
    init(valueOfHead: Int) {
        self.head = Node(value: valueOfHead)
    }
    func add(value: Int) -> Node {
        let newNode = Node(value: value)
        return newNode
    }
    
    func addLink(first: Node, second: Node, feedback: Bool) {
        first.childs.append(second)
        if feedback {
            second.childs.append(first)
        }
    }
    
    func resetVisits() {
        func reset(head: Node) {
            for i in 0..<head.childs.count {
                if head.childs[i].visited {
                    stack.append(head.childs[i])
                    head.childs[i].visited = false
                }
            }
            if stack.isEmpty {
                return
            }
            return reset(head: stack.removeLast())
        }
        head.visited = false
        return reset(head: head)
    }

    func DFS(key: Int) -> Bool {
        
        func DFS(key: Int, head: Node) -> Bool {
            print("take head with value: \(head.value)")
            
            
            if head.value == key {
                return true
            }
            for i in 0..<head.childs.count {
                
                if !head.childs[i].visited {
                    stack.append(head.childs[i])
                    head.childs[i].visited = true
                }
            }
            if stack.isEmpty {
                return false
            }
            return DFS(key: key, head: stack.removeLast())
        }
        
        head.visited = true
        let result = DFS(key: key, head: head)
        resetVisits()
        return result
    }
}
var test = GraphNode(valueOfHead: 1)
var fN = test.head
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
test.DFS(key: 6)
test.DFS(key: 7)
test.DFS(key: 2)
test.DFS(key: 8)
test.DFS(key: 5)

