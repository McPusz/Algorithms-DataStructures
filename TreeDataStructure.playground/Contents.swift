import Foundation

class Node {
    var value: String
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Node) {
        self.children.append(child)
        child.parent = self
    }
}

let beverages = Node(value: "beverages")
let hotBeverages = Node(value: "hot")
let coldBeverages = Node(value: "cold")

let tea = Node(value: "tea")
let coffee = Node(value: "coffee")
let blackTea = Node(value: "black tea")
let greenTea = Node(value: "green tea")
let chaiTea = Node(value: "chai tea")

let cocoa = Node(value: "cocoa")
let soda = Node(value: "soda")
let milk = Node(value: "milk")
let gingerAle = Node(value: "ginger ale")
let bitterLemon = Node(value: "bitter lemon")

beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)

hotBeverages.add(child: coffee)
hotBeverages.add(child: cocoa)
hotBeverages.add(child: tea)

coldBeverages.add(child: soda)
coldBeverages.add(child: milk)

tea.add(child: blackTea)
tea.add(child: greenTea)
tea.add(child: chaiTea)

soda.add(child: gingerAle)
soda.add(child: bitterLemon)


print(beverages)


extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            text += " {" + children.map{$0.description}.joined(separator: ", ") + "} "
        }
        return text
    }
}
