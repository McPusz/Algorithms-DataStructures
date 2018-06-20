class Node {
    var left: Node? = nil
    var right: Node? = nil
    
    let data: Int
    
    init(data: Int) {
        self.data = data
    }
}

func isBST(root: Node?, minValue: Int, maxValue: Int) -> Bool {
    if root == nil {
        return true
    }
    
    let data = root!.data
    if data < minValue || data > maxValue { return false }
    
    let leftBST = isBST(root: root?.left, minValue: minValue, maxValue: data)
    let rightBST = isBST(root: root?.right, minValue: data, maxValue: maxValue)
    return leftBST && rightBST
}

var customNode = Node(data: 4)
customNode.left = Node(data: 2)
customNode.right = Node(data: 6)
customNode.left?.left = Node(data: 10)

let value = isBST(root: customNode, minValue: Int.min, maxValue: Int.max)
print(value)
