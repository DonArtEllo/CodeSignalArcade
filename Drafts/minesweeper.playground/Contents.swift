func minesweeper(matrix: [[Bool]]) -> [[Int]] {
    var miner = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
    
    var newMatrix = [[Bool]](repeating: [Bool](repeating: false, count: matrix[0].count + 2), count: matrix.count + 2)
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            newMatrix[i + 1][j + 1] = matrix[i][j]
        }
    }
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            
            let a = i + 1
            let b = j + 1
            miner[i][j] += (newMatrix[a - 1][b - 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a - 1][b] ? 1 : 0)
            miner[i][j] += (newMatrix[a - 1][b + 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a][b - 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a][b + 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a + 1][b - 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a + 1][b] ? 1 : 0)
            miner[i][j] += (newMatrix[a + 1][b + 1] ? 1 : 0)
        }
        
    }
    
    return miner
}

let matrix = [[true,false,false,true],
              [false,false,true,false],
              [true,true,false,true]]
minesweeper(matrix: matrix)
