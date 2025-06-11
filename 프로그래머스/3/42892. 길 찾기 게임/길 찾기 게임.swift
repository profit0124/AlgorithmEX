import Foundation

class Node {
    let coordinate: [Int]
    let index: Int
    var leftChild: Node?
    var rightChild: Node?
    
    private var x: Int { coordinate[0] }
    private var y: Int { coordinate[1] }
    
    init(
        my: [Int],
        index: Int,
        leftChild: Node? = nil,
        rightChild: Node? = nil
    ) {
        self.coordinate = my
        self.index = index
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    func addChild(_ node: Node) {
        guard self.y > node.y else { return }
        
        if self.x > node.x {
            if let leftChild = self.leftChild {
                leftChild.addChild(node)
            } else {
                self.leftChild = node
            }
        } else {
            if let rightChild = self.rightChild {
                rightChild.addChild(node)
            } else {
                self.rightChild = node
            }
        }
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    let nodeInfo: [Node] = nodeinfo.enumerated()
    .map { Node(my: $0.1, index: $0.0 + 1) }
    .sorted(by: { $0.coordinate[1] > $1.coordinate[1]})
    
    let root = nodeInfo[0]
    
    nodeInfo.forEach({ node in
        if root.coordinate != node.coordinate {
            root.addChild(node)
        }
    })

    func dfs(_ node: Node?, _ key: String) -> [Int] {
        guard let node = node else { return []}
        
        if key == "preorder" {
            return [node.index] + dfs(node.leftChild, key) + dfs(node.rightChild, key)
        } else {
            return dfs(node.leftChild, key) + dfs(node.rightChild, key) + [node.index]
        }
    }
    
    let preorder = dfs(root, "preorder")
    let postorder = dfs(root, "postorder")

    return [preorder, postorder]
}