
public enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}
