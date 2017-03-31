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

    // 迷宫矩阵, 0 代表无障碍, 1 代表有障碍
    var mazeMatrix = [[Int]]() {
        didSet {
            mazeCollectionView.reloadData()
            mazeMatrix.printArray()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMazeMatrix()
    }
    
    private func setupMazeMatrix() {
        let size = sizeTextField.intNumber
        mazeMatrix = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
    }
    
    private func searchPath(source: (x: Int, y: Int), destination: (x: Int, y: Int))
    {
        var queue = [source]
        var visited = [source]
        // 找了多少次找到
        var count = 0
        while let vertex = queue.first {
            queue.removeFirst()
            count += 1
            // 如果搜索的点和终点相等则说明找到了
            if vertex == destination {
                print("找了 \(count) 次, 找到了！")
                return
            }
            // 遍历所有周边可走的顶点
            for neighborVertex in findNeighborVertex(source: vertex){
                // 先判断是否访问过
                if !visited.contains{ $0.x == neighborVertex.0 && $0.1 == neighborVertex.1} {
                    // 如果没有访问过, 则将其入队
                    queue.append(neighborVertex)
                    // 将其标志为已访问
                    visited.append(neighborVertex)
                }
            }
        }
        print("找了 \(count) 次没有找到")
    }
    
    /// 查找指定点的可走的邻点
    private func findNeighborVertex(source: (x: Int, y: Int)) -> [(Int, Int)] {
        let top = source + MatrixDirection.top.tupleValue
        let right = source + MatrixDirection.right.tupleValue
        let bottom = source + MatrixDirection.bottom.tupleValue
        let left = source + MatrixDirection.left.tupleValue
        
        return [top,right,bottom,left].filter { validVertex(vertex: $0) }
    }
    
    private func validVertex(vertex: (x: Int, y: Int)) -> Bool{
        let validRange = 0..<mazeMatrix.count
        return validRange.contains(vertex.x) && validRange.contains(vertex.y) && mazeMatrix[vertex] != 1
    }
    
    @IBAction func startSearchPath(sender: UIButton) {
        guard mazeMatrix.count > 0 else {
            AlertUtil.alert(message: "Maze Size must be > 0")
            return
        }
        let sourceIndex = 0
        let destinationIndex = mazeMatrix.count - 1
        let source = (sourceIndex, sourceIndex)
        let destination = (destinationIndex, destinationIndex)
        // 起点和终点不能有障碍物
        if mazeMatrix[source] == 1 || mazeMatrix[destination] == 1{
            AlertUtil.alert(message: "Source Or Destination Can't be 1")
        }
        searchPath(source: source, destination: destination)
    }
    
    @IBAction func resetAction(sender: UIButton) {
        setupMazeMatrix()
        sizeTextField.resignFirstResponder()
    }
    
    /// 根据 indexPath 计算出在二位数组中的真实坐标
    func getIndex(from indexPath: IndexPath) -> (Int, Int) {
        // x = 当前数字 / 列
        let x = indexPath.row / mazeMatrix.count
        // y = 当前数字 % 列
        let y = indexPath.row % mazeMatrix.count
        return (x, y)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        mazeCollectionView.collectionViewLayout.invalidateLayout()
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
