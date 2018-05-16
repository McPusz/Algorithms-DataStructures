import Foundation

class Node<T> {
    let value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T) {
        self.value = value
    }
}
enum BinaryTree<T: Comparable> {
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
    
    //this creates only copy of tree, but old value of tree is unchanged
    mutating func naiveInsert(newValue: T) {
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        if newValue  < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
        case .empty:
            return .node (.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
}

print(tree.count)

var binaryTree: BinaryTree<Int> = .empty
binaryTree.naiveInsert(newValue: 5)
binaryTree.naiveInsert(newValue: 7)
binaryTree.naiveInsert(newValue: 9)

binaryTree.insert(newValue: 5)
binaryTree.insert(newValue: 7)
binaryTree.insert(newValue: 1)


//TRAVERSAL ALGOS
extension BinaryTree {
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    func traversePreOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traverseInOrder(process: process)
            right.traverseInOrder(process: process)
        }
    }
    
    func traversePostOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            right.traverseInOrder(process: process)
            process(value)
        }
    }
}

var btree: BinaryTree<Int> = .empty
btree.insert(newValue: 7)
btree.insert(newValue: 10)
btree.insert(newValue: 3)
btree.insert(newValue: 9)
btree.insert(newValue: 5)
btree.insert(newValue: 2)
btree.insert(newValue: 1)

btree.traverseInOrder { print($0) }
btree.traversePreOrder { print($0) }
btree.traversePostOrder { print($0) }


//search

extension BinaryTree {
    func search(searchValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            }
            
            if searchValue < value {
                return left.search(searchValue: searchValue)
            } else {
                return right.search(searchValue: searchValue)
            }
        }
    }
}

btree.search(searchValue: 3)
