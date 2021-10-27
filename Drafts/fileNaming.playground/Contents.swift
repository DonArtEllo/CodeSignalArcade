func fileNaming(names: [String]) -> [String] {
    var result: [String] = []
    var dict = [String : Int]()
    for name in names {
        var newName = ""
        if dict[name] == nil {
            dict[name] = 1
            newName = name
        } else {
            guard let _ = dict[name] else { break }
            newName = name + "(\(dict[name] ?? 1))"
            dict[name]! += 1
            if dict[newName] == nil {
                dict[newName] = 1
            } else {
                dict[name]! -= 1
                while dict[newName] != nil {
                    dict[name]! += 1
                    newName = name + "(\((dict[name] ?? 1)))"
                }
                dict[newName] = 1
            }
        }
        result.append(newName)
    }
    return result
}

let names = [
    "dd",
    "dd(1)",
    "dd(2)",
    "dd",
    "dd(1)",
    "dd(1)(2)",
    "dd(1)(1)",
    "dd",
    "dd(1)"
]
print(names)
print(fileNaming(names: names))
