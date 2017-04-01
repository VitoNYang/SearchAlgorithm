//
//  Vertex.swift
//  SearchAlgorithm
//
//  Created by hao Mac Mini on 2017/4/1.
//  Copyright © 2017年 Vito.Yang. All rights reserved.
//

import Foundation

public class Vertex<T: Hashable> {
    let data: (T, T)
    
    init(data: (T, T)) {
        self.data = data
    }
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return data.0.hashValue + data.1.hashValue
    }
    
    public static func ==(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}
