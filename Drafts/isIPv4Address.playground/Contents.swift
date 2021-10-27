func isIPv4Address(inputString: String) -> Bool {
    let maybeAdress = inputString.split(separator: ".")
    let inputArray = Array(inputString)
    var dotCount = 0
    
    for i in 0..<inputArray.count {
        if inputArray[i] == "." {
            dotCount += 1
        }
    }
    
    if (maybeAdress.count != 4) || (dotCount != 3) {
        return false
    }
    
    for cell in maybeAdress {
        if cell.count > 3 {
            return false
        }
        
        guard let number = Int(cell) else { return false }
        
        if (number < 10) && (cell.count > 1) {
            return false
        }
        
        if (number > 9) && (number < 100) && (cell.count > 2) {
            return false
        }
        
        if (number < 0) || (number > 255) {
            return false
        }
    }
    
    return true
}

let str = ".16.254.1"
isIPv4Address(inputString: str)
