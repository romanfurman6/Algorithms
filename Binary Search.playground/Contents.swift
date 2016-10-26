import Foundation

var array = [0,1,2,2,2,3,3,3,3,5,9,9,9,9,9,9,9,9,9]
//if the items are not unique get index of first
func binarySearchLeft(arr: [Int], key: Int, lowIndex: Int, highIndex: Int) -> Int? {
    
    if lowIndex > highIndex {
        return nil
    }
    
    let midIndex = (lowIndex+highIndex)/2
    if arr[midIndex] == key {        
        let leftKey: Int?
        leftKey = binarySearchLeft(arr: arr, key: key, lowIndex: lowIndex, highIndex: midIndex-1)
        if leftKey == nil {
            return midIndex
        } else {
            return leftKey
        }
    } else if key < arr[midIndex] {
        return binarySearchLeft(arr: arr, key: key, lowIndex: lowIndex, highIndex: midIndex-1)
    } else {
        return binarySearchLeft(arr: arr, key: key, lowIndex: midIndex+1, highIndex: highIndex)
    }
}
//if the items are not unique get index of last
func binarySearchRight(arr: [Int], key: Int, lowIndex: Int, highIndex: Int) -> Int? {
    guard lowIndex <= highIndex else { return nil }
    let midIndex = (lowIndex + highIndex) / 2
    if arr[midIndex] == key {
        return midIndex
    } else if key < arr[midIndex] {
        return binarySearchRight(arr: arr, key: key, lowIndex: lowIndex, highIndex: midIndex - 1)
    } else {
        return binarySearchRight(arr: arr, key: key, lowIndex: lowIndex + 1, highIndex: midIndex)
    }
}

//binarySearchRight(arr: array, key: 2, lowIndex: 0, highIndex: array.count-1)
//binarySearchLeft(arr: array, key: 2, lowIndex: 0, highIndex: array.count-1)
