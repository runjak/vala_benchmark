import Foundation // actually only need 'Darwin' except for Date-based execution time calculation

func pi() -> Double {
    let rounds = 1E6
    var hits : Double = 0

    for _ in 0..<Int(rounds) {
        let x = Double(arc4random_uniform(UInt32(1E5))) / 1E5
        let y = Double(arc4random_uniform(UInt32(1E5))) / 1E5

        if sqrt(x * x + y * y) < 1 {
            hits += 1
        }
    }

    return 4 * (hits / rounds)
}

let start = Date(timeIntervalSinceNow: 0).timeIntervalSince1970

let _ = pi()

print(Date(timeIntervalSinceNow: 0).timeIntervalSince1970 - start)
