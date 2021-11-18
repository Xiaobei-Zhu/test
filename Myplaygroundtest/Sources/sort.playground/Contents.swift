import UIKit

//闭包实现冒泡排序    ????
func mySort(array: inout Array<Any>, sortClosures: (Int, Int) ->Bool) -> Array<Any>{
    for indexI in array.indices {
        //最后一个元素直接返回
        if indexI == array.count-1 {
            break
        }
        // 冒泡排序
        for indexJ in 0...((array.count-1) - indexI - 1) {
            //调用传递进来的闭包算法
            if sortClosures(indexJ, indexJ+1){
                
            }else{
                array.swapAt(indexJ, indexJ+1)
            }
        }
    }
    return array
}
var array: Array<Any> = [1, 4, 3, 5, 7, 5, 4, 2, 7]
mySort(array: &array, sortClosures: {(index: Int, nextIndex: Int) ->Bool in
    return (array[index] as! Int) > (array[nextIndex] as! Int)
})
print(array)

//编写一个自定义类进行排序测试
class Student {
    let achievment: Int     //学生成绩
    let name: String    //学生姓名
    //构造方法
    init(name: String, achievment: Int) {
        self.achievment = achievment
        self.name = name
    }
}
let stu1 = Student(name: "小王", achievment: 89)
let stu2 = Student(name: "小李", achievment: 69)
let stu3 = Student(name: "小张", achievment: 81)
let stu4 = Student(name: "小孙", achievment: 93)
var stuArr: Array<Any> = [stu1, stu2, stu3, stu4]
mySort(array: &stuArr, sortClosures: {(index:Int, nextIndex: Int) -> Bool in
    return (stuArr[index] as! Student).achievment > (stuArr[nextIndex] as! Student).achievment
})
//优化
mySort(array: &stuArr, sortClosures: {(index, nextIndex) in
    return (stuArr[index] as! Student).achievment > (stuArr[nextIndex] as! Student).achievment
})
//省略return
mySort(array: &stuArr, sortClosures: {(index, nextIndex) in
    (stuArr[index] as! Student).achievment > (stuArr[nextIndex] as! Student).achievment
})
//省略参数
mySort(array: &stuArr, sortClosures: {
    (stuArr[$0] as! Student).achievment > (stuArr[$1] as! Student).achievment
})
//后置闭包
mySort(array: &stuArr) {
    (stuArr[$0] as! Student).achievment > (stuArr[$1] as! Student).achievment
}
