/*
func stringsRearrangement(inputArray: [String]) -> Bool {
    
    var array = inputArray
    for _ in 0..<array.count {
        if check(array) {
            return true
        }
        let element = array.remove(at: 0)
        array.append(element)
        print(array)
    }
    
    return false
}

func check(_ inputArray: [String]) -> Bool {
    for i in 0..<(inputArray.count - 1) {
        if difference(inputArray[i], inputArray[i + 1]) != 1 {
            return false
        }
    }
    return true
}

func difference(_ string1: String, _ string2: String) -> Int {
    var count = 0
    let stringArray1 = Array(string1)
    let stringArray2 = Array(string2)
    for i in 0..<string1.count {
        if stringArray1[i] != stringArray2[i] {
            count += 1
        }
    }
    return count
}
*/
let inputArray = [
    "abc",
    "bef",
    "bcc",
    "bec",
    "bbc",
    "bdc"
]



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

stringsRearrangement(inputArray: inputArray)


