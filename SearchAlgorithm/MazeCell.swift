//
//  MazeCell.swift
//  SearchAlgorithm
//
//  Created by hao on 2017/3/31.
//  Copyright © 2017年 Vito.Yang. All rights reserved.
//

import UIKit

class MazeCell: UICollectionViewCell {
    static let identifier = "MazeCell"
    @IBOutlet weak var mazeLabel: UILabel!
    
    func setCellState(state: MazeState) {
        switch state {
        case .none:
            mazeLabel.textColor = .black
        case .obstacle:
            mazeLabel.textColor = .red
        }
        mazeLabel.text = "\(state.rawValue)"
    }
}

enum MazeState: Int {
    case none = 0
    case obstacle = 1
}
