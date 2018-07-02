class Node:
    def __init__(self, data):
        self.left = None
        self.right = None
        self.data = data

class BinarySearchTree:
    def __init__(self):
        self.root = None

    def create(self, val):
        if self.root == None:
            self.root = Node(val)
        else:
            current = self.root

            while True:
                if val < current.data:
                    if current.left:
                        current = current.left
                    else:
                        current.left = Node(val)
                        break
                elif val > current.data:
                    if current.right:
                        current = current.right
                    else:
                        current.right = Node(val)
                        break
                else: break

tree = BinarySearchTree()

numbers = [7, 2, 4, 5, 6, 19, 8]

for i in numbers:
    tree.create(i)

stack = []

def levelOrder(root):
    stack.append(root)
    queue(root)

def queue(root):
    
    if len(stack) > 0:
        current = stack.pop(0)
        print(current.data, end=" ")
        if current.left != None:
            stack.append(current.left)
        if current.right != None:
            stack.append(current.right)
    if len(stack) > 0:
        queue(stack[0])

levelOrder(tree.root)
