func digitsProduct(product: Int) -> Int {
    var input = product
    var str = ""
    if input == 0 {
        return 10
    }
    if (input < 9) {
        return input
    }
    var digit = 9
    while digit > 1 {
        if input % digit == 0 {
            str += String(digit)
            input /= digit
            if input % digit == 0 {
                digit += 1
            }
            print(str)
        }
        digit -= 1
    }

    
    if input < 2 {
        return Int(String(str.reversed())) ?? -1
    } else {
        return -1
    }
}

let num = 12
digitsProduct(product: num)
