import UIKit
//结构体和类
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
}
//实例化
let someResolution = Resolution()      //Resolution()为构造器
let someVideoMode = VideoMode()
print("The width of someResolution is \(someResolution.width)")
print("The width of someResolution is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width)   //1280
print(someResolution.width )   //0

//结构体类型的成员逐一构造器
let vga = Resolution(width: 640, height: 480)

//值类型
var hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now  \(cinema.width) pixels wide")  //2048
print("hd is still \(hd.width) pixels wide")   //1920

//枚举也是值类型
enum CampassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CampassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()
print("The current direction is \(currentDirection)")      //修改后的
print("The remembered direction is \(rememberedDirection)")    //修改前的

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
//将tenEighty赋值给alsoTenEighty
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")  //30
//恒等运算符
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}   //tenEighty and alsoTenEighty refer to the same VideoMode instance.

