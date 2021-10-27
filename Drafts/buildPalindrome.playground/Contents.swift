func buildPalindrome(st: String) -> String {
    var palindrome: String = ""
    var leftString: String = ""
    for i in 0..<st.count {
        let index: String.Index = String.Index(encodedOffset: i)
        let potentialPalindrome = String(st[index..<st.endIndex])
        print(potentialPalindrome)
        if isPalindrome(potentialPalindrome) {
            palindrome = potentialPalindrome
            if st.count == palindrome.count {
                return palindrome
            }
            leftString = String(st[..<index])
            break
        }
    }
    return st + String(leftString.reversed())
}

func isPalindrome(_ input: String) -> Bool {
    let reverse = input.reversed()
    return String(reverse) == input
}
