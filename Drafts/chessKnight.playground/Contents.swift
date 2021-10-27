func chessKnight(cell: String) -> Int {
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
    
    let passCells = [
        [1, 2],
        [2, 1],
        [-1, 2],
        [1, -2],
        [-2, 1],
        [2, -1],
        [-1, -2],
        [-2, -1]
    ]
    guard let cellLetter = dict[cell[cell.startIndex]] else { return 0 }
    guard let cellDigit = Int(String(cell[cell.index(before: cell.endIndex)])) else { return 0 }
    var count = 0
    
    for i in 0..<passCells.count {
        let columnForPass = cellLetter + passCells[i][0]
        let rowForPass = cellDigit + passCells[i][1]
        
        if (columnForPass > 0) && (columnForPass < 9) && (rowForPass > 0) && (rowForPass < 9) {
            count += 1
        }
    }
    
    return count
}
