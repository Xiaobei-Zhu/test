import UIKit


//图书
class Book{
    var code: Int
    var name: String
    var goodsType: String
    var price: Double
    var number: Int
    init(code: Int, name: String, goodsType: String, price: Double, number: Int){
        self.code = code
        self.name = name
        self.goodsType = goodsType
        self.price = price
        self.number = number
    }
}
//零食
class Snacks {
    var code: Int
    var name: String
    var goodsType: String
    var price: Double
    var number: Int
    init(code: Int, name: String, goodsType: String, price: Double, number: Int){
        self.code = code
        self.name = name
        self.goodsType = goodsType
        self.price = price
        self.number = number
    }
}
//文具
class Stationery {
    var code: Int
    var name: String
    var goodsType: String
    var price: Double
    var number: Int
    var stationeryDiscount: Double
    init(code: Int, name: String, goodsType: String, price: Double, number: Int, stationeryDiscount: Double) {
        self.code = code
        self.name = name
        self.goodsType = goodsType
        self.price = price
        self.number = number
        self.stationeryDiscount = stationeryDiscount
    }
}
//订单
class Order {
    var id: Int
    var createTime: String
    var type: String
    var state: String
    var customerName: String
    var address: String
    var originalPrice: Double
    var discount:Double
    var finalPrice: Double
    init(id: Int,createTime: String, type: String, state: String, customerName: String, address: String, originalPrice: Double, discount:Double, finalPrice: Double) {
        self.id = id
        self.createTime = createTime
        self.type = type
        self.state = state
        self.customerName = customerName
        self.address = address
        self.originalPrice = originalPrice
        self.discount = discount
        self.finalPrice = finalPrice
    }

}


//订单管理
class OrderManage {
    
}


//生成id

//创建时间
func createTime() -> String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "YYYY-MM-dd HH:mm:ss"// 自定义时间格式
    // GMT时间 转字符串，直接是系统当前时间
    return dateformatter.string(from: Date())
}
//订单类型
enum OrderType: String {
    case book = "book"
    case snacks = "snacks"
    case stationery = "stationery"
}
//订单状态
enum OrderState: String {
    case created = "已创建"
    case finishPay = "已付款"
    case shipped = "已发货"
    case finished = "已完成"
    case failure = "已失效"
}
//客户名称

//收货地址

//计算价格
//func bookPrice(number: Int, originalPrice: Double) -> Double{
//    var price: Double
//    if number == 1 {
//        price = originalPrice * 0.09
//        return price
//    }
//}


var books:[Book] = [Book(code:0001000001, name: "book1", goodsType: "Literature", price: 63.2, number: 1),
                    Book(code:0001000002, name: "book2", goodsType: "Literature", price: 39.0, number: 2),
                    Book(code:0001000003, name: "book3", goodsType: "Literature", price: 45.6, number: 1),
                    Book(code:0002000001, name: "book4", goodsType: "Childre", price: 55.8, number: 1),
                    Book(code:0002000002, name: "book5", goodsType: "Children", price: 32.3, number: 2),
                    Book(code:0003000003, name: "book6", goodsType: "Enhlish", price: 56.4, number: 3),
                    Book(code:0004000001, name: "book7", goodsType: "ComputerLanguage", price: 62.14, number: 4),
                    Book(code:0004000002, name: "book8", goodsType: "ComputerLanguage", price: 45.6, number: 2),]
var snacks:[Snacks] = [Snacks(code:0001000001, name: "snack1", goodsType: "Spicy", price: 10.2, number: 1),
                       Snacks(code:0001000002, name: "snack2", goodsType: "Spicy", price: 8.82, number: 2),
                       Snacks(code:0002000001, name: "snack3", goodsType: "Meet", price: 14.8, number: 3),
                       Snacks(code:0002000002, name: "snack4", goodsType: "Meet", price: 22.6, number: 1),]
var stationery:[Stationery] = [Stationery(code: 0001000001, name: "stationery1", goodsType: "pen", price: 5.2, number: 3, stationeryDiscount: 4.8),
                               Stationery(code: 0001000002, name: "stationery2", goodsType: "pen", price: 3.0, number: 2, stationeryDiscount: 2.3),
                               Stationery(code: 0002000001, name: "stationery3", goodsType: "notebook", price: 12.0, number: 1, stationeryDiscount: 10),
                               Stationery(code: 0002000002, name: "stationery4", goodsType: "notebook", price: 15.0, number: 2, stationeryDiscount: 13),
                               Stationery(code: 0002000003, name: "stationery5", goodsType: "notebook", price: 13.6, number: 1, stationeryDiscount: 10.2),
                               Stationery(code: 0003000001, name: "stationery6", goodsType: "paper", price: 69.0, number: 1, stationeryDiscount: 66)]

class BookOrder{
    var id: Int
    var type: String
    var createTime: String
    var state: String
    var customerName: String
    var address: String
    var bookNumber: Int
    var count: Int
    var bookType: String
    var unitPrice: Double
    var bookName: String
    var originalPrice: Double {
        Double(count) * unitPrice
    }
    var finalPrice: Double{
        switch count {
        case  1:
            return originalPrice * 0.9
        case 2:
            return originalPrice * 0.6
        case 3:
            return originalPrice * 0.5
        case 3...:
            return originalPrice * 0.5
        default:
            return 0
        }
    }
    var discount: Double{
        originalPrice - finalPrice
    }
    init(id: Int, type:String, createTime:String, state: String, address: String, customerName: String, bookNumber: Int, count: Int, bookType: String, unitPrice: Double, bookName: String) {
        self.id = id
        self.type = type
        self.createTime = createTime
        self.state = state
        self.customerName = customerName
        self.address = address
        self.bookNumber = bookNumber
        self.count = count
        self.bookType = bookType
        self.unitPrice = unitPrice
        self.bookName = bookName
    }
    
}


class SnacksOrder{
    var id: Int
    var type: String
    var createTime: String
    var state: String
    var customerName: String
    var address: String
    var bookNumber: Int
    var count: Int
    var bookType: String
    var unitPrice: Double
    var bookName: String
    var originalPrice: Double {
        Double(count) * unitPrice
    }
    var finalPrice: Double{
        switch count {
        case  1:
            return originalPrice * 0.9
        case 2:
            return originalPrice * 0.6
        case 3:
            return originalPrice * 0.5
        case 3...:
            return originalPrice * 0.5
        default:
            return 0
        }
    }
    var discount: Double{
        originalPrice - finalPrice
    }
    init(id: Int, type:String, createTime:String, state: String, address: String, customerName: String, bookNumber: Int, count: Int, bookType: String, unitPrice: Double, bookName: String) {
        self.id = id
        self.type = type
        self.createTime = createTime
        self.state = state
        self.customerName = customerName
        self.address = address
        self.bookNumber = bookNumber
        self.count = count
        self.bookType = bookType
        self.unitPrice = unitPrice
        self.bookName = bookName
    }
    
}
//func creatOrder(orderid: Int) -> Bool {
//    orders[order.id] = order
//    return true
//}
