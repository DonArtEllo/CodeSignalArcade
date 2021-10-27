// MARK: circleOfNumbers
/// Consider integer numbers from 0 to n - 1 written down along the circle in such a way that the distance between any two neighboring numbers is equal (note that 0 and n - 1 are neighboring, too).
/// Given n and firstNumber, find the number which is written in the radially opposite position to firstNumber.
func circleOfNumbers(n: Int, firstNumber: Int) -> Int {
    return (firstNumber + n / 2) % n
}

// MARK: depositProfit
/// You have deposited a specific amount of money into your bank account. Each year your balance increases at the same growth rate. With the assumption that you don't make any additional deposits, find out how long it would take for your balance to pass a specific threshold.
func depositProfit(deposit: Int, rate: Int, threshold: Int) -> Int {
    var sum = Double(deposit)
    var year = 0
    
    while (Double(threshold) > sum) {
        sum += sum * Double(rate) / 100
        year += 1
    }

    return year
}

// MARK: absoluteValuesSumMinimization
/// Given a sorted array of integers a, your task is to determine which element of a is closest to all other values of a. In other words, find the element x in a, which minimizes the following sum:
/// *abs(a[0] - x) + abs(a[1] - x) + ... + abs(a[a.length - 1] - x)*
/// (where abs denotes the absolute value)
/// If there are several possible answers, output the smallest one.
func absoluteValuesSumMinimization(a: [Int]) -> Int {
    return a[(a.count - 1)/2]
}

// MARK: stringsRearrangement
/// Given an array of equal-length strings, you'd like to know if it's possible to rearrange the order of the elements in such a way that each consecutive pair of strings differ by exactly one character. Return true if it's possible, and false if not.
func stringsRearrangement(inputArray: [String]) -> Bool {
    let length = inputArray.count
    var graph = [[Bool]](repeating: [Bool](repeating: false, count: length), count: length)
    
    for i in 0..<length {
        for j in i..<length {
            var count = 0
            let iString = Array(inputArray[i])
            let jString = Array(inputArray[j])
            
            for k in 0..<inputArray[0].count {
                if iString[k] != jString[k] {
                    count += 1
                }
            }
            
            if count == 1{
                graph[i][j] = true
                graph[j][i] = true
            }
        }
    }
    
    return check(graph, length)
}

func difference(_ count: Int, _ graph: [[Bool]], _ visited: [Int], _ inStack: Int, _ length: Int) -> [Bool:[Int]] {
    var visitedNew = visited
    
    if inStack == length {
        return [true:visitedNew]
    }
    
    for i in 0..<length {
        if (graph[count][i]) && (visited[i] == 0) {
            visitedNew[i] = 1
            let diff = difference(i, graph, visitedNew, inStack + 1, length)
            
            if diff[true] != nil {
                visitedNew = diff[true]!
                return [true : visitedNew]
            }
            
            if let visit = diff[false] {
                visitedNew = visit
            }
            
            visitedNew[i] = 0
        }
    }
    
    return [false : visitedNew]
}

func check(_ graph: [[Bool]], _ length: Int) -> Bool {
    var visited = [Int](repeating: 0, count: length)
    
    for i in 0..<length {
        visited[i] = 1
        let diff = difference(i, graph, visited, 1, length)
        
        if diff[true] != nil {
            return true
        }
        
        if let visit = diff[false] {
            visited = visit
        }
        
        visited[i] = 0
    }
    
    return false
}
