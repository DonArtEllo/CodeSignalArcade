func variableName(name: String) -> Bool {
    let nameArray = Array(name)
    
    for i in 0..<nameArray.count {
        if nameArray[i].isNumber {
            if i == 0 {
                return false
            }
            continue
        }
        if (nameArray[i].isLetter) || (nameArray[i] == "_") {
            continue
        }
        return false
    }
    
    return true
}
