import Foundation

func bubbleSort(arr: inout [Int]) {
    for i in 0..<arr.count {
        let pass = (arr.count - 1) - i
        for z in 0..<pass {
            if arr[z] > arr[z+1] {
                swap(&arr[z+1], &arr[z])
            }
        }
    }
}
