import Foundation

func bubbleSort(arr: inout [Int]) {
    let size = arr.count
    for i in 0..<size {
        let pass = (size - 1) - i
        for z in 0..<pass {
            if arr[z] > arr[z+1] {
                swap(&arr[z+1], &arr[z])
            }
        }
    }
}
