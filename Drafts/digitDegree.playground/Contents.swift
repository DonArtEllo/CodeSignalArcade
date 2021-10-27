func digitDegree(n: Int) -> Int {
    var number = n
    if number < 10 {
        return 0
    } else {
        var i = 0
        while number >= 10 {
            var sum = 0
            let str = Array(String(number))
            for j in 0..<str.count {
                sum += Int(String(str[j]))!
            }
            number = sum
            i += 1
        }
        return i
    }
}

digitDegree(n: 91)
