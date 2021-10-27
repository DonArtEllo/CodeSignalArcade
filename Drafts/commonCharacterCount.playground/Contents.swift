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

let s1 = "aabcc"
let s2 = "adcaa"


