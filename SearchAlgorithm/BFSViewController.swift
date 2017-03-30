//
//  BFSViewController.swift
//  SearchAlgorithm
//
//  Created by hao Mac Mini on 2017/3/30.
//  Copyright © 2017年 Vito.Yang. All rights reserved.
//

import UIKit

class BFSViewController: UIViewController {
    
    @IBOutlet weak var mazeCollectionView: UICollectionView!
    @IBOutlet weak var sizeTextField: UITextField!

    var mazeMatrix = [[Int]]() {
        didSet {
            mazeCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupMazeMatrix()
    }
    
    private func setupMazeMatrix() {
        let size = sizeTextField.intNumber
        mazeMatrix = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
    }
    
    @IBAction func resetAction(sender: UIButton) {
        setupMazeMatrix()
        sizeTextField.resignFirstResponder()
    }
    
    // TODO: - 待补充
    func getIndex(from indexPath: IndexPath) -> (Int, Int) {
        // x = 当前数字 / 列
        let x = indexPath.row / mazeMatrix.count
        // y = 当前数字 % 列
        let y = indexPath.row % mazeMatrix.count
        return (x, y)
    }

}

extension BFSViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MazeCell.identifier, for: indexPath) as! MazeCell
        let (x, y) = getIndex(from: indexPath)
        let item = mazeMatrix[x][y]
        cell.setCellState(state: MazeState(rawValue: item)!)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mazeMatrix.fullCount
    }

    
}

extension BFSViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let (x, y) = getIndex(from: indexPath)
        mazeMatrix[x][y] = abs(mazeMatrix[x][y] - 1)
    }
}

extension BFSViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width / CGFloat(mazeMatrix.count), height: collectionView.frame.height / CGFloat(mazeMatrix.count))
    }
}

extension Array where Element == [Int] {
    var fullCount: Int {
        var fullCount = 0
        for item in self {
            fullCount += item.count
        }
        return fullCount
    }
}

extension UITextField {
    var intNumber: Int {
        return Int(text ?? "0") ?? 0
    }
}
