// MARK: areEquallyStrong
/// Call two arms equally strong if the heaviest weights they each are able to lift are equal.
/// Call two people equally strong if their strongest arms are equally strong (the strongest arm can be both the right and the left), and so are their weakest arms.
/// Given your and your friend's arms' lifting capabilities find out if you two are equally strong.
func areEquallyStrong(yourLeft: Int, yourRight: Int, friendsLeft: Int, friendsRight: Int) -> Bool {
    let yourStrong = (yourLeft > yourRight ? yourLeft : yourRight)
    let yourWeak = (yourLeft > yourRight ? yourRight : yourLeft)
    let friendsStrong = (friendsLeft > friendsRight ? friendsLeft : friendsRight)
    let friendsWeak = (friendsLeft > friendsRight ? friendsRight : friendsLeft)
    
    if (yourStrong == friendsStrong) && (yourWeak == friendsWeak) {
        return true
    }
    
    return false
}

// MARK: arrayMaximalAdjacentDifference
/// Given an array of integers, find the maximal absolute difference between any two of its adjacent elements.
func arrayMaximalAdjacentDifference(inputArray: [Int]) -> Int {
    var maxDiff = -1
    
    for i in 1..<inputArray.count {
        let diff = inputArray[i] - inputArray[i - 1]
        maxDiff = (abs(diff) > maxDiff ? abs(diff) : maxDiff)
    }
    
    return maxDiff
}

// MARK: isIPv4Address
/// An IP address is a numerical label assigned to each device (e.g., computer, printer) participating in a computer network that uses the Internet Protocol for communication. There are two versions of the Internet protocol, and thus two versions of addresses. One of them is the IPv4 address.
/// Given a string, find out if it satisfies the IPv4 address naming rules.
func isIPv4Address(inputString: String) -> Bool {
    let maybeAdress = inputString.split(separator: ".")
    let inputArray = Array(inputString)
    var dotCount = 0
    
    for i in 0..<inputArray.count {
        if inputArray[i] == "." {
            dotCount += 1
        }
    }
    
    if (maybeAdress.count != 4) || (dotCount != 3) {
        return false
    }
    
    for cell in maybeAdress {
        if cell.count > 3 {
            return false
        }
        
        guard let number = Int(cell) else { return false }
        
        if (number < 10) && (cell.count > 1) {
            return false
        }
        
        if (number > 9) && (number < 100) && (cell.count > 2) {
            return false
        }
        
        if (number < 0) || (number > 255) {
            return false
        }
    }
    
    return true
}

// MARK: avoidObstacles
/// You are given an array of integers representing coordinates of obstacles situated on a straight line.
/// Assume that you are jumping from the point with coordinate 0 to the right. You are allowed only to make jumps of the same length represented by some integer.
/// Find the minimal length of the jump enough to avoid all the obstacles.
func avoidObstacles(inputArray: [Int]) -> Int {
    let obstacles = inputArray.sorted()
    var step = 0
    var mark = false
    
    for i in 1...1000 {
        step = i
        for obstacle in obstacles {
            mark = true
            if step == obstacle {
                mark = false
                break
            }
            
            if obstacle % step == 0 {
                mark = false
                break
            }
        }
        if mark {
            break
        }
    }
    
    if !mark {
        step += 1
    }
    
    return step
}

// MARK: boxBlur
/// Last night you partied a little too hard. Now there's a black and white photo of you that's about to go viral! You can't let this ruin your reputation, so you want to apply the box blur algorithm to the photo to hide its content.
/// The pixels in the input image are represented as integers. The algorithm distorts the input image in the following way: Every pixel x in the output image has a value equal to the average value of the pixel values from the 3 × 3 square that has its center at x, including x itself. All the pixels on the border of x are then removed.
/// Return the blurred image as an integer, with the fractions rounded down.
func boxBlur(image: [[Int]]) -> [[Int]] {
    let blurredLine = [Int](repeating: 1, count: image[0].count - 2)
    var blurredImage = [[Int]](repeating: blurredLine, count: image.count - 2)
    var i = blurredImage.count
    
    while i > 0 {
        i -= 1
        
        var j = blurredLine.count
        
        while j > 0 {
            j -= 1
            let a = i + 1
            let b = j + 1
            blurredImage[i][j] = (image[a - 1][b - 1]
                                    + image[a - 1][b]
                                    + image[a - 1][b + 1]
                                    + image[a][b - 1]
                                    + image[a][b]
                                    + image[a][b + 1]
                                    + image[a + 1][b - 1]
                                    + image[a + 1][b]
                                    + image[a + 1][b + 1]
                                   ) / 9
        }
    }
    
    return blurredImage
}

// MARK: minesweeper
/// In the popular Minesweeper game you have a board with some mines and those cells that don't contain a mine have a number in it that indicates the total number of mines in the neighboring cells. Starting off with some arrangement of mines we want to create a Minesweeper game setup.
func minesweeper(matrix: [[Bool]]) -> [[Int]] {
    var miner = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
    var newMatrix = [[Bool]](repeating: [Bool](repeating: false, count: matrix[0].count + 2), count: matrix.count + 2)
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            newMatrix[i + 1][j + 1] = matrix[i][j]
        }
    }
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            let a = i + 1
            let b = j + 1
            
            miner[i][j] += (newMatrix[a - 1][b - 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a - 1][b] ? 1 : 0)
            miner[i][j] += (newMatrix[a - 1][b + 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a][b - 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a][b + 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a + 1][b - 1] ? 1 : 0)
            miner[i][j] += (newMatrix[a + 1][b] ? 1 : 0)
            miner[i][j] += (newMatrix[a + 1][b + 1] ? 1 : 0)
        }
    }
    
    return miner
}
