//: Playground - noun: a place where people can play

//: 广度搜索 (Breadth first search)

let dungeon = AdjacencyList<String>()

let entranceRoom = dungeon.createVertex(data: "Entrance")
let spiderRoom = dungeon.createVertex(data: "Spider")
let goblinRoom = dungeon.createVertex(data: "Goblin")
let ratRoom = dungeon.createVertex(data: "Rat")
let knightRoom = dungeon.createVertex(data: "Knight")
let batRoom = dungeon.createVertex(data: "Bat")
let orcRoom = dungeon.createVertex(data: "Orc")
let keyRoom = dungeon.createVertex(data: "Key")
let treasureRoom = dungeon.createVertex(data: "Treasure")

dungeon.add(.undirected, from: entranceRoom, to: spiderRoom, weight: 1)
dungeon.add(.undirected, from: entranceRoom, to: ratRoom, weight: 1)
dungeon.add(.undirected, from: entranceRoom, to: batRoom, weight: 1)
dungeon.add(.undirected, from: spiderRoom, to: goblinRoom, weight: 1)
dungeon.add(.undirected, from: spiderRoom, to: orcRoom, weight: 1)
dungeon.add(.undirected, from: ratRoom, to: treasureRoom, weight: 1)
dungeon.add(.undirected, from: ratRoom, to: keyRoom, weight: 1)
dungeon.add(.undirected, from: batRoom, to: knightRoom, weight: 1)

dungeon.description
if let edges = dungeon.breadthFirstSearch(from: entranceRoom, to: treasureRoom) {
    for edge in edges {
        print("\(edge.source) --> \(edge.destination)")
    }
}
