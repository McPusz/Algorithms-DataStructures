import sys

class node:
  def __init__(self, data):
      self.data = data
      self.left = None
      self.right = None

maxValue = sys.maxsize
minValue = -sys.maxsize

def isBST(root, min, max):
    if root == None:
        return True
    data = root.data
    if data < min or data > max:
        return False
    isLeftBST = isBST(root.left, min, data)
    isRightBST = isBST(root.right, data, max)
    return isLeftBST and isRightBST

def check_binary_search_tree_(root):
    return isBST(root, minValue, maxValue)

customNode = node(3)
customNode.left = node(5)
customNode.right = node(2)
customNode.left.left = node(1)

value = check_binary_search_tree_(customNode)
print(value)
