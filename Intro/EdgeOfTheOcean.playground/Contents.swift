// MARK: adjacentElementsProduct
/// Given an array of integers, find the pair of adjacent elements that has the largest product and return that product.
func adjacentElementsProduct(inputArray: [Int]) -> Int {
    var result = -1000000
    
    for i in 1...(inputArray.count - 1) {
        if inputArray[i - 1] * inputArray[i] >= result {
            result = inputArray[i - 1] * inputArray[i]
        }
    }
    
    return result
}

// MARK: shapeArea
/// Below we will define an n-interesting polygon. Your task is to find the area of a polygon for a given n.
/// A 1-interesting polygon is just a square with a side of length 1. An n-interesting polygon is obtained by taking the n - 1-interesting polygon and appending 1-interesting polygons to its rim, side by side. You can see the 1-, 2-, 3- and 4-interesting polygons in the picture below.
func shapeArea(n: Int) -> Int {
    var result = 0
    
    for i in 0...n {
        if i > 1 {
            result += 2 * i + 2 * (i - 2)
        } else {
            result += i * i
        }
    }
    
    return result
}

// MARK: makeArrayConsecutive2
/// Ratiorg got statues of different sizes as a present from CodeMaster for his birthday, each statue having an non-negative integer size. Since he likes to make things perfect, he wants to arrange them from smallest to largest so that each statue will be bigger than the previous one exactly by 1. He may need some additional statues to be able to accomplish that. Help him figure out the minimum number of additional statues needed.
func makeArrayConsecutive2(statues: [Int]) -> Int {
    var min = 11
    var max = 0
    let count = statues.count
    
    statues.forEach { number in
        if number < min {
            min = number
        }
        
        if number > max {
            max = number
        }
    }
    
    return (max - min) - (count - 1)
}

// MARK: almostIncreasingSequence
/// Given a sequence of integers as an array, determine whether it is possible to obtain a strictly increasing sequence by removing no more than one element from the array.
/// Note: sequence a0, a1, ..., an is considered to be a strictly increasing if a0 < a1 < ... < an. Sequence containing only one element is also considered to be strictly increasing.
func almostIncreasingSequence(sequence: [Int]) -> Bool {
    var count = 0
    var max = -10000
    var premax = -10000
    var result: Bool

    for i in 0...(sequence.count - 1) {
        
        if (sequence[i] > max) {
            premax = max
            max = sequence[i]
        } else if (sequence[i] > premax) {
            max = sequence[i]
            count += 1
        } else {
            count += 1
        }
    }
    
    result = count < 2
    
    return result
}

// MARK: matrixElementsSum
/// After becoming famous, the CodeBots decided to move into a new building together. Each of the rooms has a different cost, and some of them are free, but there's a rumour that all the free rooms are haunted! Since the CodeBots are quite superstitious, they refuse to stay in any of the free rooms, or any of the rooms below any of the free rooms.
/// Given matrix, a rectangular matrix of integers, where each value represents the cost of the room, your task is to return the total sum of all rooms that are suitable for the CodeBots (ie: add up all the values that don't appear below a 0).
func matrixElementsSum(matrix: [[Int]]) -> Int {
    var matrixOfGood = matrix
    var result = 0
    
    for i in 0...(matrix.count - 1) {
        for j in 0...(matrix[i].count - 1) {
            if matrix[i][j] == 0 {
                for a in i...(matrix.count - 1) {
                    matrixOfGood[a][j] = 0
                }
            }
        }
    }
    
    for a in 0...(matrixOfGood.count - 1) {
        for b in 0...(matrixOfGood[a].count - 1) {
            result = result + matrixOfGood[a][b]
        }
    }
    
    return result
}
