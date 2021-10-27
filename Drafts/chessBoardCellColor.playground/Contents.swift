func chessBoardCellColor(cell1: String, cell2: String) -> Bool {
    let cellOne = [cell1[cell1.startIndex], cell1[cell1.index(before: cell1.endIndex)]]
    let cellTwo = [cell2[cell2.startIndex], cell2[cell2.index(before: cell2.endIndex)]]
    
    let first = cellOne[0].asciiValue! % 2 == Int(String(cellOne[1]))! % 2
    let second = cellTwo[0].asciiValue! % 2 == Int(String(cellTwo[1]))! % 2
    
    return (first == second ? true : false)
}

let cell1 = "A1"
let cell2 = "C3"
chessBoardCellColor(cell1: cell1, cell2: cell2)
