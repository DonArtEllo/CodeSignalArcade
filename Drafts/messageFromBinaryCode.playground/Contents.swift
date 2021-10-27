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

let code = "010010000110010101101100011011000110111100100001"
messageFromBinaryCode(code: code)
