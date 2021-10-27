func rotateImage(a: [[Int]]) -> [[Int]] {
    var b = [[Int]]()
    let count = a.count - 1
    for i in 0...count {
        var newStr = [Int]()
        for j in 0...count {
            let k = count - j
            newStr.append(a[k][i])
        }
        b.append(newStr)
    }
    return b
}

rotateImage(a:
                [[1,2,3],
                 [4,5,6],
                 [7,8,9]])
