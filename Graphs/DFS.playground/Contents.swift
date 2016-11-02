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
    
    var arr: [Node] = []
    func add(value: Int) -> Node {
        let newNode = Node(value: value)
        arr.append(newNode)
        return newNode
    }
    func newSearch() { //bred :D
        for i in 0..<arr.count {
            arr[i].visited = false
        }
    }
    func addLink(first: Node, second: Node, feedback: Bool) {
        first.childs.append(second)
        if feedback {
            second.childs.append(first)
        }
    }
    func DFS(key: Int) -> Bool {
        newSearch()
        var stack: [Node] = []
        
        func DFS(key: Int, head: Node) -> Bool {
            print("take head with value: \(head.value)")
            if !head.visited {
                head.visited = true
                stack.append(head)
            }
            if stack.isEmpty {
                return false
            }
            if head.value == key {
                return true
            }
            for i in 0..<head.childs.count {
                
                if !head.childs[i].visited {
                    return DFS(key: key, head: head.childs[i])
                }
            }
            return DFS(key: key, head: stack.removeLast())
        }
        return DFS(key: key, head: arr[0])
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
test.DFS(key: 6)
test.DFS(key: 7)
test.DFS(key: 2)

