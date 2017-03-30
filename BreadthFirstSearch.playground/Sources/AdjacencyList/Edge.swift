
// 边的类型
public enum EdgeType {
    /// directed 代表有向边
    /// undirected 代表无向边
    case directed, undirected
}

// 边
public struct Edge<T: Hashable> {
    // 起点
    public var source: Vertex<T>
    /// 终点
    public var destination: Vertex<T>
    /// 边的权重
    public let weight: Double?
    
}

extension Edge: Hashable {
    public var hashValue: Int {
        var string = "\(source)\(destination)"
        if let weight = weight {
            string += "\(weight)"
        }
        return string.hashValue
    }

    public static func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
            lhs.destination == rhs.source &&
            lhs.weight == rhs.weight
    }
}
