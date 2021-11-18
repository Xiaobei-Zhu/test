import UIKit
//协议、泛型
var str = "Hello, playground"

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()    //
print(lightSwitch)

//泛型

//泛型函数
func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}
//泛型类型
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop(_ item: Element) -> Element{
        return items.removeLast()
    }
}
//泛型扩展
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
//类型约束
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) ->Int?{
    for (index, value) in array.enumerated() {
        if value == valueToFind{
            return index
        }
    }
    return nil
}
