import UIKit
//闭包

//标准函数
func myFunc(param: Int) -> Int{
    return param * param
}
//闭包
let myClosures = {(param: Int) -> Int in return param * param}

myFunc(param: 3)   //调用函数
myClosures(3)  //调用闭包

//省略返回值
let myClosures1 = {(param: Int) in
    return param * param
}

func myFunc1(closure: (Int, Int) ->Bool){
    
}
//闭包后置
myFunc1{
    $0 > $1
}
//自动闭包
func myFunc2(closure : @autoclosure () ->Bool){
}
//调用函数时直接传入一个表达式即可，编译器会自动生成闭包
myFunc2(closure: 2+3+4>10)
//将闭包参数声明为自动闭包 逃逸闭包
func myFunc3(closure: @autoclosure @escaping () ->Bool){
    
}
