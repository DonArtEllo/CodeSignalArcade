// MARK: add
/// Write a function that returns the sum of two numbers.
func add(param1: Int, param2: Int) -> Int {
    return param1 + param2
}

// MARK: centuryFromYear
/// Given a year, return the century it is in. The first century spans from the year 1 up to and including the year 100, the second - from the year 101 up to and including the year 200, etc.
func centuryFromYear(year: Int) -> Int {
    let century = year / 100
    
    if (year % 100 != 0) {
        return century + 1
    }
    
    return century
}

// MARK: checkPalindrome
/// Given the string, check if it is a palindrome.
func checkPalindrome(inputString: String) -> Bool {
    var backwardString = ""
    let inputStringArray = Array(inputString)
    let length = inputString.count - 1
    
    for i in 0...length {
        let char = String(inputStringArray[length - i])
        backwardString = backwardString + char
    }
    
    if inputString == backwardString {
        return true
    }
    
    return false
}

