//LIFO
import Foundation

struct Stack {
    var container: [String] = []
    
    var isEmpty: Bool {
        get {
            return container.isEmpty
        }
    }
    var sizeOfContainer: Int {
        get {
            return container.count
        }
    }
    var topOfContainer: String? {
        get {
            return container.last != nil ? (container.last)! : nil
        }
    }
    mutating func removeAllFromContainer() {
        container.removeAll()
    }
    
    mutating func addToContainer(x:String){
        
        container.append(x)
    }
    mutating func getFromContainer() -> String? {
        return isEmpty ? nil : container.removeLast()
    }
    
    func checkString(str: String) -> Bool {
        let chars = Array(str.characters).map { String($0) }
        return check(parenthesis: chars)
    }
    
    func check(parenthesis: [String]) -> Bool {
        
        var counter = 0
        var stackOfParenthesis = Stack()
        
        for char in parenthesis {
            if char == "(" || char == "["   {
                stackOfParenthesis.addToContainer(x: char)
                counter += 1
            } else if char == ")" {
                let stackParents = stackOfParenthesis.getFromContainer()
                if stackParents != "(" {
                    return false
                }
            } else if char == "]" {
                let stackParents = stackOfParenthesis.getFromContainer()
                if stackParents != "[" {
                    return false
                }
            }
        }
        return true

    }
}
//[
let test = Stack()
test.checkString(str: "[[(())]]") // true
test.checkString(str: "[()()()]") // true
test.checkString(str: "[(((([])))]") //false
test.checkString(str: "[][(((([])))]][") // false
test.checkString(str: "")









//var firstStack = Stack()
//firstStack.addToContainer(x: 5)
//firstStack.addToContainer(x: 2)
//firstStack.addToContainer(x: 1)
//firstStack.addToContainer(x: 3)
//firstStack.isEmpty
//firstStack.sizeOfContainer
//firstStack.topOfContainer
//firstStack.getFromContainer()
//firstStack.getFromContainer()
//firstStack.getFromContainer()
//firstStack.getFromContainer()
//firstStack.getFromContainer()
//firstStack.removeAllFromContainer()
//firstStack.isEmpty
//firstStack.getFromContainer()











