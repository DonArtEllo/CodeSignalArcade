// MARK: allLongestStrings
/// Given an array of strings, return another array containing all of its longest strings.
func allLongestStrings(inputArray: [String]) -> [String] {
    var length = 0
    var outputArray = [""]
    
    for i in 0...(inputArray.count - 1) {
        if inputArray[i].length > length {
            outputArray.removeAll()
            outputArray.append(inputArray[i])
            length = inputArray[i].length
        } else if inputArray[i].length == length {
            outputArray.append(inputArray[i])
        }
    }
    
    return outputArray
}

// MARK: commonCharacterCount
/// Given two strings, find the number of common characters between them.
func commonCharacterCount(s1: String, s2: String) -> Int {

    let dictionary1 = s1.reduce([:]) { (dict, char) -> Dictionary<Character,Int> in
        var dict = dict
        let i = dict[char] ?? 0
        dict[char] = i + 1
        return dict
    }
    
    let dictionary2 = s2.reduce([:]) { (dict, char) -> Dictionary<Character,Int> in
        var dict = dict
        let i = dict[char] ?? 0
        dict[char] = i + 1
        return dict
    }
    
    var result = 0
    
    for a in dictionary1.keys {
        if dictionary1[a] ?? 0 > dictionary2[a] ?? 0 {
            result += dictionary2[a] ?? 0
        } else {
            result += dictionary1[a] ?? 0
        }
    }
    
    return result
}

// MARK: isLucky
/// Ticket numbers usually consist of an even number of digits. A ticket number is considered lucky if the sum of the first half of the digits is equal to the sum of the second half.
/// Given a ticket number n, determine if it's lucky or not.
func isLucky(n: Int) -> Bool {
    var str = String(n)
    let halfLength = str.count / 2

    let index = str.index(str.startIndex, offsetBy: halfLength)
    str.insert("-", at: index)
    let result = str.split(separator: "-")
    
    let firstHalf = Array(result[0])
    let secondHalf = Array(result[1])
    var firstHalfSum = 0
    var secondHalfSum = 0
    
    for num in firstHalf {
        firstHalfSum += Int(String(num)) ?? 0
    }
    
    for num in secondHalf {
        secondHalfSum += Int(String(num)) ?? 0
    }

    return (firstHalfSum == secondHalfSum)
}

// MARK: sortByHeight
/// Some people are standing in a row in a park. There are trees between them which cannot be moved. Your task is to rearrange the people by their heights in a non-descending order without moving the trees. People can be very tall!
func sortByHeight(a: [Int]) -> [Int] {
    var people: [Int] = []
    var sorted = a
    var index = 0
    
    for num in a {
        if num != -1 {
            people.append(num)
        }
    }
    
    people.sort{ $0 < $1 }
    
    for i in 0...(sorted.count - 1) {
        if sorted[i] != -1 {
            sorted[i] = people[index]
            index += 1
        }
    }
    
    return sorted
}

// MARK: reverseInParentheses
/// Write a function that reverses characters in (possibly nested) parentheses in the input string.
/// Input strings will always be well-formed with matching ()s.
func reverseInParentheses(inputString: String) -> String {
    var input = inputString
    
    while true {
        guard let close = input.firstIndex(of: ")") else { break }
        
        let forOpen = input[..<close]
        guard let open = forOpen.lastIndex(of: "(") else { break }
        
        let start = input[..<open]
        let middle = String(input[input.index(after: open)..<close].reversed())
        let end = input[input.index(after: close)..<input.endIndex]
        
        input = start + middle + end
        print(input)
    }
    
    return input
}
