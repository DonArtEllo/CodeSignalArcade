func crosswordFormation(words: [String]) -> Int {
    return permuteWirth(words, words.count - 1)
}

func permuteWirth(_ a: [String], _ n: Int) -> Int{
    var count = 0
    if n == 0 {
        count += checkWords(a[0],a[1],a[2],a[3])
    } else {
        var a = a
        count += permuteWirth(a, (n - 1))
        for i in 0..<n {
            a.swapAt(i, n)
            count += permuteWirth(a, (n - 1))
            a.swapAt(i, n)
        }
    }
    return count
}

func checkWords(_ a: String, _ b: String, _ c: String, _ d: String) -> Int{
    var count = 0
    for a1 in 0..<a.count {
        for b1 in 0..<b.count {
            if a[String.Index(encodedOffset: a1)] != b[String.Index(encodedOffset: b1)] {
                continue
            }
            if b1 + 2 >= b.count {
                continue
            }
            for b2 in (b1 + 2)..<b.count {
                for c1 in 0..<c.count {
                    if c[String.Index(encodedOffset: c1)] != b[String.Index(encodedOffset: b2)] {
                        continue
                    }
                    if a1 + 2 >= a.count {
                        continue
                    }
                    for a2 in (a1 + 2)..<a.count {
                        for d1 in 0..<d.count {
                            if a[String.Index(encodedOffset: a2)] != d[String.Index(encodedOffset: d1)] {
                                continue
                            }
                            let c2 = c1 + (a2 - a1)
                            let d2 = d1 + (b2 - b1)
                            if (c2 < c.count) && (d2 < d.count) {
                                if (c[String.Index(encodedOffset: c2)] == d[String.Index(encodedOffset: d2)]) {
                                    count += 1
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return count
}

crosswordFormation(words:
                    ["aaaaaaaaaaaaaaa",
                     "aaaaaaaaaaaaaaa",
                     "aaaaaaaaaaaaaaa",
                     "aaaaaaaaaaaaaaa"])
