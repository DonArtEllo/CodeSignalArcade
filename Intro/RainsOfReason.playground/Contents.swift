// MARK: arrayReplace
/// Given an array of integers, replace all the occurrences of elemToReplace with substitutionElem.
func arrayReplace(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var outputArray = inputArray
    
    for i in 0..<outputArray.count {
        outputArray[i] = (outputArray[i] == elemToReplace ? substitutionElem : outputArray[i])
    }
    
    return outputArray
}

// MARK: evenDigitsOnly
/// Check if all digits of the given integer are even.
func evenDigitsOnly(n: Int) -> Bool {
    var number = n
    
    repeat {
        print(number)
        if number % 2 != 0 {
            return false
        }
        number = number / 10
    } while number != 0
    
    return true
}

// MARK: variableName
/// Correct variable names consist only of English letters, digits and underscores and they can't start with a digit.
/// Check if the given string is a correct variable name.
func variableName(name: String) -> Bool {
    let nameArray = Array(name)
    
    for i in 0..<nameArray.count {
        if nameArray[i].isNumber {
            if i == 0 {
                return false
            }
            continue
        }
        if (nameArray[i].isLetter) || (nameArray[i] == "_") {
            continue
        }
        return false
    }
    
    return true
}

// MARK: alphabeticShift
/// Given a string, your task is to replace each of its characters by the next one in the English alphabet; i.e. replace a with b, replace b with c, etc (z would be replaced by a).
func alphabeticShift(inputString: String) -> String {
    var result = ""

    for letter in inputString.utf8 {
        let newLetter = Character(UnicodeScalar(letter + 1 == 123 ? 97 : letter + 1))
        result += String(newLetter)
    }
    
    return result
}

// MARK: chessBoardCellColor
/// Given two cells on the standard chess board, determine whether they have the same color or not.
func chessBoardCellColor(cell1: String, cell2: String) -> Bool {
    let cellOne = [cell1[cell1.startIndex], cell1[cell1.index(before: cell1.endIndex)]]
    let cellTwo = [cell2[cell2.startIndex], cell2[cell2.index(before: cell2.endIndex)]]
    
    let first = cellOne[0].asciiValue! % 2 == Int(String(cellOne[1]))! % 2
    let second = cellTwo[0].asciiValue! % 2 == Int(String(cellTwo[1]))! % 2
    
    return (first == second ? true : false)
}
