import Foundation


//BinarySearch//shiftDownLeft//shiftDownRight//CompareWithKey O(logN)
//addElement  O(logN) - NlogN
//removeElement O(logN) - NlogN


class Node {
    
    var parent: Node?
    var value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int) {
        self.value = value
    }

    func add(element: Int ) {
        
        if element > value {
            
            if let rightChild = rightChild {
                rightChild.add(element: element)
            } else {
                rightChild = Node(value: element)
                rightChild?.parent = self
            }
            
        } else {
            
            if let leftChild = leftChild {
                leftChild.add(element: element)
            } else {
                leftChild = Node(value: element)
                leftChild?.parent = self
            }
        }
    }
    
    func search(key: Int) -> Node? {
        if key == value {
            return self
        } else {
            
            if key > value {
                return rightChild?.search(key: key)
            } else if key < value {
                return leftChild?.search(key: key)
            }
        }
        return nil
    }
    
    private var isLeftChild: Bool {
        return parent?.leftChild === self
    }
    
    private var isRightChild: Bool {
        return parent?.rightChild === self
    }
    private var hasLeftChild: Bool {
        return leftChild != nil
    }
    
    private var hasRightChild: Bool {
        return rightChild != nil
    }
    private var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    
    
    func remove(element: Int) { //TODO: fix

        if let searchElement = search(key: element) {
            
            if searchElement.hasBothChildren {

                if searchElement.isLeftChild {
                    searchElement.parent?.leftChild = searchElement.rightChild
                } else {
                    searchElement.parent?.rightChild = searchElement.rightChild
                }
                searchElement.rightChild?.parent = searchElement.parent
                searchElement.leftChild?.parent = searchElement.rightChild
                searchElement.rightChild?.leftChild = searchElement.leftChild
                
            } else if searchElement.hasLeftChild {
                
                searchElement.leftChild?.parent = searchElement.parent

                if searchElement.isLeftChild {
                    searchElement.parent?.leftChild = searchElement.leftChild
                } else {
                    searchElement.parent?.rightChild = searchElement.leftChild
                }
                
            } else if searchElement.hasRightChild {
                
                searchElement.rightChild?.parent = searchElement.parent
                
                if searchElement.isLeftChild {
                    searchElement.parent?.leftChild = searchElement.rightChild
                } else {
                    searchElement.parent?.rightChild = searchElement.rightChild
                }
                
            } else { //noKids :D
                
                if searchElement.isLeftChild {
                    searchElement.parent?.leftChild = nil
                } else {
                    searchElement.parent?.rightChild = nil
                }
            }
        }
    }
}


class BinaryTree {
    
    var root: Node?
    
    func append(elem: Int) {
        guard let root = root else {
            self.root = Node(value: elem)
            return
        }
        
        root.add(element: elem)
    }
    func search(key: Int) -> Node? {
        if root != nil {
           return root!.search(key: key)
        }
        return nil
    }
    func remove(element: Int) {
        if root != nil {
            root?.remove(element: element)
        }
    }
    
}



var test = BinaryTree()

//test.append(elem: 10)
//test.append(elem: 5)
//test.append(elem: 20)
//test.append(elem: 3)
//test.append(elem: 4)
//test.append(elem: 2)
//test.append(elem: 21)
//test.append(elem: 19)
//test.append(elem: 18)
//test.remove(element: 18)