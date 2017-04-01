//
//  Visited.swift
//  SearchAlgorithm
//
//  Created by hao Mac Mini on 2017/4/1.
//  Copyright © 2017年 Vito.Yang. All rights reserved.
//

import Foundation

public enum Visited<T: Hashable> {
    case source
    case edge(Edge<T>)
}
