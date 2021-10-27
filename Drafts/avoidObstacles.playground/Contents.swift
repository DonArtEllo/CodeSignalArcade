func avoidObstacles(inputArray: [Int]) -> Int {
    let obstacles = inputArray.sorted()
    var step = 0
    var mark = false
    
    for i in 1...1000 {
        step = i
        for obstacle in obstacles {
            mark = true
//            print(obstacle, " ", step, " ", obstacle % step)
            if step == obstacle {
                mark = false
                break
            }
            
            if obstacle % step == 0 {
                mark = false
                continue
            }
//            print("Check")
        }
        if mark {
            break
        }
    }
    
    if !mark {
        step += 1
    }
    
    return step
}

let inputArray = [2, 3]
avoidObstacles(inputArray: inputArray)
