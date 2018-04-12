import Foundation

extension Array {
    mutating func shuffle() {
        if count < 2 { return }

        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swapAt(i, j)
        }
    }
}

func quicksort(_ list: inout [Int], low: Int , high: Int ) {
    if low < high {
        let partition = qs_partition(&list, low, high)

        quicksort(&list, low: low, high: partition)
        quicksort(&list, low: partition + 1, high: high)
    }
}

func qs_partition(_ list: inout [Int], _ low: Int , _ high: Int ) -> Int {
    let pivot = list[high]
    var i = low - 1

    for j in low..<high {
        if list[j] < pivot {
            i = i + 1
            list.swapAt(i, j)
        }
    }
    list.swapAt(i + 1, high)

    return i
}

for _ in 0..<9 {
    let samplesize = Int(1E6)
    var samples = Array(0..<samplesize)
    samples.shuffle()

    let start = Date(timeIntervalSinceNow: 0).timeIntervalSince1970

    var testsamples = samples
    quicksort(&testsamples, low: 0, high: samples.count - 1)

    print(Date(timeIntervalSinceNow: 0).timeIntervalSince1970 - start)
}
