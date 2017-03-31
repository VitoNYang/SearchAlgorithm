//
//  Extension.swift
//  SearchAlgorithm
//
//  Created by hao on 2017/3/31.
//  Copyright © 2017年 Vito.Yang. All rights reserved.
//

import UIKit

extension Array where Element == [Int] {
    var fullCount: Int {
        var fullCount = 0
        for item in self {
            fullCount += item.count
        }
        return fullCount
    }
    
    subscript(index: (x: Int, y: Int)) -> Int {
        return self[index.x][index.y]
    }
    
    func printArray() {
        var str = ""
        for subArray in self {
            for item in subArray {
                str += "\(item) "
            }
            str += "\n"
        }
        print(str)
    }

}

extension UITextField {
    var intNumber: Int {
        return Int(text ?? "0") ?? 0
    }
}

enum MatrixDirection {
    case top
    case right
    case bottom
    case left
    
    var tupleValue: (Int, Int) {
        switch self {
        case .top:
            return (-1, 0)
        case .right:
            return (0, 1)
        case .bottom:
            return (1, 0)
        case .left:
            return (0, -1)
        }
    }
}

func -=( lhs: inout (Int, Int), rhs: (Int, Int)){
    lhs = (lhs.0 - rhs.0, lhs.1 - rhs.1)
}

func +=( lhs: inout (Int, Int), rhs: (Int, Int)){
    lhs = (lhs.0 + rhs.0, lhs.1 + rhs.1)
}

func -( lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int){
    return (lhs.0 - rhs.0, lhs.1 - rhs.1)
}

func +( lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int){
    return (lhs.0 + rhs.0, lhs.1 + rhs.1)
}
