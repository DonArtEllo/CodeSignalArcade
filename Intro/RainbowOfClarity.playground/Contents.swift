// MARK: isDigit
/// Determine if the given character is a digit or not.
func isDigit(symbol: Character) -> Bool {
    return symbol.isNumber
}

// MARK: lineEncoding
/// Given a string, return its encoding defined as follows:
///  - First, the string is divided into the least possible number of disjoint substrings consisting of identical characters
///    -  for example, "aabbbc" is divided into ["aa", "bbb", "c"]
///  - Next, each substring with length greater than one is replaced with a concatenation of its length and the repeating character
///    -  for example, substring "bbb" is replaced by "3b"
///  - Finally, all the new strings are concatenated together in the same order and a new string is returned.
func lineEncoding(s: String) -> String {
    let input = Array(s)
    var result = ""
    var currentChar = input[0]
    var count = 1
    
    for i in 1..<s.count {
        if input[i] == currentChar {
            count += 1
        } else {
            if count == 1 {
                result += String(currentChar)
            } else {
                result += String(count) + String(currentChar)
            }
            count = 1
            currentChar = input[i]
        }
    }
    
    if String(s[s.index(s.endIndex, offsetBy: -2)..<s.endIndex]) != String(count) + String(currentChar) {
        if count == 1 {
            return result + String(currentChar)
        } else {
            return result + String(count) + String(currentChar)
        }
    } else {
        return result
    }
}

// MARK: chessKnight
/// Given a position of a knight on the standard chessboard, find the number of different moves the knight can perform.
/// The knight can move to a square that is two squares horizontally and one square vertically, or two squares vertically and one square horizontally away from it. The complete move therefore looks like the letter L. Check out the image below to see all valid moves for a knight piece that is placed on one of the central squares.
/// https://codesignal.s3.amazonaws.com/tasks/chessKnight/img/knight.jpg?_tm=1624642282452
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

// MARK: deleteDigit
/// Given some integer, find the maximal number you can obtain by deleting exactly one digit of the given number.
func deleteDigit(n: Int) -> Int {
    let string = String(n)
    var max = Int(String(string[String.Index(encodedOffset: 1)..<string.endIndex])) ?? 0
    
    for i in 1..<string.count {
        var newMax = 0
        
        if i != string.count {
            let newString = string[string.startIndex..<String.Index(encodedOffset: i)] + string[String.Index(encodedOffset: i + 1)..<string.endIndex]
            newMax = Int(newString) ?? 0
        } else {
            newMax = Int(String(string[string.startIndex..<string.index(before: string.endIndex)])) ?? 0
        }
        
        if newMax > max {
            max = newMax
        }
    }
    
    return max
}
