func sudoku2(grid: [[Character]]) -> Bool {
    for i in 0..<grid.count {
        if !checkLine(grid[i]) {
            return false
        }
        var column = [Character]()
        for j in 0..<grid.count {
            if (i % 3 == 0) && (j % 3 == 0) {
                if !checkSquare(grid: grid, row: i, column: j) {
                    return false
                }
            }
            column.append(grid[j][i])
        }
        if !checkLine(column) {
            return false
        }
    }
    return true
}

func checkLine(_ line: [Character]) -> Bool {
    var checker: Set<Character> = []
    for item in line {
        if !item.isNumber {
            continue
        }
        if checker.contains(item) {
            return false
        } else {
            checker.insert(item)
        }
    }
    return true
}

func checkSquare(grid: [[Character]], row: Int, column: Int) -> Bool {
    var checker: Set<Character> = []
    for i in row..<(row + 3) {
        for j in column..<(column + 3) {
            let item = grid[i][j]
            if !item.isNumber {
                continue
            }
            if checker.contains(item) {
                return false
            } else {
                checker.insert(item)
            }
        }
    }
    return true
}
