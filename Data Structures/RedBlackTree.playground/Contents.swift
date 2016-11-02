import Foundation


enum color {
    case red
    case black
    case none
}

class Node {
    
    var color: color = .red
    var value: Int! = nil
    var right: Node!
    var left: Node!
    var parent: Node!
    
    init(tree: RedBlackTree) {
        right = tree.leaf
        left = tree.leaf
        parent = tree.leaf
    }
    
    init() {}
    public var isLeftChild: Bool { return self.parent.left === self }
    public var isRightChild: Bool { return self.parent.right === self }
    public var grandparent: Node { return parent.parent }
    public var brother: Node { if isLeftChild { return self.parent.right } else { return self.parent.left }}
    public var uncle: Node {return parent.brother}
    public var isRed: Bool {return color == .red}
    public var isBlack: Bool {return color == .black}
    var isNoneColor: Bool {
        return color == .none
    }
    
    
    
}

class RedBlackTree {
    
    var root: Node
    let leaf: Node
    
    init() {
        leaf = Node()
        leaf.color = .black
        root = leaf
    }
    
    
    public func insert(value: Int) {
        let newNode = Node(tree: self)
        newNode.value = value
        newNode.left.parent = newNode
        newNode.right.parent = newNode
        BinarySearchTreeInsert(newNode: newNode, parent: root)
        insertCase1(newNode: newNode)
    }
    public func maximum(root: Node) -> Node {
        if root.right.value == nil {
            return root
        }
        
        return maximum(root: root.right)
    }
    
    private func BinarySearchTreeInsert(newNode: Node, parent: Node) {
        if parent === leaf {
            self.root = newNode
        } else if newNode.value < parent.value {
            if parent.left !== leaf {
                BinarySearchTreeInsert(newNode: newNode, parent: parent.left)
            } else {
                parent.left = newNode
                parent.left.parent = parent
            }
        } else {
            if parent.right !== leaf {
                BinarySearchTreeInsert(newNode: newNode, parent: parent.right)
            } else {
                parent.right = newNode
                parent.right.parent = parent
            }
        }
    }
    //INSERT CASES
    private func insertCase1 (newNode: Node) {
        if newNode === root {
            newNode.color = .black
        } else {
            insertCase2(newNode: newNode)
        }
    }
    
    private func insertCase2 (newNode: Node) {
        if !newNode.parent.isBlack {
            insertCase3(newNode: newNode)
        }
    }
    
    private func insertCase3 (newNode: Node) {
        
        if newNode.uncle.isRed {
            newNode.parent.color = .black
            newNode.uncle.color = .black
            newNode.grandparent.color = .red
            insertCase1(newNode: newNode.grandparent)
        } else {
            insertCase4(newNode: newNode)
        }
    }
    private func insertCase4 (newNode: Node) {
        
        if newNode.isRightChild && newNode.parent.isLeftChild {
            leftRotate(node: newNode.parent)
            insertCase5(newNode: newNode.left)
        } else if newNode.parent.isRightChild && newNode.isLeftChild {
            rightRotate(node: newNode.parent)
            insertCase5(newNode: newNode.right)
        } else {
            insertCase5(newNode: newNode)
        }
        
    }
    private func insertCase5 (newNode: Node) {
        
        newNode.parent.color = .black
        newNode.grandparent.color = .red
        
        if newNode.isLeftChild {
            rightRotate(node: newNode.grandparent)
        } else {
            leftRotate(node: newNode.grandparent)
        }
        
    }
    //-------
    
    //ROTATE
    
    private func leftRotate(node: Node) {
        let newRoot = node.right!
        node.right = newRoot.left
        if newRoot.left !== leaf {
            newRoot.left.parent = node
        }
        newRoot.parent = node.parent
        if node.parent === leaf {
            self.root = newRoot
        } else if node.isLeftChild {
            node.parent.left = newRoot
        } else {
            node.parent.right = newRoot
        }
        newRoot.left = node
        node.parent = newRoot
        
    }
    
    private func rightRotate(node: Node) {
        
        let newRoot = node.left!
        node.left = newRoot.right!
        if newRoot.right !== leaf {
            newRoot.right.parent = node
        }
        newRoot.parent = node.parent
        if node.parent === leaf {
            self.root = newRoot
        } else if node.isRightChild {
            node.parent.right = newRoot
        } else {
            node.parent.left = newRoot
        }
        newRoot.right = node
        node.parent = newRoot
        
    }
    //------
    
    //SEARCH
    
    private func search(element: Int, rootNode: Node) -> Node? {
        
        if rootNode !== leaf && rootNode.value != element {
            
            if element > rootNode.value {
                return search(element: element, rootNode: rootNode.right)
            } else {
                return search(element: element, rootNode: rootNode.left)
            }
        }
        return rootNode === leaf ? nil : rootNode
    }
    public func search(element: Int) -> Node? {
        return search(element: element, rootNode: self.root)
    }
    //------
    
    
    //DELETE
    
