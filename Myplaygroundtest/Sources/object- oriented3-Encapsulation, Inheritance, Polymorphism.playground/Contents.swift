import UIKit

//继承 Inheritance
class Transpotation {
    var petrol: Int = 10  //油量
    //行驶
    func drive() {
        //具体由子类实现
        if petrol == 0 {
            self.addPetrol()
        }
    }
    //加油
    func addPetrol() {
        petrol += 10
    }
}

//子类
class Car: Transpotation {
    var tyre: Int
    override func drive() {
        super.drive()
        print("在路上行驶10km")
        self.petrol -= 1
    }
    init(tyrecount: Int){
        tyre = tyrecount
    }
}
class Boat:Transpotation {
    var floor: Int
    override func drive() {
        super.drive()
        print("在海上行驶 50 km")
        self.petrol -= 2
    }
    init(floorCount: Int) {
        floor = floorCount
    }
}
class Airplane: Transpotation {
    var height: Int
    override func drive() {
        super.drive()
        print("在天上行驶 100km")
        self.petrol -= 5
    }
    init(height: Int) {
        self.height = height
    }
}
//汽车
var car = Car(tyrecount: 4)
var boat = Boat(floorCount: 3)
var plane = Airplane(height: 3000)
car.drive()
boat.drive()
plane.drive()

//final修饰的属性方法不能被子类覆写，修饰类不能被继承
class Shape {
    final var center: (Double,Double)
    init(){
        center = (0, 0)
    }
}
final class Shape1 {
    final var center: (Double,Double)
    init(){
        center = (0, 0)
    }
}

//封装  Encapsulation
public class Student {
    public var name: String
    internal var age: Int   //????
    private var score: Int    //????
    init(name: String, age: Int, score: Int){
        self.name = name
        self.age = age
        self.score = score
    }
    public func sayHi() {
        print("hello everyone!")
    }
    func getScore() {
        print("My score is \(score)")
    }
    func newScore() {
        score -= 1
    }
}
let student = Student(name: "Tom", age: 18, score: 99)
student.sayHi()
//student.getScore()   //不能访问getScore 因为它是private类型的方法
student.getScore()
student.newScore()
//多态 Polymorphism
class Animal {
    func speak() {
        print("Animal speak")
    }
    func eat() {
        print("Animal eat")
    }
    func sleep() {
        print("Animal sleep")
    }
}
class Dog: Animal {
    override func speak() {
        print("Dog speak")
    }
    override func eat() {
        print("Dog eat")
    }
    func run(){
        print("Dog run")
    }
}
class Cat: Animal {
    override func speak() {
        print("猫在喵喵叫")
    }
}
var animal = Animal()       //Animal
animal = Dog()  //指向Dog对象  Dog
animal.speak()  //Dog speak
animal.eat()    //Dog eat
animal.sleep()  //Animal sleep
//var animal2: Animal = Cat()
//animal2.speak()
//animal指向Cat对象
animal = Cat()
animal.speak()  //猫在喵喵叫
animal.eat()   //Animal eat


