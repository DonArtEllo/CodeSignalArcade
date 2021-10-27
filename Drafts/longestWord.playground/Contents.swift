import Foundation

func longestWord(text: String) -> String {
    let separators = CharacterSet(charactersIn: ",; /.!?[]{}()*")
    let words = text.components(separatedBy: separators)
    var maxWord = ""
    for word in words {
        maxWord = (maxWord.count > word.count ? maxWord : word)
    }
    return maxWord
}
