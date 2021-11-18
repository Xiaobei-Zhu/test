import UIKit

//方法
class Counter {
    var count = 0
    //实例方法
    func increment() {
        count += 1    //self.count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset(){
        count = 0
    }
}
let counter = Counter()
counter.increment()    //起始值是0，现在是1
counter.increment(by: 5)   //现在是6
counter.reset()   //现在是0
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x:4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")  //This point is to the right of the line where x == 1.0
}
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
//        self = Point1(x: x + deltaX, y: y + deltaY)   //可替换为
    }
}
var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint1.x), \(somePoint1.y))")   //3.0,4.0

//三种状态切换枚举
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()     //high
ovenLight.next()     //off

//类型方法
struct LevelTracker {
    static var highestUnlockedlevel = 1
    var currentLevel = 1    //玩家进度
    //新等级被解锁，更新 highestUnlockedlevel
    static func unlock(_ level: Int) {
        if level > highestUnlockedlevel {
            highestUnlockedlevel = level
        }
    }
    //给定等级已解锁，返回true
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedlevel
    }
    //更新前检查新等级是否解锁
    @discardableResult     //允许在调用 advance(to:) 时候忽略返回值，不会产生编译警告
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}
//Player 类使用 LevelTracker 来监测和更新每个玩家的发展进度
class Player {
    var tracker = LevelTracker()
    let palyerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String){
        palyerName = name
    }
}
var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedlevel)")  //2

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
}else{
    print("level 6 has not yet been unlocked")
}
  
