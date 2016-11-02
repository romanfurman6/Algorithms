import Foundation

extension Character {
    func unicodeScalarCodePoint() -> UInt64 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        return UInt64(scalars[scalars.startIndex].value)
    }
}

//===========
//N^2

func palindromsInStringN2(string: String) -> Int {
    
    var arrayOfString = Array(string.characters)
    let sizeOfString = arrayOfString.count
    var count = 0
    var i = 0
    
    while i < sizeOfString {
        
        var left = i
        var right = i + 1
        while left >= 0 && right < sizeOfString && arrayOfString[left] == arrayOfString[right]  {
            left-=1
            right+=1
            count+=1
            
        }
        var leftC = i - 1
        var rightC = i + 1
        while leftC >= 0 && rightC < sizeOfString && arrayOfString[leftC] == arrayOfString[rightC] {
            leftC-=1
            rightC+=1
            count+=1
        }
        i+=1
    }
    
    return count
}

//===========
//NlogN

class palindrome {
    
    var string: String
    var str: [Character]
    var prefixHash: [UInt64]
    var suffixHash: [UInt64]
    var powArray: [UInt64]
    var oddCount: [Int]
    var evenCount: [Int]
    var simpleBase: UInt64 { return 53 }
    
    init(string: String) {
        self.string = string
        self.str = Array(string.characters)
        self.prefixHash = [UInt64](repeating: 0, count: str.count)
        self.suffixHash = [UInt64](repeating: 0, count: str.count)
        self.powArray = [UInt64](repeating: 0, count: str.count)
        self.oddCount = [Int](repeating: 0, count: str.count)
        self.evenCount = [Int](repeating: 0, count: str.count)
        countPow()
    }
    
    
    func countPow() {
        powArray[0] = 1
        var i = 1
        while i < str.count {
            powArray[i] = powArray[i-1] &* simpleBase
            i+=1
        }
    }
    
    func getHashForSubStr(left: Int, right: Int) -> UInt64 {
        var result = prefixHash[right]
        
        if left > 0 {
            result = result &- prefixHash[left-1]
        }
        
        return result
    }
    
    func getRevHashForSubStr(left: Int, right: Int) -> UInt64 {
        var result = suffixHash[left]
        
        if right < suffixHash.count - 1 {
            result = result &- suffixHash[right+1]
            
        }
        return result
    }
    
    func countPrefixHash() {
        prefixHash[0] = UInt64(str[0].unicodeScalarCodePoint())
        var i = 1
        while i < str.count {
            prefixHash[i] = prefixHash[i-1] &+ (str[i].unicodeScalarCodePoint() &* powArray[i])
            i+=1
        }
        
    }
    
    func countSuffixHash() {
        suffixHash[suffixHash.count-1] = str[str.count-1].unicodeScalarCodePoint()
        var i = str.count-2
        var x = 1
        while i >= 0 {
            suffixHash[i] = suffixHash[i+1] &+ (str[i].unicodeScalarCodePoint() &* powArray[x])
            x+=1
            i-=1
        }
        
    }
    
    func isPalindrome(left: Int, right: Int) -> Bool {
        let hash: UInt64 = getHashForSubStr(left: left, right: right)
        let first: UInt64 = hash &* powArray[prefixHash.count - right - 1]
        let revHash: UInt64 = getRevHashForSubStr(left: left, right: right)
        let second: UInt64 = revHash &* powArray[left]
        if first == second {
            return true
        }
        return false
    }
    
    func countOdd() {
        var i = 0
        while i < oddCount.count {
            var left = 1
            var right = min(i+1, oddCount.count-i)
            while left <= right {
                let mid = (left+right)/2
                if isPalindrome(left: i-mid+1, right: i+mid-1) {
                    oddCount[i] = mid
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            i+=1
        }
    }
    
    func countEven() {
        var i = 0
        while i < evenCount.count {
            var left = 1
            var right = min(i, evenCount.count-i)
            while left <= right {
                let mid = (left+right)/2
                if isPalindrome(left: i-mid, right: i+mid-1) {
                    evenCount[i] = mid
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            i+=1
        }
    }
}

func answer(str: String) -> Int {
    let test = palindrome(string: str)
    let count = str.characters.count
    test.powArray
    test.countPrefixHash()
    test.countSuffixHash()
    test.countEven()
    test.countOdd()
    let evenArray = test.evenCount
    let oddArray = test.oddCount
    var even = 0
    var odd = 0
    test.prefixHash
    test.suffixHash
    for i in evenArray {
        even+=i
    }
    for i in oddArray {
        odd+=i
    }
    return (even+odd)-count
}

//============





