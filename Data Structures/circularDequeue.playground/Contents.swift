import Foundation

class Deque<T> {
    
    private var container: [T?]
    private var currentContainerSize: Int
    private let containerSize: Int
    private var tail: Int
    private var head: Int
    
    init(size: Int) {
        self.containerSize = size
        self.currentContainerSize = size
        self.container = Array<T?>(repeating: nil, count: containerSize)
        tail = 0
        head = currentContainerSize-1
    }
    
    var isEmpty: Bool {
        return increasedMarker(marker: head) == tail && container[head] == nil
    }
    
    private func increasedMarker(marker: Int) -> Int {
        if marker == (currentContainerSize-1) {
            return 0
        } else {
            return marker+1
        }
    }
    
    private func decreasedMarker(marker: Int) -> Int {
        if marker == 0 {
            return currentContainerSize-1
        } else {
            return marker-1
        }
    }
    
    private func shouldDecreaseArray() -> Bool {
        if currentContainerSize/2 < containerSize {
            return false
        }
        print(container)
        print(head)
        print(tail)
        if head < tail {
            return tail-head == (currentContainerSize/2)+1
        } else {
            return head-tail >= (currentContainerSize/2)-1
        }
        
    }
    
    private func shouldIncreaseArray() -> Bool {
        return increasedMarker(marker: head) == tail && container[head] != nil
    }
    
    private func decreaseArrayIfNeeded() {
        
        if shouldDecreaseArray() {
            let newContSize = currentContainerSize/2
            var newArray = [T?](repeating: nil, count: newContSize)
            var current = increasedMarker(marker: head)
            var index = 0
            while current != tail {
                if container[current] != nil {
                    newArray[index] = container[current]
                    
                }
                index+=1
                current = increasedMarker(marker: current)
            }
            head = newContSize-1
            tail = 0
            container = newArray
            currentContainerSize = newContSize
        }
    }
    
    private func increaseArrayIfNeeded() {
        if shouldIncreaseArray() {
            let newContSize = currentContainerSize*2
            var newArray = [T?](repeating: nil, count: newContSize)
            var current = increasedMarker(marker: head)
            var index = 0
            while current != decreasedMarker(marker: tail) {
                newArray[index] = container[current]
                index+=1
                current = increasedMarker(marker: current)
            }
            newArray[index] = container[current]
            head = newContSize-1
            tail = currentContainerSize
            container = newArray
            currentContainerSize = newContSize
        }
    }
    
    func enqueue(x: T) {
        increaseArrayIfNeeded()
        container[head] = x
        head = decreasedMarker(marker: head)
    }
    
    func enqueueFront(x: T) {
        increaseArrayIfNeeded()
        container[tail] = x
        tail = increasedMarker(marker: tail)
    }
    
    func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        tail = decreasedMarker(marker: tail)
        let value = container[tail]
        container[tail] = nil
        decreaseArrayIfNeeded()
        return value!
    }
    
    func dequeueBack() -> T? {
        guard !isEmpty else {
            return nil
        }
        head = increasedMarker(marker: head)
        let value = container[head]
        container[head] = nil
        decreaseArrayIfNeeded()
        return value!
        
    }
}
