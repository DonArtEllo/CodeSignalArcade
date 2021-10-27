func alphabeticShiftBad(inputString: String) -> String {
    let inputArray = Array(inputString)
    let abcTobcdDictionary = [
        "a" : "b",
        "b" : "c",
        "c" : "d",
        "d" : "e",
        "e" : "f",
        "f" : "g",
        "g" : "h",
        "h" : "i",
        "i" : "j",
        "j" : "k",
        "k" : "l",
        "l" : "m",
        "m" : "n",
        "n" : "o",
        "o" : "p",
        "p" : "q",
        "q" : "r",
        "r" : "s",
        "s" : "t",
        "t" : "u",
        "u" : "v",
        "v" : "w",
        "w" : "x",
        "x" : "y",
        "y" : "z",
        "z" : "a"
    ]
    
    var result = ""
    for i in 0..<inputString.count {
        if let translate = abcTobcdDictionary[String(inputArray[i])] {
            result += translate
        }
    }
    
    return result
}

// Better
func alphabeticShift(inputString: String) -> String {
  
  var result = ""
  for letter in inputString.utf8 {
    let newLetter = Character(UnicodeScalar(letter + 1 == 123 ? 97 : letter + 1))
    result += String(newLetter)
  }
  return result
}
