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
    var count = 0
    var prefLength = 0
    var i = 0
    if prefixArr.count == 1 { return prefixArr.count}
    if prefixArr[prefixArr.count-1] >= prefixArr.count/2 {
        if prefixArr.count % 2 == 1 { return prefixArr.count}
        while i < prefixArr.count {
            if prefixArr[i] == 0 {
                prefLength+=1
            }
            i+=1
        }
        count = (prefixArr.count/prefLength) - 1
    } else {
        return prefixArr.count
    }
    return count
}


//TEST
//here i have test cases from -> https://www.udebug.com/UVa/455 (user taher144)
var arr = ["abcdefghijk","abcdabcd","abababababababbababababab","amanamanamanaman","bbabb"]
for i in arr {
    print(periodic(str: i))
}
