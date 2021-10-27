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

let image = [[7, 4, 0, 1],
             [5, 6, 2, 2],
             [6, 10, 7, 8],
             [1, 4, 2, 0]]
boxBlur(image: image)
