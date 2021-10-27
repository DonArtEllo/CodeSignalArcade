func bishopAndPawn(bishop: String, pawn: String) -> Bool {
    let dict: [Character: Int] = [
        "a" : 1,
        "b" : 2,
        "c" : 3,
        "d" : 4,
        "e" : 5,
        "f" : 6,
        "g" : 7,
        "h" : 8
    ]
    
    let newBishop = [dict[bishop[bishop.startIndex]], Int(String(bishop[bishop.index(before: bishop.endIndex)]))]
    let newPawn = [dict[pawn[pawn.startIndex]], Int(String(pawn[pawn.index(before: pawn.endIndex)]))]
    
    return abs(newBishop[0]! - newPawn[0]!) == abs(newBishop[1]! - newPawn[1]!)
}

bishopAndPawn(bishop: "a1", pawn: "c3")
