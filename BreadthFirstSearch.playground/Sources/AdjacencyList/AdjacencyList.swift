
open class AdjacencyList<T: Hashable> {
    public var adjacencyDic : [Vertex<T> : [Edge<T>]] = [:]
    public init() {}
    
    /// 添加一条有向边
    fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDic[source]?.append(edge)
    }
    
    /// 添加一条无向边
    fileprivate func addUnDirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
}

extension AdjacencyList: Graphable {
     public typealias Element = T
    /// 创建一个顶点
    public func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)
        
        if adjacencyDic[vertex] == nil {
            adjacencyDic[vertex] = []
        }
        
        return vertex
    }
    
    /// 获取所有连接到指定顶点的边
    public func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDic[source]
    }

    /// 获取两个顶点间的权重
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        // 说明没有从 source 出发的线
        guard let edges = adjacencyDic[source] else {
            return nil
        }
        
        // 遍历所有线
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        
        // 没有找到 source 到 destination 的线
        return nil
    }

     public var description: CustomStringConvertible {
        var result = ""
        // 遍历字典
        for (vertex, edges) in adjacencyDic {
            var edgeString = ""
            // 每个顶点的线
            for (index, edge) in edges.enumerated() {
                if index == edges.count - 1 {
                    edgeString.append("\(edge.destination)")
                } else {
                    edgeString.append("\(edge.destination), ")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n")
        }
        return result
    }

    /// 添加一个边到两个顶点, 并且可以指定权重和边的类型
    public func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUnDirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
}
