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
    
    return result
}

let str = "2 apples, 12 oranges"
sumUpNumbers(inputString: str)
