import UIKit
//下标
var str = "Hello, playground"

//只读下标的实现
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

//Array数组创建一个自定义的数组类
class MyArray{
    var array: Array<Int>
    init(param: Int...) {
        array = param
    }
    subscript(index: Int) -> Int{
        set{
            array[index] = newValue
        }
        get {
            return array[index]
        }
    }
}
var myArray = MyArray(param: 1, 2, 3, 4, 5)
myArray[4]
myArray[1]

class MyArrayTest{
    var array: Array<Array<Int>>
    init(param1: Array<Int>...) {
        array = param1
    }
    subscript(index1: Int, index2: Int) -> Int{
        set{
            array[index1][index2] = newValue
        }
        get {
            var tem = array[index1]
            return tem[index2]
        }
    }
}
var myArrayTest = MyArrayTest(param1: [1, 2, 3],[4, 5, 6],[7, 8, 9])
myArrayTest[0, 1]

//类型下标
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[2]
//下标选项
struct Matrix {
    let rows: Int, columns: Int
    var gird: [Double]
    init(rows: Int,columns: Int) {
        self.rows = rows
        self.columns = columns
        gird = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int,column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) ->Double {
        get {
            assert(indexIsValid(row: row, column: column), "index out of range")
            return gird[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            gird[(row * column) + column] = newValue
        }
    }
}


