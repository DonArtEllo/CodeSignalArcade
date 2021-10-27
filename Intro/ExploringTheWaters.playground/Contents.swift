// MARK: alternatingSums
/// Several people are standing in a row and need to be divided into two teams. The first person goes into team 1, the second goes into team 2, the third goes into team 1 again, the fourth into team 2, and so on.
/// You are given an array of positive integers - the weights of the people. Return an array of two integers, where the first element is the total weight of team 1, and the second element is the total weight of team 2 after the division is complete.
func alternatingSums(a: [Int]) -> [Int] {
    var result = [0, 0]
    
    for i in 0..<a.count {
        if (i % 2 == 0) {
            result[0] += a[i]
        } else {
            result[1] += a[i]
        }
    }
    
    return result
}

// MARK: addBorder
/// Given a rectangular matrix of characters, add a border of asterisks(*) to it.
func addBorder(picture: [String]) -> [String] {
    if picture.isEmpty {
        return picture
    }
    
    var result = picture
    let length = picture.count - 1
    let width = picture[0].count + 1
    
    result = []
    var border = ""
    
    for _ in 0...width {
        border += "*"
    }
    
    result.append(border)
    
    for i in 0...length {
        let newString = "*\(picture[i])*"
        result.append(newString)
    }
    
    result.append(border)

    return result
}

// MARK: areSimilar
/// Two arrays are called similar if one can be obtained from another by swapping at most one pair of elements in one of the arrays.
/// Given two arrays a and b, check whether they are similar.
func areSimilar(a: [Int], b: [Int]) -> Bool {
    var firstNonMatchIndex = -1
    var nonMatchCount = 0
    
    for i in 0..<a.count {
        if a[i] != b[i] {
            nonMatchCount += 1
            if firstNonMatchIndex < 0 {
                firstNonMatchIndex = i
            } else if (a[firstNonMatchIndex] != b[i]) || (a[i] != b[firstNonMatchIndex]) || (nonMatchCount > 2) {
                return false
            }
        }
    }

    return true
}

// MARK: arrayChange
/// You are given an array of integers. On each move you are allowed to increase exactly one of its element by one. Find the minimal number of moves required to obtain a strictly increasing sequence from the input.
func arrayChange(inputArray: [Int]) -> Int {
    var input = inputArray
    var sum = 0
    
    for i in 0..<input.count - 1 {
        if input[i + 1] <= input[i] {
            let temp = input[i] - input[i + 1] + 1
            sum += temp
            input[i + 1] = temp + input[i + 1]
        }
    }
    
    return sum
}

// MARK: palindromeRearranging
/// Given a string, find out if its characters can be rearranged to form a palindrome.
func palindromeRearranging(inputString: String) -> Bool {
    var charDict = [Character: Int]()
    var oddCount = 0
    
    for char in inputString {
        if let _ = charDict[char] {
            charDict[char]! += 1
        } else {
            charDict[char] = 1
        }
    }
    
    for i in charDict.values {
        if i % 2 == 1 {
            oddCount += 1
        }
        if oddCount > 1 {
            return false
        }
    }
    
    return true
}
