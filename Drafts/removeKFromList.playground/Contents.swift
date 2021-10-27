// Singly-linked lists are already defined with this interface:
public class ListNode<T> {
    public var value: T
    public var next: ListNode<T>?
    public init(_ x: T) {
        self.value = x
        self.next = nil
    }
}

func removeKFromList(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
    var list = l
    let nl = ListNode(0)
    var temp = nl
    while list != nil {
        if list?.value != k {
            temp.next = list
            temp = temp.next!
        }
        list = list?.next
    }
    temp.next = nil
    return nl.next
}

removeKFromList(l: ListNode(1), k: 3)
