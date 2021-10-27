func swapAdjacentBits(n: Int) -> Int {
  return Int(String(String(swapBitsInPairs(becomeBits(n)))), radix: 2)!
}

func becomeBits(_ number: Int) -> Array<Character> {
    let bitNumber = String(number, radix: 2)
    if bitNumber.count % 2 == 0 {
        return Array(bitNumber)
    } else {
        return Array("0" + bitNumber)
    }
}

func swapBitsInPairs(_ array: Array<Character>) -> Array<Character> {
    var result = array
    for i in 0...(array.count / 2 - 1){
        let j = i * 2
        result[j] = array[j + 1]
        result[j + 1] = array[j]
    }
    return result
}

swapAdjacentBits(n: 1073741823)
