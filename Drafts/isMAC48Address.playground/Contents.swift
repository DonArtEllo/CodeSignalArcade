func isMAC48Address(inputString: String) -> Bool {
    let maybeAdress = inputString.split(separator: "-")
    let inputArray = Array(inputString)
    var hyphenCount = 0
    var check = false
    
    for i in 0..<inputArray.count {
        if inputArray[i] == "-" {
            hyphenCount += 1
        }
    }
    
    if (maybeAdress.count != 6) || (hyphenCount != 5) {
        return false
    }
    
    for cell in maybeAdress {
        if cell.count != 2 {
            return false
        }
        
        for digit in cell {
            print(digit)
            check = false
            if digit.isNumber {
                continue
            } else if digit.isLetter {
                for abc in "ABCDEF" {
                    print(digit, " ", abc)
                    if digit == abc {
                        check = true
                        break
                    }
                }
                if check {
                    continue
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    return true
}

let str = "12-34-56-78-9A-BG"
isMAC48Address(inputString: str)
