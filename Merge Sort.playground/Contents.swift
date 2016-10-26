import Foundation

func mergeSort(arr: [Int])->[Int] {
    
    if arr.count == 1 {
        return arr
    }
    
    func merge(arr1:[Int],arr2:[Int])->[Int] {
        var result: [Int] = []
        var i = 0
        var j = 0
        
        while i < arr1.count && j < arr2.count {
            
            if arr1[i] > arr2[j] {
                result.append(arr2[j])
                j+=1
            } else {
                result.append(arr1[i])
                i+=1
            }
        }
        while i < arr1.count {
            result.append(arr1[i])
            i+=1
        }
        while j < arr2.count {
            result.append(arr2[j])
            j+=1
        }
        return result
    }
    
    let midIndex = arr.count / 2
    
    var leftArray: [Int] = []
    var rightArray: [Int] = []
    
    for x in 0..<midIndex {
        leftArray.append(arr[x])
    }
    for y in midIndex..<arr.count {
        rightArray.append(arr[y])
    }
    
    leftArray = mergeSort(arr: leftArray)
    rightArray = mergeSort(arr: rightArray)
    
    return merge(arr1: leftArray, arr2: rightArray)
}