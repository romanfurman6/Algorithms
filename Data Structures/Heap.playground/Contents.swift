import Foundation



class Heap {
    
    var heap: [Int] = []
    init(array: [Int]) {
        for i in 0..<array.count-1 {
            addElement(element: array[i])
        }
    }
    
    var findMax: Int { return heap.first! }
    
    private var count: Int {return heap.count}
    
    private func floor() -> Int {
        let floor = log2(Double(heap.count))
        return Int(floor)
    }
    private func currentFloor(elem: Int) -> Int {
        let floor = log2(Double(elem))
        return Int(floor)
    }
    
    
    private func parentIndex(index: Int) -> Int? {
        let parentIndex = Int(((index + 1)/2) - 1)
        if parentIndex == -1 {
            return nil
        } else {
            return Int(((index + 1)/2) - 1)
            
        }
    }
    
    
    private func leftChildIndex(index: Int) -> Int? {
        let leftChildIndex = 2*index+1
        if leftChildIndex >= heap.count {
            return nil
        } else {
            return 2*index+1
        }
    }
    
    private func rightChildIndex(index: Int) -> Int? {
        let rightChildIndex = 2*index+2
        if rightChildIndex >= heap.count{
            return nil
        } else {
            return 2*index+2
        }
    }
    
    
    
    private func shiftDown(index: Int) {
        let parent = heap[index]
        
        guard let leftIndex = leftChildIndex(index: index) else { return }
        let leftChild = heap[leftIndex]
        
        if leftChild > parent {
            swap(&heap[leftIndex], &heap[index])
            shiftDown(index: leftIndex)
        } else if let rightIndex = rightChildIndex(index: index) {
            let rightChild = heap[rightIndex]
            if rightChild > parent {
                swap(&heap[rightIndex], &heap[index])
                shiftDown(index: rightIndex)
            }
        }
    }
    
    private func shiftUp(index: Int) {
        let lastElement = heap[index]
        guard let parentIndex = parentIndex(index: index) else { return }
        if lastElement > heap[parentIndex] {
            swap(&heap[parentIndex], &heap[index])
            shiftUp(index: parentIndex)
        }
    }
    
    func removeMax() {
        swap(&heap[0], &heap[heap.count-1])
        heap.removeLast()
        shiftDown(index: 0)
    }
    
    func addElement(element: Int) {
        heap.append(element)
        shiftUp(index: heap.count-1)
        
    }
    func showHeap() {
        
        var arraysInArray = Array(repeating: [Int](), count: (floor()+1))
        var count = heap.count

        for i in 0..<heap.count {
            let numberOfFloor = currentFloor(elem: heap[i])
            arraysInArray[numberOfFloor].append(heap[i])
        }
        for i in 0..<arraysInArray.count {
            let str = String(repeating: " ", count: count)
            print("\(str) \(arraysInArray[i])")
            count -= 2
        }
        
    }
}
//func currentFloor(elem: Int) -> Int {
//    let floor = log2(Double(elem))
//    return Int(floor)
//}
var array = [1,2,3,4,5,6,7,8,9,10,11,12,13]
var test = Heap(array: array)
//test.heap
//test.showHeap()


