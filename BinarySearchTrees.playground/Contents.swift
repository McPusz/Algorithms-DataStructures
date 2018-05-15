import Foundation

class Node<T> {
    let value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T) {
        self.value = value
    }
}
enum BinaryTree<T> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
}


//Calculations
//leaf
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)
//mid left
let AMinus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", AMinus10)
//mid right
let minus4 = BinaryTree.node(.empty, "-", node4)
let threeBybB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", threeBybB)
//root
let tree = BinaryTree.node(timesLeft, "+", timesRight)

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [ \(left.description) ], right = [ \(right.description) ]"
        case .empty:
            return ""
        }
    }
}

print(tree)


//COUNTS
extension BinaryTree {
    var count: Int {
        switch self {
        case .empty:
            return 0
        case .node(let left, _, let right):
            return left.count + 1 + right.count
        }
    }
}

print(tree.count)
