import Foundation

//
func prefixFunc(str: String) -> [Int] {
    let strArr = Array(str.characters)
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

//KMP
func KMP(str: String, subStr: String) -> Bool {
    var newStr = subStr + "#" + str
    var prefixFuncArr = prefixFunc(str: newStr)
    var i = subStr.characters.count+1
    while i < newStr.characters.count {
        if prefixFuncArr[i] == subStr.characters.count {
            return true
        }
        i+=1
    }
    return false
}
KMP(str: "videobox", subStr: "videobox")
KMP(str: "abcdef", subStr: "def")
KMP(str: "computer", subStr: "muter")
KMP(str: "stringmatchingmat", subStr: "ingmat")
KMP(str: "videobox", subStr: "videobox")











































