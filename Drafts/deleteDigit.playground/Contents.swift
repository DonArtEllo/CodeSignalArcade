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
