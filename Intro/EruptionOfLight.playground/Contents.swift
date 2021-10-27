// MARK: isBeautifulString
/// A string is said to be beautiful if each letter in the string appears at most as many times as the previous letter in the alphabet within the string; ie: b occurs no more times than a; c occurs no more times than b; etc. Note that letter a has no previous letter.
/// Given a string, check whether it is beautiful.
func isBeautifulString(inputString: String) -> Bool {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    let dictionaryInput = inputString.reduce([:]) { (dict, char) -> Dictionary<Character,Int> in
        var dict = dict
        let i = dict[char] ?? 0
        dict[char] = i + 1
        return dict
    }
    var count = 0
    
    for char in alphabet {
        if char == "a" {
            if dictionaryInput[char] == 0 {
                return false
            } else {
                count = dictionaryInput[char] ?? 0
                continue
            }
        }
        
        if dictionaryInput[char] ?? 0 > count {
            return false
        }
        count = dictionaryInput[char] ?? 0
    }
    
    return true
}

// MARK: findEmailDomain
/// An email address such as "John.Smith@example.com" is made up of a local part ("John.Smith"), an "@" symbol, then a domain part ("example.com").
/// The domain name part of an email address may only consist of letters, digits, hyphens and dots. The local part, however, also allows a lot of different special characters. Here you can look at several examples of correct and incorrect email addresses.
/// Given a valid email address, find its domain part.
func findEmailDomain(address: String) -> String {
    let index = address.index(after: address.lastIndex(of: "@")!)
    let range = index..<address.endIndex
    
    return String(address[range])
}

// MARK: buildPalindrome
/// Given a string, find the shortest possible string which can be achieved by adding characters to the end of initial string to make it a palindrome.
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

// MARK: electionsWinners
/// Elections are in progress!
/// Given an array of the numbers of votes given to each of the candidates so far, and an integer k equal to the number of voters who haven't cast their vote yet, find the number of candidates who still have a chance to win the election.
/// The winner of the election must secure strictly more votes than any other candidate. If two or more candidates receive the same (maximum) number of votes, assume there is no winner at all.
func electionsWinners(votes: [Int], k: Int) -> Int {
    let maxVotes = votes.max()!
    var count = 0
    var leader = 0
    
    for candidate in votes {
        if candidate == maxVotes {
            leader += 1
        }
        if (candidate + k) > maxVotes {
            count += 1
        }
    }
    
    if (leader == 1) && (count == 0) {
        return 1
    }
    
    return count
}

// MARK: isMAC48Address
/// A media access control address (MAC address) is a unique identifier assigned to network interfaces for communications on the physical network segment.
/// The standard (IEEE 802) format for printing MAC-48 addresses in human-friendly form is six groups of two hexadecimal digits (0 to 9 or A to F), separated by hyphens (e.g. 01-23-45-67-89-AB).
/// Your task is to check by given string inputString whether it corresponds to MAC-48 address or not.
func isMAC48Address(inputString: String) -> Bool {
    let maybeAdress = inputString.split(separator: "-")
    let inputArray = Array(inputString)
    var hyphenCount = 0
    var check = false
    
    for i in 0..<inputArray.count {
        if inputArray[i] == "-" {
            hyphenCount += 1
        }
    }
    
    if (maybeAdress.count != 6) || (hyphenCount != 5) {
        return false
    }
    
    for cell in maybeAdress {
        if cell.count != 2 {
            return false
        }
        
        for digit in cell {
            check = false
            if digit.isNumber {
                continue
            } else if digit.isLetter {
                for abc in "ABCDEF" {
                    if digit == abc {
                        check = true
                        break
                    }
                }
                if check {
                    continue
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    return true
}
