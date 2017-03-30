
public struct Queue<T> {
    // 用一个链表来存储队列中的元素
    fileprivate var list = LinkedList<T>()
    
    public init() {}
    
    // 入队
    public mutating func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    // 出队
    public mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(node: element)
    }
    
    public func peek() -> T? {
        return list.first?.value
    }
    
    // 队列是否为空
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}
