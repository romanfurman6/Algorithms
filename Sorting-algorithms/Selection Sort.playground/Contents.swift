import Foundation

func selectionSort(arr: [Int]) -> [Int] {
    var a = arr
    
    for x in 0..<arr.count {
        var low = x
        for z in (x+1)..<a.count {
            if a[z] < a[low] {
                low = z
            }
        }
        if x != low {
            swap(&a[x], &a[low])
        }
    }
    return a
}