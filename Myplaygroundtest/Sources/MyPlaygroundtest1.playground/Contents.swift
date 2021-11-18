import UIKit

//day1
var str = "Hello, playground"
//declare two string constants
let firstString = " I'm learning "
let secondString = " swift "
//print((firstString) + (secondString))

let age = 24
//print("My age is",age)
var youAge = age + 10

//calculate triangle
let a = 8.0
let b = 6.0
var c = sqrt(100)
var area = (Float(a) + Float(b))/2
var perimeter = Float(a) + Float(b) + Float(c)

//？需要判断是否有实例化
var name:String?
name = "Amy"
if let name2 = name {
    print("My name is \(name2)")     //在下边调用
}else{
    print("My name is nil")
}
//print("My name is \(name!)")
//name1"BOb"将“Davi”覆盖
var name1 = "Davi"
name1 = "Bob"
//print("My name is \(name1)")

//！不需要判断是否实例化，一定是有值的
var name3:String!
name3 = "jim"
//print("My name is \(name3!)")    // ‘！’

var lab:String?
//print("my name is \(lab)")  //会有提示但不会报错。不建议

var num = Int8(0)
num = 0b00111101

//day2
//创建字符串
var stringA = "Hello,World!"
//字符串字面量
let someString = "Some string literal value"
//多行字符串字面量
let softWare = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.
   "Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
//print(softWare)
//字符串字面量特殊字符
let WiseWords = "\"Imagination is more important than knowldge\"-Enistein"
//print(WiseWords)
let dollarsign = "\u{24}"
let speaklingHeart = "\u{2665}"
let blackHeart = "\u{1F496}"
//多行字符串字面量使用“”“，至少要有一个\
let threedoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
//print(threedoubleQuotes)
//扩展分隔符  会打印转义字符
let extendsStr = #"line1 \nline2"#
//print(extendsStr)
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes:"""
"""#
//print(threeMoreDoubleQuotationMarks)
//字符串为空。//两个字符串都为空并且等价
var emptyString = ""  //空字符串字面量
var anotherEmptyString = String()  //初始化方法
//isEmpty属性判断是否为空
if emptyString.isEmpty{
    print("Nothing to see here")
}
//字符串可变性
var variableString = "Horse"
variableString += "and carriage"
//print(variableString)

let constantString = "Highlander"
//constantString += "and another Highlander"   编译错误，常量字符串不可以修改
//使用字符串，通过for- in循环来遍历字符串，获取字符串中每一个字符的值
//for character in "Dog!"{
//    print(character)
//}
//标明一个Charactoer类型并用字符字面量赋值
let exclamationMarks: Character = "!"

//
let catCharacters : [Character] = ["C","a","t"]
let catString = String(catCharacters)
print(catString)
//可扩展字符群集
let eAcut: Character = "\u{E9}"
let combinedEAcut:Character = "\u{65}\u{301}"
print(eAcut)
//计算字符数量
let unusualMenagerie = "Koala, Snail, Penguin, Dromedary "
print("unusualMenagerie has \(unusualMenagerie.count) characters")
//
var word = "cafe"
print("the number of characters in \(word) is \(word.count)",word)
word += "\u{301}"  //拼接一个音调
print("the number of characters in \(word) is \(word.count)",word)
//字符串索引
let greeting = "Guten tag"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]  //g
greeting[greeting.index(after: greeting.startIndex)]  //u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]


//indices  创建一个包含全部索引的范围
for index in greeting.indices{
    print("\(greeting[index])",terminator:"")
}  //Guten tag
//字符串插入
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)  //hello!
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex)) //hello there
//字符串删除
welcome.remove(at: welcome.index(before: welcome.endIndex))  //hello there
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

let greetingnext = "Hello,world!"
let greetingnextIndex = greetingnext.firstIndex(of: ",") ?? greetingnext.endIndex
let beginning = greetingnext[..<index]
let newString = String(beginning)  //将结果转化为string以便长期存储

