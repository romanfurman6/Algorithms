import Foundation

//1. Implement Queue using Linked List

class Node<T> {
    
    var item: T
    var next: Node?
    var previous: Node?
    
    init(item: T) {
        self.item = item
    }
    func appendNode(newItem: T) {
        if next != nil {
            next?.appendNode(newItem: newItem)
        } else {
            next = Node(item: newItem)
            next?.previous = self
        }
    }
    func prependNode(newItem: T) {
        if previous != nil {
            previous?.prependNode(newItem: newItem)
            
        } else {
            previous = Node(item: newItem)
            previous?.next = self
        }
    }
    
    
}

class LinkedList<T>: CustomStringConvertible {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    func append(item: T) {
        let newNode = Node(item: item)
        if tail != nil {
            tail?.next = newNode
            newNode.previous = tail
            tail = newNode
        } else {
            head = Node(item: item)
            tail = head
        }
    }
    
    func prepend(item: T) {
        let newNode = Node(item: item)
        if head != nil {
            newNode.next = head
            head?.previous = newNode
            head = newNode
            
        } else {
            head = Node(item: item)
            tail = head
        }
    }
    
    func count() -> Int {
        if head == nil {
            return 0
        } else {
            var count = 0
            var next = head
            while next != nil {
                count+=1
                next = next!.next
            }
            return count
        }
        
    }
    
    func isEmptyList() -> Bool {
        return head == nil
    }
    
    func remove(index: Int) -> T? {
        let prevNode = getNode(index: index-1)
        let current = prevNode?.next
        if index == 0 {
            current?.next?.previous = nil
            head = head!.next
        } else if current === tail {
            prevNode?.next = nil
            tail = tail!.previous
            
            
        } else {
            prevNode!.next = current?.next
        }
        return current?.item
    }
    
    func update(index: Int, item: T) {
        let updateNode = getNode(index: index)
        updateNode?.item = item
    }
    
    func get(index: Int) -> T? {
        return getNode(index: index)?.item
    }
    
    func getNode(index: Int) -> Node<T>? {
        var count = 0
        var next = head
        while next != nil && count != index{
            count+=1
            next = next!.next
        }
        return next
    }
    
    func removeFirst() -> T? {
        return remove(index: 0)
    }
    
    func removeLast() -> T? {
        let prevTail = tail?.previous
        let tailItem = tail?.item
        prevTail?.next = nil
        tail = prevTail
        return tailItem
        
    }
    
    func insert(index:Int, item: T) {
        
        let newNode = Node(item: item)
        
        let prevNode = getNode(index: index-1)
        let nextNode = prevNode?.next
        
        
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else if tail === prevNode {
            prevNode?.next = newNode
            newNode.previous = prevNode
            tail = newNode
        } else {
            nextNode?.previous = newNode
            prevNode?.next = newNode
            newNode.next = nextNode
            newNode.previous = prevNode
        }
    }
    
    var description: String {
        var current = head
        var all = [T]()
        while current != nil {
            all.append(current!.item)
            current = current?.next
        }
        return "\(all)"
    }
}

//var list1 = LinkedList<Int>()
//list1.append(item: 5) //0
//list1.append(item: 2) //1
//list1.append(item: 3) //2
//list1.prepend(item: 100)
//list1.isEmptyList()
//list1.remove(index: 3)
//list1.remove(index: 0)
//list1.insert(index: 0, item: 99)
//list1
//list1.head?.item
//list1.head?.item
//list1.tail?.item

//test.append(item: 5) //3
//test.append(item: 6) //4
//test.remove(index: 0)
//test.get(index: 0)
////test.append(item: 2)
////test.count()
//test.removeFirst()
//test.removeLast()

// 2. Implement LRU-cache

class Queue<T>: CustomStringConvertible {
    
    private let maxSize: Int
    private var container = LinkedList<T>()
    
    init(size: Int) {
        self.maxSize = size
    }
    
    var isEmpty: Bool {
        get {
            return (container.isEmptyList())
        }
    }
    var sizeOfContainer: Int {
        get {
            return isEmpty ? 0 : container.count()
        }
    }
    var topElem: T? {
        get {
            return isEmpty ? nil : container.head?.item
        }
    }
    var botElem: T? {
        get {
            return isEmpty ? nil : container.tail?.item
        }
    }
    func get(index: Int) -> T? {
        return container.get(index: index)
    }
    
    func dequeue() -> T? {
        
        return isEmpty ? nil : (container.removeLast())!
    }
    
    func enqueue(x: T) {
        let containerSize = container.count()
        
        if containerSize >= maxSize {
            dequeue()
        }
        
        container.prepend(item: x)
    }
    func deleteFromContainer(index: Int) -> T? {
        return container.remove(index: index)
    }
    
    var description: String {
        return container.description
    }
    
    
}

struct CacheItem {
    let key: String
    let value: Int
}

//var testQueue = Queue<CacheItem>(size: 3)
//testQueue.enqueue(x: CacheItem(key: "hello", value: 10))
//testQueue.enqueue(x: CacheItem(key: "world", value: 20))
//testQueue.enqueue(x: CacheItem(key: "!", value: 40))
//testQueue.enqueue(x: CacheItem(key: "!!!", value: 30))
//testQueue.sizeOfContainer
//testQueue.isEmpty
//testQueue.dequeue()
//testQueue
//testQueue.botElem
//testQueue.topElem
//testQueue

class Cache {
    
    var container = Queue<CacheItem>(size: 5)
    
    func getValue(key: String) -> Int? {
        
        for keyInd in 0..<container.sizeOfContainer {
            let item = container.get(index: keyInd)
            
            if item?.key == key {
                bringToTop(index: keyInd)
                return item?.value
            }
        }
        return nil
    }
    func bringToTop(index: Int) {
        
        let deleted = container.deleteFromContainer(index: index)
        container.enqueue(x: deleted!)
        
    }
    func setValue(value: Int, key: String) {
        for keyIn in 0..<container.sizeOfContainer {
            let item = container.get(index: keyIn)
            if item?.key == key {
                container.deleteFromContainer(index: keyIn)
            }
        }
        container.enqueue(x: CacheItem(key: key, value: value))
        
    }
}

//var cache = Cache()
//cache.setValue(value: 2, key: "second")
//cache.setValue(value: 1, key: "first")
//cache.setValue(value: 4, key: "cond")
//cache.setValue(value: 5, key: "rst")
//cache.getValue(key: "second")
//cache.setValue(value: 6, key: "send")
//
//cache.setValue(value: 10, key: "ddd")
//cache.setValue(value: 6, key: "nnn")
//
//cache.setValue(value: 7, key: "fst")
//cache.getValue(key: "second")


















