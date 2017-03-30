//
//  LinkedList.swift
//  LinkedList
//
//  Created by hao Mac Mini on 2017/3/30.
//  Copyright © 2017年 Vito.Yang. All rights reserved.
//

/// 节点类
public class Node<T> {
    /// 该节点的值
    var value: T
    /// 下一个节点的指针
    var next: Node?
    /// 双链表中还有一个指向上一个节点的指针
    weak var previous: Node?
    
    init(value: T) {
        self.value = value
    }
    
    deinit {
        print("Node \(value) deinit")
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}

/// 链表
public class LinkedList<T> {
    /// 表头
    var head: Node<T>?
    /// 表尾
    private var tail:Node<T>?
    
    public init() {}
    
    /// 判断一个链表是否为空, 只需要判断表头是否为 nil
    public var isEmpty: Bool {
        return head == nil
    }
    
    /// 返回第一个
    public var first: Node<T>? {
        return head
    }
    
    /// 返回最后一个
    public var last: Node<T>? {
        return tail
    }
    
    /// 插入一个值
    public func append(value: T) {
        let newNode = Node(value: value)
        // 如果存在最后一个值, 则插入到最后一个值的末尾
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            // 不存在最后一个值, 则将新值作为表头
            head = newNode
        }
        // 把新值作为表尾
        tail = newNode
    }
    
    public func node(at index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node?.next
            }
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        // 如果存在一个, 说明不是表头
        if let prev = prev {
            prev.next = next
        } else {
            // 说明删除的是表头, 将下一个节点作为新的表头
            head = next
        }
        
        next?.previous = prev
        
        // 如果删除的是表尾, 则将表尾的前一个节点作为新的表尾
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil { text += ", " }
        }
        text += "]"
        return text
    }
}


