/*
func reverseInParentheses(inputString: String) -> String {
    var open = 0;
    var startInd = 0;
    let s = Array(inputString)

    for i in 0...(s.count - 1) {
        if s[i] == "(" {
            if open == 0 {
                startInd = i + 1
            }
            open += 1;
        }
        if (open == 1) && (s[i] == ")") {
            let start = s[0..<startInd]
            let parens = s[startInd...(i - startInd)]
            var revParens = ""
            
            var k = parens.count
            while k > 0 {
                if (parens[k] == "(") {
                    revParens += ""
                } else if (parens[k] == ")") {
                    revParens += ""
                } else {
                    revParens += String(parens[k])
                }
                k -= 1
                print(k)
                print(parens)
            }

            let end = s[(i + 1)..<s.count]
            return reverseInParentheses(inputString: (start + revParens + end))
        }
        if (s[i] == ")") {
            open -= 1
        }
    }
    return String(s)

}
 */

/*
func reverseInParentheses(inputString: String) -> String {
    let input = Array(inputString)
    var stringArray: [String] = []
    stringArray.append("")
    var resultArray: [String] = []
    
    var opened = 0
    var storage: [String] = []
    
    for i in 0..<inputString.count {
        if input[i] == "(" {
            
            if opened == 0 {
                guard let clean = stringArray.last else { break }
                resultArray.append(clean)
                stringArray.append("")
            } else {
                guard let toStorage = stringArray.last else { break }
                storage.append(toStorage)
                stringArray.append("")
            }
            
            opened += 1
            
        } else if input[i] == ")" {
            
            guard var topString = stringArray.last else { break }
            
            if opened % 2 != 0 {
                if let fromStorage = storage.last {
                    topString = fromStorage + topString
                    storage.removeLast()
                }
                topString = String(topString.reversed())
            } else {
                
                if let fromStorage = storage.last {
                    topString = String(topString.reversed())
                    topString = fromStorage + topString
                    storage.removeLast()
                }
            }

            stringArray.removeLast()
            
            if stringArray.isEmpty {
                stringArray.append(topString)
            } else {
                stringArray.append(topString)
            }
            
            opened -= 1
        } else {
            guard var top = stringArray.last else { break }
            top += String(input[i])
            stringArray.append(top)
        }
    }
    
    guard let clean = stringArray.last else { return inputString }
    resultArray.append(clean)
    
    let result = resultArray.joined(separator: "")
    return result
}
 */

//string reverseString(string s){
//    for(int i = 0;i < s.length()/2;i++){
//        char t = s[s.length()-1-i];
//        s[s.length()-1-i] = s[i];
//        s[i] = t;
//    }
//    return s;
//}
//string reverseInParentheses(string s) {
//    int beg = 0;
//    int end = s.length() - 1;
//    for(int i = 0; i < s.length(); i++){
//        if(s[i] == '(')
//            beg = i;
//        if(s[i] == ')'){
//            end = i;
//            string temp = s.substr(beg + 1, end - beg - 1);
//            return reverseInParentheses(s.substr(0, beg) + reverseString(temp) + s.substr(end + 1));
//         }
//    }
//    return s;
//}
/*
func reverseString(_ input: String) -> String{
    return String(input.reversed())
}

func reverseInParentheses(inputString: String) -> String {
    let input = Array(inputString)
    var begin = 0
    var end = inputString.count - 1
    
    for i in 0..<inputString.count {
        if input[i] == "(" {
            begin = i
        } else if input[i] == ")" {
            end = i
            
            print(begin, " ", end)
            
            var temp: [String] = []
            for j in (begin + 1)..<end {
                temp.append(String(input[j]))
            }
            let tempStr = temp.joined(separator: "")
            
            var beginArray: [String] = []
            for j in 0..<begin {
                beginArray.append(String(input[j]))
            }
            let beginStr = beginArray.joined(separator: "")
            
            var endArray: [String] = []
            endArray.append(String(input[end + 1]))
            let endStr = endArray.joined(separator: "")
            
            return reverseInParentheses(inputString: beginStr + reverseString(tempStr) + endStr)
        }
    }
    
    return inputString
}
*/

func reverseInParentheses(inputString: String) -> String {
    var input = inputString
    
    while true {
        guard let close = input.firstIndex(of: ")") else { break }
        
        let forOpen = input[..<close]
        guard let open = forOpen.lastIndex(of: "(") else { break }
        
        let start = input[..<open]
        let middle = String(input[input.index(after: open)..<close].reversed())
        let end = input[input.index(after: close)..<input.endIndex]
        
        input = start + middle + end
        print(input)
    }
    
    return input
}

let string = "0(1(2)1(4(3)4)1(8(6(5)6(5)6)8(7)8(7)8)1)0"
print("0186568787814341210")
print(reverseInParentheses(inputString: string))
