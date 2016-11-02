import Foundation

//Double ended queue
//addFirst
//addLast
//removeFirst
//removeLast
//top
//bot

class Dequeue {
    
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
    var lastElem: String? {
        get {
            return isEmpty ? nil : container.last
        }
    }
    var firstElem: String? {
        get {
            return isEmpty ? nil : container.first
        }
    }
    
    func firstDequeue()-> String? {
        
        return isEmpty ? nil : container.removeFirst()
    }
    func lastDequeue()-> String? {
        return isEmpty ? nil : container.removeLast()

    }
    
    func append(x: String) {
        return container.append(x)
    }
    
    func prepend(x: String) {
        return container.insert(x, at: 0)
    }
}


//palindromeCheck
class Test {

    var str: String
    var containerOfStrings = Dequeue()
    
    init(str: String) {
        self.str = str.replacingOccurrences(of: " ", with: "")
        for letter in self.str.characters {
            containerOfStrings.append(x: String(letter))
        }
    }
    func palindromeCheck() -> Bool? {
        let cont = containerOfStrings
        for _ in 0..<(cont.sizeOfContainer/2) {
            let first = cont.firstDequeue()
            let last = cont.lastDequeue()
            if first != last {
                return false
            }
        }
        return true
    }
}

var z = Test(str: "abca b acba")
z.containerOfStrings
z.palindromeCheck()






