extension Graphable {
    // 添加广度搜索方法
    /// from: 起点, to: 终点, 返回找到的路径
    /// 如果不存在连接起点和终点的路径, 则返回 nil
    /// 如果起点就是终点, 则返回空数组
    public func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
        
        // 用队列将待搜索的点存起来
        var queue = Queue<Vertex<Element>>()
        // 将起点入列
        queue.enqueue(source)
        // 访问过的顶点列表, 防止重复访问同一个点
        var visits: [Vertex<Element> : Visit<Element>] = [source : .source]
        
        // 从队列中出列一个顶点
        while let visitedVertex = queue.dequeue() {
            // 如果当前搜索的顶点就是终点, 则直接返回路径
            if visitedVertex == destination {
                var vertex = destination
                var route : [Edge<Element>] = []
                while let visit = visits[vertex], case .edge(let edge) = visit {
                    route = [edge] + route
                    vertex = edge.source
                }
                return route
            }
            // 查找当前点的所有可通路径
            let neigbourEdegs = edges(from: visitedVertex) ?? []
            // 遍历所有路径, 将所有路径的终点加入到队列中
            for edge in neigbourEdegs {
                // 字典中如果没有这个顶点, 说明没有访问过, 将其加入队列中
                if visits[edge.destination] == nil {
                    queue.enqueue(edge.destination)
                    visits[edge.destination] = .edge(edge)
                }
            }
        }
        // 说明没有找到路径, 返回 nil
        return nil
    }
}
