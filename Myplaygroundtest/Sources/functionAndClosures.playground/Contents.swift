import UIKit
//函数和闭包
//函数
func ismoreThanTen(count: Int) ->Bool{
    if count > 10{
        return true
    }else{
        return false
    }
}
ismoreThanTen(count: 9)
ismoreThanTen(count: 11)

//无参数函数
func myFunc1() ->String{
    return "无参函数"
}
myFunc1()

//无参数无返回值
func myFunc2() ->Void{
    print("无参无返回值")
}
func myFunc3(){
    print("省略返回值")
}
myFunc2()
myFunc3()

//模拟数据查询函数
func searchData(dataID:String) ->(succsee:Bool, data:String){
    //模拟一个查询结果和数据实体
    let result = true
    let data = "数据实体"
    return (result, data)
}
if searchData(dataID: "1101").succsee{
    //查询成功
    print(searchData(dataID: "1101").data)    //数据实体
}

//返回optional类型值的函数
func myFunc4(param:Int) -> Int?{
    guard param > 100 else {
        return nil
    }
    return param - 100
}
if let tem = myFunc4(param: 100){
    print(tem)   //1
}

//内部命名与外部命名
func myFunc5(param1: Int, param2: Int, param3: Int){
    //这里使用param1,param2,param3是参数的内部命名
    param1 + param2 + param3
}
//调用函数的参数列表中使用的param1,param2,param3是外部命名
myFunc5(param1: 1, param2: 2, param3: 3)

//在函数声明时在内部参数前添加名称作为参数外部命名
func myFunc6(ou1 param1: Int, ou2 param2: Int,ou3 param3: Int){
    //param1,param2,param3为内部参数
    param3 + param2 + param1
}
//调用函数时，参数将被外部命名标识，ou1,ou2,ou3为函数参数的外部命名
myFunc6(ou1: 1, ou2: 2, ou3: 3)

//省略外部名称的函数参数列表。“-”
func myFunc7(_ param1: Int, _ param2:Int,_ param3: Int){
    param3 + param2 + param1
}
//在调用函数时 不再标识参数名称
myFunc7(1, 2, 3)


//参数的默认值
//默认参数param2的值为10，param3的值为5
func myFunc8(param1: Int,param2: Int = 10 ,param3:Int = 5){
    print(param3+param2+param1)
}
//对每个参数进行传值
myFunc8(param1: 1, param2: 1, param3: 1)  //3
//只对没有设置默认值的参数传值
myFunc8(param1: 10)   //25

func myFunc9(param1:Int, param2:Int = 10, param3:Int){
    print(param1+param2+param3)
}
//对应的参数位置要一致
myFunc9(param1: 10, param3: 10)   //30

//参数数量不确定的函数
func myFunc10(param:Int...){
    var sum = 0
    for count in param{
        sum += count
    }
    print(sum)
}
//传递参数的个数可以任意
myFunc10(param: 1, 2, 3, 4, 6, 6) //27
myFunc10(param: 12, 2, 3)  //17

//追加“...”  传递参数类型必须相同
func myFunc11(param1:Int..., param2:String){
    var sum = 0;
    for count in param1{
        sum += count
    }
    print("\(param2) : \(sum)")
}
myFunc11(param1: 1, 2, 3, param2: "Hello")    //Hello:6
myFunc11(param1: 1, 1, 12, 12, param2: "hello")  //hello:26
//myFunc11(param1: 2, 3, "tom", param2: "hello")  //类型错误
//函数内部修改传递的参数。错误实例
//func Myfunc12(param:Int){
//    param += 1    //编译错误
//}

//inout类型  传参时需要使用“&”符号，将传递参数变量的内存地址
func myFunc12(param: inout Int){
    param += 1
}
var para = 10
myFunc12(param: &para)
print(para)   //11

//函数变量的声明及赋值
var addFunc:(Int, Int) ->Int  //声明一个函数变量
addFunc = {(param1: Int, param2:Int) in return param1+param2}  //对函数变量进行赋值。   闭包
addFunc(2,3)  //调用函数变量。5

//通过一个函数对函数变量进行赋值
var addFunc1: (Int, Int) ->Int
func myFunc13(param1: Int, param2: Int) ->Int{
    return param1+param2
}
addFunc1 = myFunc13
addFunc1(1, 3)   //3

//函数也可以作为另一个函数的参数
//参数param1的类型为函数类型（Int，Int）->
func myFunc14(param1:(Int, Int) ->Int){
    print(param1(1,2))
}
//将addFunc1函数作为参数传递进myFunc14函数
myFunc14(param1: addFunc)  //3    var addFunc:(Int, Int) ->Int

//函数作为返回值
var addfunc3: (Int, Int) ->Int
func myFunc15() -> (Int, Int) ->Int {
    return {(param1: Int, param2: Int) in
        return param1+param2
    }
}
addfunc3 = myFunc15()
addfunc3(1, 2)

//函数内部再次创建函数
func myFunc16() -> (Int, Int) ->Int {
    func sunFunc(param1: Int, param2: Int) ->Int{
        return param1+param2
    }
    return sunFunc
}
