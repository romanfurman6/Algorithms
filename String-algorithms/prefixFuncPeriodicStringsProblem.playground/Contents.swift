import Foundation

//==Problem==
//https://uva.onlinejudge.org/index.php?option=onlinejudge&page=show_problem&problem=396

func prefixFunc(str: String) -> [Int] {
    let strlow = str.lowercased()
    let strArr = Array(strlow.characters)
    var arr = [Int](repeatElement(0, count: str.characters.count))
    var i = 1
    var x = 0
    while i < str.characters.count {
        while x > 0 && strArr[x] != strArr[i] {
            x = arr[x-1]
        }
        if strArr[x] == strArr[i] {
            x += 1
        }
        arr[i] = x
        i+=1
    }
    return arr
}

func periodic(str: String) -> Int {
    let prefixArr = prefixFunc(str: str)
    var i = 0
    var lastZeroIndex = 0
    var minprefLength = 0
    if prefixArr[prefixArr.count-1] == 0 { return prefixArr.count}
    if prefixArr.count/2 <= prefixArr[prefixArr.count-1] {
        while i < prefixArr.count/2 {
            if prefixArr[i] == 0 {
                lastZeroIndex = i
            } else if prefixArr[i] == 1 && prefixArr[i+2] == prefixArr[i]+1 {
                    lastZeroIndex = i
            }
            i+=1
        }
    }
    minprefLength = lastZeroIndex+1
    if prefixArr.count-minprefLength == prefixArr[prefixArr.count-1] {
        return minprefLength
    }
    
    if prefixArr.count > prefixArr[prefixArr.count-1] {
        minprefLength = prefixArr.count
    }
    return minprefLength
}

prefixFunc(str: "aabaaaba")
periodic(str: "aabaaaba") //4

//TEST
//here i have test cases from -> https://www.udebug.com/UVa/455
var arr = ["abcdefghijk","abcdabcd","abababababababbababababab","amanamanamanaman","bbabb"]
for i in arr {
    print(periodic(str: i))
}

