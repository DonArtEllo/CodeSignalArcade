// if A==B:
//        return True
//    i = 0
//    while i<len(A):
//        if A[i]==B[i]:
//            A.pop(i)
//            B.pop(i)
//        else:
//            i += 1
//    if len(A)!=2:
//        return False
//    B.reverse()
//    if A==B:
//        return True
//    else:
//        return False
/*
func areSimilar(a: [Int], b: [Int]) -> Bool {
    var aArray = a
    var bArray = b
    
    if aArray == bArray {
        return true
    }
    
    var i = 0
    while i < (aArray.count - 1) {
        if aArray[i] == bArray[i] {
            aArray.remove(at: i)
            bArray.remove(at: i)
        } else {
            i += 1
        }
    }
    if aArray.count != 3 {
        return false
    }
    bArray = bArray.reversed()
    if aArray == bArray {
        return true
    } else {
        return false
    }
}
 */

//for i in range(0,len(A)):
//        for j in range(i,len(A)):
//            temp = A[i]
//            A[i] = A[j]
//            A[j] = temp
//            if A == B:
//                return True
//            A[j] = A[i]
//            A[i] = temp
//
//    return False

/*
func areSimilar(a: [Int], b: [Int]) -> Bool {
    var aArray = a
    let bArray = b
    
    if aArray == bArray {
        return true
    }
    
    for i in 0..<aArray.count {
        for j in 0..<aArray.count {
            aArray[i] = a[j]
            aArray[j] = a[i]
            if aArray == bArray {
                return true
            }
            aArray[i] = a[i]
            aArray[j] = a[j]
        }
    }
    
    return false
}
 */

//boolean areSimilar(int[] a, int[] b) {
//    int firstNonmatchIndex = - 1;
//    int nonMatchCount = 0;
//    for (int i = 0; i < a.length; i++){
//        if(a[i] != b[i]){
//            nonMatchCount++;
//            if (firstNonmatchIndex < 0){
//                firstNonmatchIndex = i;
//            }
//            else if (a[firstNonmatchIndex] != b[i] || a[i] != b[firstNonmatchIndex] || nonMatchCount > 2){
//                return false;
//            }
//        }
//    }
//    return true;
//}

func areSimilar(a: [Int], b: [Int]) -> Bool {
    var firstNonMatchIndex = -1
    var nonMatchCount = 0
    for i in 0..<a.count {
        if a[i] != b[i] {
            nonMatchCount += 1
            if firstNonMatchIndex < 0 {
                firstNonMatchIndex = i
            } else if (a[firstNonMatchIndex] != b[i]) || (a[i] != b[firstNonMatchIndex]) || (nonMatchCount > 2) {
                return false
            }
        }
    }

    return true
}

