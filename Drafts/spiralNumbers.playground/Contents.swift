func getNumberToMove(_ n: Int) -> [Int] {
    var s = [Int]()
    for i in 1..<n {
        s.append(i)
        s.append(i)
    }
    s.append(n)
    return s
}

func spiralNumbers(n: Int) -> [[Int]] {
    let typesOfMoves = [
        [0, 1],
        [1, 0],
        [0, -1],
        [-1, 0]
    ]
    var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var moves = getNumberToMove(n)
    var number = 1
    var x = 0
    var y = 0
    var movesIndex = 0
    while !moves.isEmpty {
        let numOfMoves = moves.removeLast()
        var directionToMove = [0, 0]
        for _ in 0..<numOfMoves {
            directionToMove = typesOfMoves[movesIndex % 4]
            matrix[x][y] = number
            number += 1
            x += directionToMove[0]
            y += directionToMove[1]
        }
        movesIndex += 1
        x -= directionToMove[0]
        y -= directionToMove[1]
        directionToMove =  typesOfMoves[movesIndex % 4]
        x += directionToMove[0]
        y += directionToMove[1]
    }
    
    
    return matrix
}
