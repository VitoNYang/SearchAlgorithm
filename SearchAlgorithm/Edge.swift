//
//  Edge.swift
//  SearchAlgorithm
//
//  Created by hao Mac Mini on 2017/4/1.
//  Copyright © 2017年 Vito.Yang. All rights reserved.
//

import Foundation


public class Edge<T: Hashable> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    
    init(source: Vertex<T>, destination: Vertex<T>) {
        self.source = source
        self.destination = destination
    }
}

extension Edge: CustomStringConvertible {
    public var description: String {
        return "\(source) -> \(destination)"
    }
}
