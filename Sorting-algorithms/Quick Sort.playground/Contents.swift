import Foundation

/*
func quickSort(arr: [Int]) -> [Int] {
    if arr.count > 1 {
        
        var less: [Int] = []
        var equal: [Int] = []
        var greater: [Int] = []
        
        let pivot = arr[0]
        for i in arr {
            if i < pivot {
                less.append(i)
            } else if i == pivot {
                equal.append(i)
            } else {
                greater.append(i)
            }
        }
        return quickSort(arr: less) + equal + quickSort(arr: greater)
    } else {
        return arr
    }
}
 */
var arr = [2,3,5,1,4]
func quickSort(arr: [Int]) -> [Int] {
    if arr.count > 1 {
        
        var less: [Int] = []
        var equal: [Int] = []
        var greater: [Int] = []
        
        let pivot = arr[0]
        for i in arr {
            if i < pivot {
                less.append(i)
            } else if i == pivot {
                equal.append(i)
            } else {
                greater.append(i)
            }
        }
        return quickSort(arr: less) + equal + quickSort(arr: greater)
    } else {
        return arr
    }
}
var a = quickSort(arr: arr)
var answer = ""
for i in a {
    answer += " " + String(i)
}
answer