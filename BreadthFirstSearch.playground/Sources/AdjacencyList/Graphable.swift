
protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    
    /// 创建一个顶点
    func createVertex(data: Element) -> Vertex<Element>
    /// 添加一个边到两个顶点, 并且可以指定权重和边的类型
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    /// 获取两个顶点间的权重
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    /// 获取所有连接到指定顶点的边
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}
