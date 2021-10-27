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

let input = "abbcabb"
let output = lineEncoding(s: input)
print(input == output)
