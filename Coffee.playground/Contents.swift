import UIKit

protocol Coffee {
    var cost: Int { get }
    var description: String { get }
}

class SimpleCoffe: Coffee {
    let cost: Int
    let description: String = "Кофе"
    
    init(cost: Int) {
        self.cost = cost
    }
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee)
}

class MilkDecorator: CoffeeDecorator {
    var description: String {
        return "\(self.base.description) + молоко"
    }
    var cost: Int {
        return self.base.cost + 3
    }
    
    let base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
}

class WhipDecorator: CoffeeDecorator {
    var description: String {
        return "\(self.base.description) + взбитый"
    }
    
    var cost: Int {
        return self.base.cost + 5
    }
    let base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
}

class SugarDecorator: CoffeeDecorator {
    var base: Coffee
    
    required init(base: Coffee) {
        self.base = base
    }
    
    var cost: Int {
        return self.base.cost + 15
    }
    
    var description: String {
        return "\(self.base.description) с сахаром"
    }
    
    
}


let coffe = SimpleCoffe(cost: 10)
print(coffe.description)

let coffeAndMilk = MilkDecorator(base: coffe)
print(coffeAndMilk.cost)
print(coffeAndMilk.description)

let coffeMilkWhip = WhipDecorator(base: coffeAndMilk)
print(coffeMilkWhip.cost)
print(coffeMilkWhip.description)

let coffeeSugar = SugarDecorator(base: coffe)
print(coffeeSugar.cost)
print(coffeeSugar.description)