    public func delete(element: Int) {
        
        if var del = search(element: element) {
            
            if del.parent === leaf {
                if del.right === leaf && del.left === leaf {
                    self.root = leaf
                }
                return
            }
            
            if del.left === leaf && del.right === leaf {
                if del.isRed {
                    if del.isLeftChild {
                        del.parent.left = leaf
                    } else {
                        del.parent.right = leaf
                    }
                }
                return
            }
            
            if del.left !== leaf && del.right !== leaf {
                let maxNode = maximum(root: del.left)
                del.value = maxNode.value
                del = maxNode
            }
            //second part
            
            var newChild: Node
            if del.left !== leaf {
                newChild = del.left
            } else {
                newChild = del.right
            }
            
            if del.isRed || newChild.isRed {
                newChild.color = .black
                
                if del.isLeftChild {
                    del.parent.left = newChild
                } else {
                    del.parent.right = newChild
                }
                if newChild !== leaf {
                    newChild.parent = del.parent
                } else {
                    
                    var brother = del.brother
                    
                    if del.isLeftChild {
                        del.parent.left = newChild
                    } else {
                        del.parent.right = newChild
                    }
                    if newChild !== leaf {
                        newChild.parent = del.parent
                    }
                    newChild.color = .none
                    
                    while newChild.isNoneColor || (newChild.parent !== leaf && newChild.parent != nil) {
                        if brother.isBlack {
                            
                            var leftRedChild: Node! = nil
                            if brother.left.isRed {
                                leftRedChild = brother.left
                            }
                            var rightRedChild: Node! = nil
                            if brother.right.isRed {
                                rightRedChild = brother.right
                            }
                            
                            if leftRedChild != nil || rightRedChild != nil {
                                newChild.color = .black
                                if brother.isLeftChild {
                                    if leftRedChild != nil {
                                        brother.left.color = .black
                                        let tempColor = brother.parent.color
                                        brother.parent.color = brother.color
                                        brother.color = tempColor
                                        rightRotate(node: brother.parent)
                                    } else {
                                        if brother.parent.isRed {
                                            brother.parent.color = .black
                                        } else {
                                            brother.right.color = .black
                                        }
                                        leftRotate(node: brother)
                                        rightRotate(node: brother.grandparent)
                                    }
                                } else {
                                    if rightRedChild != nil {
                                        brother.right.color = .black
                                        let tempColor = brother.parent.color
                                        brother.parent.color = brother.color
                                        brother.color = tempColor
                                        leftRotate(node: brother.parent)
                                    } else {
                                        if brother.parent.isRed {
                                            brother.parent.color = .black
                                        } else {
                                            brother.left.color = .black
                                        }
                                        rightRotate(node: brother)
                                        leftRotate(node: brother.grandparent)
                                    }
                                }
                                break
                            } else {
                                newChild.color = .black
                                brother.color = .red
                                if brother.parent.isRed {
                                    brother.parent.color = .black
                                    break
                                }
                                
                                if brother.parent.parent === leaf {
                                    break
                                } else {
                                    brother.parent.color = .none
                                    newChild = brother.parent
                                    brother = newChild.brother
                                }
                            }
                        } else {
                            
                            brother.color = .black
                            
                            if brother.isRightChild {
                                leftRotate(node: brother.parent)
                                brother = brother.left.right
                                brother.parent.color = .red
                            } else {
                                
                                rightRotate(node: brother.parent)
                                brother = brother.right.left
                                brother.parent.color = .red
                            }
                        }
                        
                        if (brother.parent === leaf) || (newChild !== leaf && newChild.parent === leaf) {
                            newChild.color = .black
                        }
                    }
                }
            }
        }
    }
}

var test = RedBlackTree()
test.insert(value: 10)
test.insert(value: 11)
test.insert(value: 9)
test.insert(value: 13)
test.insert(value: 12)
test.insert(value: 14)
test.insert(value: 15)
//test.root.right.right.parent.color
//test.root.right.right.right.right.parent.value
//test.root.right.right.right.left.color
            
/*
//searchTest
test.search(element: 15)
test.search(element: 100)
test.search(element: 10)
*/
            
//insertTest
//10 black
test.root.color
test.root.value
test.root.parent.value
            
            
//12 red
test.root.right.color
test.root.right.value
            
            
//9 black
test.root.left.color
test.root.left.value
test.root.left.parent.value
            
//14 black
test.root.right.right.color
test.root.right.right.value
            
            
//11 black
test.root.right.left.color
test.root.right.left.value
            
// 15 red
test.root.right.right.right.color
test.root.right.right.right.value

            
// 13 red
test.root.right.right.left.color
test.root.right.right.left.value

//deleteTest
test.root.value

//14
test.root.right.value

test.root.right.right.value

test.delete(element: 12)

//11red
test.root.right.value
test.root.right.color
test.root.right.right.color






