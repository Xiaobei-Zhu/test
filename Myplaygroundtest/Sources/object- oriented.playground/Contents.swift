import UIKit

//属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
//该区间表示整数0，1，2
rangeOfThreeItems.firstValue = 6  //该区间现在表示6，7，8
//常量结构体实例的存储属性
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)   //该区间表示0，1，2，3
//rangeOfFourItems.firstValue = 6    //会报错
class DataImporter {
    //DataImporter 是一个负责将外部文件中的数据导入的类，初始化会消耗不少时间
    var fileName = "data.txt"
    //提供数据导入功能
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    //数据管理功能
}
let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")
//DataImporter 实例还没有被创建
//计算属性
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect{
    var origin = Point()
    var size = Size()
    //center的计算属性
    var center: Point {
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y:centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),size: Size(width: 10.0, height: 10.0))
let initialSquaeCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
print("square.center is now at (\(square.center.x), \(square.center.y))")
//只读计算属性
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double{
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")  //40.0
//属性观察器，willSet,didSet
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            print("增加了 \(totalSteps - oldValue) 步")
        }
    }
}
let stepcounter = StepCounter()
stepcounter.totalSteps = 200   //增加了200步
stepcounter.totalSteps = 360    //增加了160步
stepcounter.totalSteps = 896    //增加了536步

//属性包装器
@propertyWrapper
struct TwelveOrLess {
    private var number = 0    //仅在TwelveOrLess中使用
    var wrappedValue: Int {
        get{ return number}
        set { number = min(newValue, 12)}
    }
}
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}
var rectangle = SmallRectangle()
print(rectangle.height)  //0
rectangle.height = 10
print(rectangle.height) //10
rectangle.height = 15
print(rectangle.height)  //12
//同上
struct SmallRectangle1 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue}
        set { _height.wrappedValue = newValue}
    }
    var width: Int {
        get {return _width.wrappedValue}
        set {_width.wrappedValue = newValue}
    }
}

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set {
            number = min(newValue,maximum)
            print("set wrappedValue")
        }
    }
    //构造器
    init() {
        maximum = 12
        number = 0
        print("init()")
    }
    init(wrappedValue: Int){
        maximum = 12
        number = min(wrappedValue, maximum)
        print("inin(wrapped)")
    }
    init(wrappedValue: Int, maximum: Int){
        self.maximum = maximum
        number = min(wrappedValue, maximum)
        print("init(wrappedvlue,maximum)")
    }
}
//为设定初始值时
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}
//使用init()
var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)  //0 0

//使用init(wrappedValue:)
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}
var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)  //1,1

//使用init(wrappedValue: maximum:)
struct NarrowRectangle{
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}
var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)  //2 3
narrowRectangle.height = 10
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)


//类型属性
struct SomeStructure {
    static var storedTypeProperty = "some value."
    static var computedTypeProperty: Int{
        return 1
    }
}
enum SomeEnumeration {
    static var storedTyprProperty = "some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
print(SomeStructure.storedTypeProperty)    //some value.
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)   //Another value.
print(SomeEnumeration.computedTypeProperty)  //6
print(SomeClass.computedTypeProperty)   //27

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChanels = 0
    var currentLevel: Int = 0 {
        didSet{
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel //将当前音量限制在阈值之内
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChanels {
                AudioChannel.maxInputLevelForAllChanels = currentLevel
            }
        }
    }
}
var leftChannel = AudioChannel()
var rightchannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)    //7
print(AudioChannel.maxInputLevelForAllChanels)  //7
rightchannel.currentLevel = 11
print(rightchannel.currentLevel)  //10
print(AudioChannel.maxInputLevelForAllChanels) //10
