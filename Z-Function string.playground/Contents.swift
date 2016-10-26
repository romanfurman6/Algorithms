import Foundation

//============
//N^2

func zFuncN2(string: String) -> [Int] {
    let str = Array(string.characters)
    var array = [Int](repeatElement(0, count: str.count))
    var i = 1
    while i < str.count {
        while i+array[i] < str.count && str[array[i]] == str[i+array[i]] {
            array[i] += 1
        }
        i+=1
    }
    return array
}

//============
//N
func zFuncN(string: String) -> [Int] {
    let str = Array(string.characters)
    var array = [Int](repeatElement(0, count: str.count))
    var i = 1
    var r = 0
    var l = 0
    
    while i < str.count {
        if i <= r {
            array[i] = min(r-i+1, array[i-l])
        }
        while i+array[i] < str.count && str[array[i]] == str[i+array[i]] {
            array[i]+=1
        }
        
        if i+array[i]-1 > r {
            l = i
            r = i+array[i]-1
        }
        i+=1
    }
    return array
}
//============
