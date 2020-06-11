import UIKit

// Operator Overloading
extension BinaryInteger {
    static func * (lhs: Self, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs) * rhs
    }
    
    static func * (lhs: CGFloat, rhs: Self) -> CGFloat {
        return lhs * CGFloat(rhs)
    }
    
    static func * (lhs: Self, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
    
    static func * (lhs: Double, rhs: Self) -> Double {
        return lhs * Double(rhs)
    }
}

let exampleInt: Int64 = 50_000_000_000_000_001
print(exampleInt)

let result = exampleInt * 1.0
print(String(format: "%.0f", result))

// Property Wrappers

struct NonNegativeWithoutWrapper<Value: BinaryInteger> {
    var value: Value
    
    init(wrappedValue: Value) {
        if wrappedValue < 0 {
            self.value = 0
        } else {
            self.value = wrappedValue
        }
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            if newValue < 0 {
                value = 0
            } else {
                value = newValue
            }
        }
    }
}

var example = NonNegativeWithoutWrapper(wrappedValue: 5)
example.wrappedValue -= 10
print(example.wrappedValue)

@propertyWrapper
struct NonNegative<Value: BinaryInteger> {
    var value: Value
    
    init(wrappedValue: Value) {
        if wrappedValue < 0 {
            self.value = 0
        } else {
            self.value = wrappedValue
        }
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            if newValue < 0 {
                value = 0
            } else {
                value = newValue
            }
        }
    }
}

// Can be used only on PROPERTIES (inside structs / classes) not on plain variables
struct User {
    @NonNegative var score = 0
}

var user = User()
user.score += 10
print(user.score)

user.score -= 20
print(user.score)

class Animal {
    @NonNegative var age = 0
}

var doggo = Animal()
doggo.age = -10
print(doggo.age)
