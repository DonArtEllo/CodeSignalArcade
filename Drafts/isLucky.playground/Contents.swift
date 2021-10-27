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


let str = 989989

isLucky(n: str)
