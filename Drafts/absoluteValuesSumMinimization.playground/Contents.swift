func absoluteValuesSumMinimization(a: [Int]) -> Int {
//    var min = 10000000
//    var minNum = -1
//    for number in a {
//        var sum = 0
//        for i in 0..<a.count {
//            sum += abs(a[i] - number)
//        }
//        print(sum, " ", min)
//        if min > sum {
//            min = sum
//            minNum = number
//        }
//        print(minNum)
//    }
//    return minNum
    
    return a[(a.count - 1) / 2]
}

let array = [23]
absoluteValuesSumMinimization(a: array)
