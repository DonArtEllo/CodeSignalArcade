func differentRightmostBit(n: Int, m : Int) -> Int {
  return Int(firstDifferentBit(n, m), radix: 2)!
}

func firstDifferentBit(_ n: Int, _ m: Int) -> String{
    var number1 = String(n, radix: 2)
    var number2 = String(m, radix: 2)
    if number1.count > number2.count {
        number2 = String(repeating: "0", count: number1.count - number2.count) + number2
    }
    if number2.count > number1.count {
        number1 = String(repeating: "0", count: number2.count - number1.count) + number1
    }
    var bitPosition = ""
    for i in 0..<number2.count {
        let index = String.Index(encodedOffset: number2.count - 1 - i)
        if number1[index] != number2[index] {
            bitPosition = "1" + bitPosition
            break
        } else {
            bitPosition = "0" + bitPosition
        }
    }
    return bitPosition
}

differentRightmostBit(n: 42, m: 22)
