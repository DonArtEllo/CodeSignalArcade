func isBeautifulString(inputString: String) -> Bool {
    
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    let dictionaryInput = inputString.reduce([:]) { (dict, char) -> Dictionary<Character,Int> in
        var dict = dict
        let i = dict[char] ?? 0
        dict[char] = i + 1
        return dict
    }
    var count = 0
    for char in alphabet {
        if char == "a" {
            if dictionaryInput[char] == 0 {
                return false
            } else {
                count = dictionaryInput[char] ?? 0
                continue
            }
        }
        if dictionaryInput[char] ?? 0 > count {
            return false
        }
        count = dictionaryInput[char] ?? 0
    }
    
    return true
}

isBeautifulString(inputString: "bbbaacdafe")
