//import Foundation
//
////queue
////dequeue
////isEmpty
////topElem
////botElem
////FIFO
//
//class Queue {
//    
//    var container: [Int] = []
//    
//    var isEmpty: Bool {
//        get {
//            return container.isEmpty
//        }
//    }
//    var sizeOfContainer: Int {
//        get {
//            return container.count
//        }
//    }
//    var topElem: Int? {
//        get {
//            return isEmpty ? nil : (container.last)!
//        }
//    }
//    var botElem: Int? {
//        get {
//            return isEmpty ? nil : (container.first)!
//        }
//    }
//    
//    func dequeue()->Int? {
//        
//        return isEmpty ? nil : container.removeFirst()
//    }
//    
//    func enqueue(x: Int) {
//        return container.append(x)
//    }
//    
//    
//}
//
//var firstQueue = Queue()
//firstQueue.enqueue(x: 9)
//firstQueue.enqueue(x: 4)
//firstQueue.enqueue(x: 1)
//firstQueue.enqueue(x: 1)
//firstQueue.enqueue(x: 2)
//firstQueue.dequeue()
//firstQueue.dequeue()
//firstQueue.dequeue()
//firstQueue.dequeue()
//firstQueue.dequeue()
//
print(123)