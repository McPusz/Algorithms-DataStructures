class Node:
    def __init__(self, info):
        self.info = info
        self.left = None
        self.right = None
        self.level = None

    def __str__(self):
        return str(self.info)

class BinarySearchTree:
    def __init__(self):
        self.root = None

    def create(self, val):
        if self.root == None:
            self.root = Node(val)
        else:
            current = self.root

            while True:
                if val < current.info:
                    if current.left:
                        current = current.left
                    else:
                        current.left = Node(val)
                        break
                elif val > current.info:
                    if current.right:
                        current = current.right
                    else:
                        current.right = Node(val)
                        break
                else:
                    break

def preOrder(root):
# pre-order: node, left, right
    print(root.info, end = " ")
    if root.left != None:
        preOrder(root.left)
    if root.right != None:
        preOrder(root.right)

def postOrder(root):
# post-order: left, right, node
    if root.left != None:
        postOrder(root.left)
    if root.right != None:
        postOrder(root.right)
    print(root.info, end = " ")

def inOrder(root):
# in-order: left, node, right
    if root.left != None:
        inOrder(root.left)
    print(root.info, end = " ")
    if root.right != None:
        inOrder(root.right)

tree = BinarySearchTree()


t = [1, 2, 5, 6, 3, 4]

for i in range(6):
    tree.create(t[i])

# preOrder(tree.root)
inOrder(tree.root)
