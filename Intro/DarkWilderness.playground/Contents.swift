// MARK: growingPlant
/// Caring for a plant can be hard work, but since you tend to it regularly, you have a plant that grows consistently. Each day, its height increases by a fixed amount represented by the integer upSpeed. But due to lack of sunlight, the plant decreases in height every night, by an amount represented by downSpeed.
/// Since you grew the plant from a seed, it started at height 0 initially. Given an integer desiredHeight, your task is to find how many days it'll take for the plant to reach this height.
func growingPlant(upSpeed: Int, downSpeed: Int, desiredHeight: Int) -> Int {
    var height = 0
    var result = 0
    
    while true {
        height += upSpeed
        result += 1
        if height >= desiredHeight {
            break
        }
        height -= downSpeed
    }
    
    return result
}

// MARK: knapsackLight
/// You found two items in a treasure chest! The first item weighs weight1 and is worth value1, and the second item weighs weight2 and is worth value2. What is the total maximum value of the items you can take with you, assuming that your max weight capacity is maxW and you can't come back for the items later?
func knapsackLight(value1: Int, weight1: Int, value2: Int, weight2: Int, maxW: Int) -> Int {
    var maxValue = 0
    var maxWeight = 0
    var minValue = 0
    var minWeight = 0
    
    if value1 > value2 {
        maxValue = value1
        maxWeight = weight1
        minValue = value2
        minWeight = weight2
    } else {
        maxValue = value2
        maxWeight = weight2
        minValue = value1
        minWeight = weight1
    }
    
    if maxW < maxWeight {
        return (maxW < minWeight ? 0 : minValue)
    } else if maxW < (maxWeight + minWeight) {
        return maxValue
    } else {
        return (maxValue + minValue)
    }
}

// MARK: longestDigitsPrefix
/// Given a string, output its longest prefix which contains only digits.
func longestDigitsPrefix(inputString: String) -> String {
    var result = ""
    
    for char in inputString {
        if char.isNumber {
            result.append(char)
            continue
        }
        break
    }
    
    return result
}

// MARK: digitDegree
/// Let's define digit degree of some positive integer as the number of times we need to replace this number with the sum of its digits until we get to a one digit number.
/// Given an integer, find its digit degree.
func digitDegree(n: Int) -> Int {
    var number = n
    
    if number < 10 {
        return 0
    } else {
        var i = 0
        
        while number >= 10 {
            var sum = 0
            let str = Array(String(number))
            for j in 0..<str.count {
                sum += Int(String(str[j]))!
            }
            number = sum
            i += 1
        }
        
        return i
    }
}

// MARK: bishopAndPawn
/// Given the positions of a white bishop and a black pawn on the standard chess board, determine whether the bishop can capture the pawn in one move.
/// The bishop has no restrictions in distance for each move, but is limited to diagonal movement. Check out the example below to see how it can move: https://codesignal.s3.amazonaws.com/tasks/bishopAndPawn/img/bishop.jpg?_tm=1624426127191
func bishopAndPawn(bishop: String, pawn: String) -> Bool {
    let dict: [Character: Int] = [
        "a" : 1,
        "b" : 2,
        "c" : 3,
        "d" : 4,
        "e" : 5,
        "f" : 6,
        "g" : 7,
        "h" : 8
    ]
    
    let newBishop = [dict[bishop[bishop.startIndex]], Int(String(bishop[bishop.index(before: bishop.endIndex)]))]
    let newPawn = [dict[pawn[pawn.startIndex]], Int(String(pawn[pawn.index(before: pawn.endIndex)]))]
    
    return abs(newBishop[0]! - newPawn[0]!) == abs(newBishop[1]! - newPawn[1]!)
}
