func differentSquares(matrix: [[Int]]) -> Int {
    if (matrix.count < 2) || (matrix[0].count < 2) {
        return 0
    }
    var result = 0
    var dict = [[[Int]] : Bool]()
    for i in 1..<matrix.count {
        for j in 1..<matrix[i].count {
            let newMatrix = [
                [matrix[i - 1][j - 1],matrix[i - 1][j]],
                [matrix[i][j - 1],matrix[i][j]]
            ]
            if dict[newMatrix] == nil {
                result += 1
            }
            dict[newMatrix] = true
        }
    }
    
    return result
}

let matrix = [
    [1,2,1],
    [2,2,2],
    [2,2,2],
    [1,2,3],
    [2,2,1]
]
differentSquares(matrix: matrix)
