//from collections import defaultdict
//def solve(st) :
//   freq = defaultdict(int)
//   for char in st :
//      freq[char] += 1
//   odd_count = 0
//   for i in freq.values():
//      if i % 2 == 1:
//         odd_count = odd_count + 1
//      if odd_count > 1:
//         return False
//   return True
//s = "raaecrc"
//print(solve(s))

func palindromeRearranging(inputString: String) -> Bool {

    var charDict = [Character: Int]()
    for char in inputString {
        if let _ = charDict[char] {
            charDict[char]! += 1
        } else {
            charDict[char] = 1
        }
    }
    var oddCount = 0
    print(charDict)
    for i in charDict.values {
        if i % 2 == 1 {
            oddCount += 1
        }
        if oddCount > 1 {
            return false
        }
    }
    
    return true
}

palindromeRearranging(inputString: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbccccaaaaaaaaaaaaa")
