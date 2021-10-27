// MARK: extractEachKth
/// Given array of integers, remove each kth element from it.
func extractEachKth(inputArray: [Int], k: Int) -> [Int] {
    var output: [Int] = []
    let deleter = k
    
    for i in 0..<inputArray.count {
        if deleter <= 1 {
            break
        }
        if ((i + 1) % deleter == 0) && (i != 0) {
            continue
        }
        output.append(inputArray[i])
    }
    
    return output
}

// MARK: firstDigit
/// Find the leftmost digit that occurs in a given string.
func firstDigit(inputString: String) -> Character {
    let inputArray: [Character] = Array(inputString)
    var result: Character = "a"
    
    for char in inputArray {
        if char.isNumber {
            result = char
            break
        }
    }
    
    return result
}

// MARK: differentSymbolsNaive
/// Given a string, find the number of different characters in it.
func differentSymbolsNaive(s: String) -> Int {
    return Set(s).count
}

// MARK: arrayMaxConsecutiveSum
/// Given array of integers, find the maximal possible sum of some of its k consecutive elements.
func arrayMaxConsecutiveSum(inputArray: [Int], k: Int) -> Int {
    var maxSum = 0
    
    for i in 0..<(inputArray.count - k + 1) {
        var sum = 0
        for j in 0..<k {
            sum += inputArray[i+j]
        }
        maxSum = max(maxSum, sum)
    }
    
    return maxSum
}
