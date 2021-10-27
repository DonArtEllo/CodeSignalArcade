func differentSymbolsNaive(s: String) -> Int {
    return Set(s).count
}

let str = "aaaaaaabbbbbcccbhdhdhjjjjjjj"
differentSymbolsNaive(s: str)
