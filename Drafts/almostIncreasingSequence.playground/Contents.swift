// TRY 1
/*
func almostIncreasingSequence(sequence: [Int]) -> Bool {
    
    let marker = check(sequence, -1)
    
    if marker == -1 {
        return true
    }
    
    if check(sequence, marker) == -1 {
        return true
    }
    
    if check(sequence, marker + 1) == -1 {
        return true
    }

    return false
}

func check(_ sequence: [Int], _ pos: Int) -> Int {
    
    print("---  \(pos)")

    
    if (pos < sequence.count - 1) && (pos > 0) {
        if sequence[pos - 1] >= sequence[pos + 1] {
            return (pos - 1)
        }
    }
    
    if (pos + 1) >= (sequence.count - 1) {
        return -1
    }
    
    for i in (pos + 1)...(sequence.count - 2) {
        
        print(i)
        if sequence[i] >= sequence[i + 1] {
            return i
        }
    }
   
    return -1
    
}
 */

/*
func almostIncreasingSequence(sequence: [Int]) -> Bool {
    
    if sequence.count <= 2 {
        return true
    }

    for i in 0...(sequence.count - 3) {
        if sequence[i] >= sequence [i + 1] {
            let test_seq1 = [sequence[i], sequence[i + 1]]
            let test_seq2 = [sequence[i + 1], sequence[i + 2]]
            if checker(test_seq1) {
                return true
            } else if checker(test_seq2) {
                return true
            } else {
                return false
            }
        }
    }
    return false
}

func checker(_ test: [Int]) -> Bool {

    if test.count == 2 {
        if test[0] < test[1] {
            return true
        } else {
            for i in 0...(test.count - 2) {
                if test[i] >= test[i + 1] {
                    return false
                } else {
                    continue
                }
            }
        }
        return true
    }
    
    return false
}
 */

func almostIncreasingSequence(sequence: [Int]) -> Bool {
    
    var count = 0
    var max = -10000
    var premax = -10000
    var result: Bool

    for i in 0...(sequence.count - 1) {
        
        if (sequence[i] > max) {
            premax = max
            max = sequence[i]
        } else if (sequence[i] > premax) {
            max = sequence[i]
            count += 1
        } else {
            count += 1
        }
    }
    
    result = count < 2
    
    return result
}

let seq = [1, 3, 2]

almostIncreasingSequence(sequence: seq)

/*
bool almostIncreasingSequence(std::vector sequence) {
    int res=0;
    int max= -10000, secondmax= -10000;
    for (int i=0; i<sequence.size(); i++) {
        if (sequence[i]>max) {
            secondmax=max;
            max= sequence[i];
        } else if (sequence[i]>secondmax) {
            max= sequence[i];
            res++;
        } else res++;
    }
    return (res<2);
}
 */
