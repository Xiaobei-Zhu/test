import UIKit
var str = "Hello, playground"
//
var studentName = ["Tom", "Jerry", "Jam", "Davi", "Jerry", "Lisa"]
for index in studentName.indices{
    for i in index...studentName.count - 1{
        if studentName[index] == studentName[i] && index != i{
            print("number \(index) name as same as \(i) , named \(studentName[i])")
        }else{
            continue
        }
    }
}
var names = ["tom", "Jim", "Bob"]
var name = "Jim"
//guard names.contains(name) else {
//    print("Jim is not in names")
//    throw
//}
var nameCharact: Character = "e"
switch nameCharact {
case "a":
    print("this is a")
case "b","e":
    print("This is \(nameCharact)")
default:
    break
}
var distance = (2, 0)
switch distance {
case (let x, 0):
    print("distance in \(x)")
case (0, let y):
    print("distance in \(y)")
case let (x,y):
    print("distance is \(x) \(y)")
}
