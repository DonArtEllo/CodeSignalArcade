// MARK: longestWord
/// Define a word as a sequence of consecutive English letters. Find the longest word from the given string.
import Foundation

func longestWord(text: String) -> String {
    let separators = CharacterSet(charactersIn: ",'; /.!?[]{}()*-_")
    let words = text.components(separatedBy: separators)
    var maxWord = ""
    
    for word in words {
        maxWord = (maxWord.count > word.count ? maxWord : word)
    }
    
    return maxWord
}

// MARK: validTime
/// Check if the given string is a correct time representation of the 24-hour clock.
import Foundation

func validTime(time: String) -> Bool {
    let hoursAndMinutes = time.components(separatedBy: ":")
    let hours = Int(hoursAndMinutes[0])!
    let minutes = Int(hoursAndMinutes[1])!
    
    if (hours > 23) || (minutes > 59) {
        return false
    }
    
    return true
}

// MARK: sumUpNumbers
/// CodeMaster has just returned from shopping. He scanned the check of the items he bought and gave the resulting string to Ratiorg to figure out the total number of purchased items. Since Ratiorg is a bot he is definitely going to automate it, so he needs a program that sums up all the numbers which appear in the given input.
/// Help Ratiorg by writing a function that returns the sum of numbers that appear in the given inputString.
func sumUpNumbers(inputString: String) -> Int {
    var number = ""
    var result = 0
    
    for char in inputString {
        if char.isNumber {
            number.append(char)
        } else {
            let num = Int(number)
            
            result += num ?? 0
            number = ""
        }
    }
    
    if number != "" {
        let num = Int(number)
        
        result += num ?? 0
    }
    
    return result
}

// MARK: differentSquares
/// Given a rectangular matrix containing only digits, calculate the number of different 2 × 2 squares in it.
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

// MARK: digitsProduct
/// Given an integer product, find the smallest positive (i.e. greater than 0) integer the product of whose digits is equal to product. If there is no such integer, return -1 instead.
func digitsProduct(product: Int) -> Int {
    var input = product
    var str = ""
    
    if input == 0 {
        return 10
    }
    
    if (input < 9) {
        return input
    }
    
    var digit = 9
    
    while digit > 1 {
        if input % digit == 0 {
            str += String(digit)
            input /= digit
            if input % digit == 0 {
                digit += 1
            }
        }
        digit -= 1
    }

    
    if input < 2 {
        return Int(String(str.reversed())) ?? -1
    } else {
        return -1
    }
}

// MARK: fileNaming
/// You are given an array of desired filenames in the order of their creation. Since two files cannot have equal names, the one which comes later will have an addition to its name in a form of (k), where k is the smallest positive integer such that the obtained name is not used yet.
/// Return an array of names that will be given to the files.
func fileNaming(names: [String]) -> [String] {
    var result: [String] = []
    var dict = [String : Int]()
    
    for name in names {
        var newName = ""
        
        if dict[name] == nil {
            dict[name] = 1
            newName = name
        } else {
            guard let _ = dict[name] else { break }
            newName = name + "(\(dict[name] ?? 1))"
            dict[name]! += 1
            
            if dict[newName] == nil {
                dict[newName] = 1
            } else {
                dict[name]! -= 1
                while dict[newName] != nil {
                    dict[name]! += 1
                    newName = name + "(\((dict[name] ?? 1)))"
                }
                dict[newName] = 1
            }
        }
        result.append(newName)
    }
    
    return result
}

// MARK: messageFromBinaryCode
/// You are taking part in an Escape Room challenge designed specifically for programmers. In your efforts to find a clue, you've found a binary code written on the wall behind a vase, and realized that it must be an encrypted message. After some thought, your first guess is that each consecutive 8 bits of the code stand for the character with the corresponding extended ASCII code.
/// Assuming that your hunch is correct, decode the message.
func messageFromBinaryCode(code: String) -> String {
    var source = ""
    var letter = ""
    
    for i in 0..<code.count {
        letter.append(code[String.Index(encodedOffset: i)])
        
        if (i + 1) % 8 == 0 {
            source += String(Int(letter, radix: 2) ?? 0)
            letter = ""
        }
    }
    
    while source.count >= 2 {
        let digitsPerCharacter = source.hasPrefix("1") ? 3 : 2
        let charBytes = source.prefix(digitsPerCharacter)
        
        source = String(source.dropFirst(digitsPerCharacter))
        
        let number = Int(charBytes)!
        let character = UnicodeScalar(number)!
        
        letter += String(character)
    }
    
    return letter
}

// MARK: spiralNumbers
/// Construct a square matrix with a size N × N containing integers from 1 to N * N in a spiral order, starting from top-left and in clockwise direction.
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

// MARK: sudoku
/// Sudoku is a number-placement puzzle. The objective is to fill a 9 × 9 grid with digits so that each column, each row, and each of the nine 3 × 3 sub-grids that compose the grid contains all of the digits from 1 to 9.
/// This algorithm should check if the given grid of numbers represents a correct solution to Sudoku.
func sudoku(grid: [[Int]]) -> Bool {
    for i in 0..<grid.count {
        if !checkLine(grid[i]) {
            return false
        }
        
        var column = [Int]()
        
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

func checkLine(_ line: [Int]) -> Bool {
    var checker: Set<Int> = []
    
    for item in line {
        if checker.contains(item) {
            return false
        } else {
            checker.insert(item)
        }
    }
    
    return true
}

func checkSquare(grid: [[Int]], row: Int, column: Int) -> Bool {
    var checker: Set<Int> = []
    
    for i in row..<(row + 3) {
        for j in column..<(column + 3) {
            let item = grid[i][j]
            
            if checker.contains(item) {
                return false
            } else {
                checker.insert(item)
            }
        }
    }
    
    return true
}
