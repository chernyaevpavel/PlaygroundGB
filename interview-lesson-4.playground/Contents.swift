
final class Node {
    
    let value: Int
    var next: Node?
    init(value: Int) {
        self.value = value
    }
}

func isLooping(_ list: [Node]) -> Bool {
    if list.first(where: { node in
        node.next?.next === node
    }) != nil {
        return true
    }
    return false
}

let nodeA = Node(value: 1)
let nodeB = Node(value: 2)
let nodeC = Node(value: 3)
let nodeD = Node(value: 4)

nodeA.next = nodeB
nodeB.next = nodeC
nodeC.next = nodeD
nodeD.next = nodeC
//nodeD.next = nodeA

let list = [nodeA, nodeB, nodeC, nodeD]

print(isLooping(list))




