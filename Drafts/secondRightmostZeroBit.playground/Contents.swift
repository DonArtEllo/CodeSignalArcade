func secondRightmostZeroBit(n: Int) -> Int {
  return twoInPowerOf(secondZeroBitPozition(n))
}

func secondZeroBitPozition(_ n: Int) -> Int {
    var first = true
    let binary = String(n, radix: 2)
    let number = Array(binary)
    for j in 1...number.count {
        let i = number.count - j
        let bit = number[i]
        if bit == "0" {
            if first {
                first = false
            } else {
                return j
            }
        }
    }
    return 0
}

func twoInPowerOf(_ n: Int) -> Int {
    var result = 1
    if n > 0 {
        for _ in 1..<n {
            result *= 2
        }
    }
    return result
}

let n =
    37
//    1073741824
secondRightmostZeroBit(n: n)
