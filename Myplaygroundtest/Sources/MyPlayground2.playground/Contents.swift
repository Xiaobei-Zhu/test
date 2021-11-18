 import UIKit

var str = "Hello, playground"

var helloString = "hello world"
var num:Character = "N"
//判是否包含  字符串查找
let newString = helloString.contains(num)
print(newString)


print("the length of helloString \(helloString.count)")
for char in helloString{
    print(char)
}
//字符串删除
helloString.remove(at: helloString.index(helloString.startIndex, offsetBy: 4))
print(helloString)
helloString.remove(at: helloString.index(helloString.startIndex,offsetBy: 9))
print(helloString)

var name = ["tom", "jerry", "Bob", "Bob"]
var sex: Set = ["man", "women"]
var student = [0 : "tom", 1 : "bob", 2 : "kim"]
//var name2 = Set(name)
//name = Array(name2)

 name.remove(at: 3)