//创建数组
var someInts = [Int]()  //1.空数组
var threeDoubles = Array(repeating: 0.0, count: 3) //2.一个 [Double] 数组，等价于 [0.0, 0.0, 0.0]
var anotherthreeDoubles = Array(repeating: 1.0, count: 3)
var sixDoubles = threeDoubles + anotherthreeDoubles    //3.两个数组合并创建出新的数组
var nameList:[String] = ["Tom","Jerry","Bob"]     //数字字面量创建数组
var nameList2 = ["Tom","Jerry","Bob"]   //同上
//数组访问与修改
var shoppingList = ["Eggs", "Milk"]
print("The shopping list contains \(shoppingList.count) items")   //2
if shoppingList.isEmpty{
    print("The shopping list is empty.")
}else{
    print("The shopping list is not empty.")
}
shoppingList.append("Flour")
shoppingList += ["Baking Powder","Chocolate Spread", "Cheese", "Butter"]
var firstItem = shoppingList[0]  //Eggs
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)
shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)
let apple = shoppingList.removeLast()
//遍历
for item in shoppingList{
    print(item)
}
for (index,value) in shoppingList.enumerated(){
    print("Item \(String(index + 1)) : \(value)")
}
//创造和构建集合
var letters = Set<Character>()  //空集合
var favoriteGeners:Set<String> = ["Rock","Classical", "Hip hop"]  //集合字面量
var favoritrGeners1: Set = ["Rock","Classical", "Hip hop"]
//集合的访问和修改
print("I hava \(favoriteGeners.count) favorite music genres.")
favoriteGeners.insert("Jazz")
if let removeGenre = favoriteGeners.remove("Rock"){
    print("\(removeGenre)? I'm over it.")
}else{
    print("I never much cared for that.")
}
//contains(_:) 检查集合中是否包含一个特定的值
if favoriteGeners.contains("Funk"){
    print("I get up on the good foot.")
}else{
    print("It's too funky in here.")
}
//遍历一个集合
for genre in favoriteGeners{
    print("\(genre)")
}
//集合操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigtPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted()  //所有值
oddDigits.intersection(evenDigits).sorted()  //交集
oddDigits.subtracting(singleDigtPrimeNumbers).sorted()  //不在另一个集合中的
oddDigits.symmetricDifference(singleDigtPrimeNumbers).sorted()  //不相交的部分
//集合关系
let houseAnimals: Set = ["dog","cat"]
let farmAnimals: Set = ["ship","chichen","dog","cat"]
let cityAnimals: Set = ["bird","mouse"]
var AnimalsSets1 = houseAnimals.isSubset(of: farmAnimals)  //判断houseAnimals的所有值是否也被包含在farmAnimals中。
var AnimalsSet2 = farmAnimals.isSuperset(of: houseAnimals) //判断farmAnimals是否包含了houseAnimals所有值
var Animalset3 = farmAnimals.isDisjoint(with: cityAnimals)  //判断farmAnimals与cityAnimals是否有交集
//创建字典
var namesOfIntergers = [Int : String]()    //空字典
namesOfIntergers = [:]
var airports1: [String : String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//访问和修改字典
//print("The dictionary of airports contains \(airports.count) items")  //2
//airports["LHR"] = "London"   //3
airports["LHR"] = "London Heathrow"  //直接替换
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("The old value for DUB was \(oldValue).")   //The old value for DUB was Dublin
}  //需要判断是否存在，如果存在保存原来的值，如果不存在，值为nil
if let airportName = airports["DUB"]{
    print("The name of the airport is \(airportName).")
}else{
    print("That airport is not in the airports dictionary.")
}
airports["APL"] = "Apple Internation"  //在字典中增加一个键值对
airports["APL"] = nil  //将键值对移除
if let removedValue = airports.removeValue(forKey: "DUB"){
    print("The removed airport's name is \(removedValue)")
}else{
    print("The airports dictional does not contain a value for DUB.")
}
//字典遍历
for (airportCode, airportName) in airports{
    print("\(airportCode) : \(airportName)")
}
//访问键
for airportCode in airports.keys{
    print("Airport code: \(airportCode)")
}
for airportName in airports.values{
    print("Airport name: \(airportName)")
}
