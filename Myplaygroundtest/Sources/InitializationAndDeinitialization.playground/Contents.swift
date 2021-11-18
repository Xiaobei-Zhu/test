import UIKit
//构造方法和析构方法、可选链
var str = "Hello, playground"

//构造器
struct Fahreheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahreheit()
print("The default temperature is \(f.temperature)° Fahrenheit")  //32

//形参的构造过程
struct Celsius {
    var temeratertureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temeratertureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temeratertureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temeratertureInCelsius = celsius
    }
}
let bodyTemperature = Celsius(37.0)    //37.0
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temeratertureInCelsius)  //100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temeratertureInCelsius) // 0.0

//形参命名和实参标签
struct Color {
    let red,green, blue: Double
    init(red: Double, green: Double, blue: Double) {   //red,green,blue为形参命名
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {     //white 为形参命名
        self.red = white
        self.green = white
        self.blue = white
    }
}
let magenta = Color(red:1.0, green: 0.0, blue: 1.0)
//let veryGreen = Color(0.0, 1.0, 0.0)  //需要实参标签
let veryGreen = Color(white: 1.0)

//可选属性类型
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
//构造过程中常量属性的赋值
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()  //How about beets?
let beetsQuestion1 = SurveyQuestion(text: "Do you like swift?")
beetsQuestion1.ask()   //Do you like swift?

let cheeseQuestion = SurveyQuestion(text: "Do you like swift?")
cheeseQuestion.ask()  //Do you like swift?
cheeseQuestion.response = "Yes,I like it."

//默认构造器
class ShoppingListItem {
    var name: String?     //接收一个默认 nil 的默认值
    var quantity = 1
    var  purchased = false
}
var item = ShoppingListItem()

//结构体逐一构造器
struct SizeOne {
    var width = 0.0, height = 0.0
}
let twoBytwo = SizeOne(width: 2.0, height: 2.0)
print(twoBytwo.width, twoBytwo.height)

//值类型构造器代理
struct SizeTwo {
    var width = 0.0, height = 0.0
}
struct PointOne {
    var x = 0.0, y = 0.0
}
//方法1:使用含有默认值的 origin 和 size 属性来初始化
//方法2:将origin，size的实参赋值给对应的存储型属性
//方法3:通过center，size计算出originX，originY，然后调用init(origin:size:)构造器将新的origin,size值赋值到对应的属性中。
struct Rect {
    var origin = PointOne()
    var size = SizeTwo()
    init() {}  //origin,size使用默认值
    init(origin: PointOne, size: SizeTwo) {
        self.origin = origin
        self.size = size
    } //将origin，size的实参赋值给对应的存储型属性
    init(center: PointOne, size: SizeTwo) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: PointOne(x: originX, y: originY), size: size)
    }    // 通过center，size计算出originX，originY，然后调用init(origin:size:)构造器将新的origin,size值赋值到对应的属性中。
}
//方法1
let basicRect = Rect()
print(basicRect.origin, basicRect.size) //PointOne(x: 0.0, y: 0.0) SizeTwo(width: 0.0, height: 0.0)
//方法2:
let originRect = Rect(origin: PointOne(x: 2.0, y: 2.0),
    size: SizeTwo(width: 5.0, height: 5.0)) //originRect 的 origin 是 (2.0, 2.0)，size 是 (5.0, 5.0)
//方法3
let centerRect = Rect(center: PointOne(x: 4.0, y: 4.0), size: SizeTwo(width: 3.0, height: 3.0))
print(centerRect.origin, centerRect.size) //PointOne(x: 2.5, y: 2.5) SizeTwo(width: 3.0, height: 3.0)
//构造器的继承与重写
class Vehicle{
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")  //Bicycle: 2 wheel(s)

class Hoverboard: Vehicle {
    var color: String
    init(color: String){
        self.color = color
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")  //Hoverboard: 0 wheel(s) in a beautiful silver

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let mysteryMeat = Food()   //[Unnamed]
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteyItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
oneBacon.quantity  //1
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
//继承RecipeIngredient的所有构造器（指定，便利）
class ShoppingListItemTwo: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "√" : "x"
        return output
    }
}
var breakfastList = [ShoppingListItemTwo(),
                     ShoppingListItemTwo(name: "Bacon"),
                     ShoppingListItemTwo(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)  //1 x Orange juice√, 1 x Baconx, 6 x Eggsx
}
//可失败构造器
let wholeNumber: Double = 12345.0
let pi = 3.1415926
if let valueMaintained = Int(exactly: wholeNumber){
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")//12345.0 conversion to Int maintains value of 12345
}
let valueChanged = Int(exactly: pi)   //valueChanged是Int?类型，不是Int类型
if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value") //3.1415926 conversion to Int does not maintain value
}
struct Animal {
    let species: String
    init? (species: String){
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")  //someCreature的类型是Animal?,而不是Animal
let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
//带原始值的枚举类型的可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
enum TemperatureUnitTwo: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}
let fahreheitUnit = TemperatureUnitTwo(rawValue: "F")
if fahreheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
let unknownUnit = TemperatureUnitTwo(rawValue: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
//构造失败的传递
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty{ return nil}
        self.name = name
    }
}

class CarItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int){
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

class Document {
    var name: String?
    init(){}
    init?(name: String){
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        }else {
            self.name = name
        }
    }
}
class  UnititledDocument: Document {
    override init() {
        super.init(name: "Untitled")!
    }
}
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested:Int) ->Int {    //硬币分发
        let numberOfCoinsTovend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsTovend
        return numberOfCoinsTovend
    }
    static func receive(coins: Int) {      //硬币收集
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
        //只是将玩家的所有硬币都返还给 Bank 对象
    }
}

var playerOne: Player? = Player(coins: 100)  //Player是否在游戏中
playerOne!.win(coins: 2_000)
print(playerOne!.coinsInPurse)  // 2100
print(Bank.coinsInBank)  //7900
playerOne = nil
print(Bank.coinsInBank)  //10000

//使用可选链式调用代替强制展开
class Person {
    var residence: Residence?   //如果使用！，residence没有值会出现运行错误
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms : Int{
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Address {
    var buildingName:String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if let buildingNumber = buildingNumber, let street = street{
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}
let john = Person()
let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress
//????
if let johnStreet = john.residence?.address?.street {
    print("John's street name is \(johnStreet)")
} else {
    print("Unable to retrieve the address.")
}

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Bev"]?[0] += 1  //[80,94,81]
print(testScores)
