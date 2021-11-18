import UIKit

class OrderManage{
    var orders: [Int: Order]
    func creatBookOrder(orderId: Int, orderType: String, createTime: String, orderState: String, customerName: String,address: String, bookNumber: Int, bookCount: Int,bookName: String, bookType: String, bookUnitPrice: Double, originalPrice:Double, finalPrice: Double, discountPrice: Double) -> Bool {
        guard !orders.keys.contains(orderId) else {
            return false
        }
        let bookOrder = BookOrder(bookNumber: bookNumber, bookCount: bookCount,bookName: bookName, bookType: bookType, bookUnitPrice: bookUnitPrice, id: orderId, type: orderType, createTime: createTime, state: orderState, customerName: customerName, address: address)
        orders[orderId] = bookOrder
        return true
    }
    func createSnacksOrder(orderId: Int, type: String, createTime: String, state: String, customerName: String, address: String, snacksNumber: Int, snacksName: String, snacksCount: Int, snacksType: String, snacksUnitPrice: Double, originalPrice:Double, finalPrice: Double, discountPrice: Double) -> Bool {
        guard !orders.keys.contains(orderId) else {
            return false
        }
        let snacksOrder = Snacks(snacksNumber: snacksNumber, snacksName: snacksName, snacksCount: snacksCount, snacksType: snacksType, snacksUnitPrice: snacksUnitPrice, id: orderId, type: type, createTime: createTime, state: state, customerName: customerName, address: address)
        orders[orderId] = snacksOrder
        return true
    }
    func creatStationery(orderId: Int, type: String, createTime: String, state: String, customerName: String, address: String, stationeryNumber: Int, stationeryName: String, stationeryCount: Int, stationeryType: String, stationeryUnitPrice: Double, promotionPrice: Double, originalPrice:Double, finalPrice: Double, discountPrice: Double) -> Bool {
        guard !orders.keys.contains(orderId) else {
            return false
        }
        let stationeryOrder = Stationery(stationeryNumber: stationeryNumber, stationeryName: stationeryName, stationeryCount: stationeryCount, stationeryType: stationeryType, stationeryUnitPrice: stationeryUnitPrice, promotionPrice: promotionPrice, id: orderId, type: type, createTime: createTime, state: state, customerName: customerName, address: address)
        orders[orderId] = stationeryOrder
        return true
    }
    func changeOrderState(id: Int, state: String) -> Bool {
        if orders[id] != nil {
            orders[id]?.state = state
            return true
        }else{
            return false
        }
    }
    func queryOderById(id: Int) -> Order? {
        return orders[id]
        
    }
    func deletOrder(id: Int) -> Bool {
        if orders[id] != nil {
            orders.removeValue(forKey: id)
            return true
        }else {
            return false
        }
    }
    func printOrder(id: Int) -> Order? {
        if orders[id] != nil {
            orders[id]?.printOrder()
            return orders[id]
        }
        return orders[id]
    }
    init() {
        self.orders = [:]
    }
}

class Order{
    var id: Int
    var type: String
    var createTime: String
    var state: String
    var customerName: String
    var address: String
    var originalPrice: Double{
        get {
            0.0
        }
    }
    var finalPrice :Double{
        get {
            0.0
        }
    }
    var discountPrice: Double{
        originalPrice - finalPrice
    }
    //print方法
    func printOrder() {
        
    }
    init(id: Int, type: String, createTime: String, state: String, customerName: String, address: String) {
        self.id = id
        self.type = type
        self.createTime = createTime
        self.state = state
        self.customerName = customerName
        self.address = address
    }
}
//Book
class BookOrder: Order {
    var bookNumber: Int
    var bookCount: Int
    var bookName: String
    var bookType: String
    var bookUnitPrice: Double
    override var originalPrice: Double {
        get{
            Double(bookCount) * bookUnitPrice
        }
        
    }
    override var finalPrice: Double{
        get {
            switch bookCount {
            case 1:
                return originalPrice * Double(0.9)
            case 2:
                return originalPrice * Double(0.6)
            case 3:
                return originalPrice * Double(0.5)
            case 3...:
                return originalPrice * Double(0.5)
            default:
                return 0
            }
        }
    
    }
    //override print方法
    override func printOrder() {
        super.printOrder()
        print("订单编号：\(id)")
        print("订单类型：\(type)")
        print("下单时间：\(createTime)")
        print("订单状态：\(state)")
        print("客户姓名：\(customerName)")
        print("收货地址：\(address)")
        print("价格：\(originalPrice)")
        print("折扣：\(discountPrice)")
        print("支付价格：\(finalPrice)")
        print("图书编号：\(bookNumber)")
        print("图书名称：\(bookName)")
        print("图书数量：\(bookCount)")
        print("图书类型：\(bookType)")
        print("图书单价：\(bookUnitPrice)")
    }
    init(bookNumber: Int, bookCount: Int,bookName:String, bookType: String, bookUnitPrice: Double, id: Int, type: String, createTime: String, state: String, customerName: String, address: String) {
    self.bookNumber = bookNumber
    self.bookCount = bookCount
    self.bookName = bookName
    self.bookType = bookType
    self.bookUnitPrice = bookUnitPrice
        super.init(id: id, type: type, createTime: createTime, state: state, customerName: customerName, address: address)
}
}
class Snacks: Order{
    var snacksNumber: Int
    var snacksName: String
    var snacksCount: Int
    var snacksType: String
    var snacksUnitPrice: Double
    override var originalPrice: Double {
        get {
            Double(snacksCount) * snacksUnitPrice
        }
        
    }
    override var finalPrice: Double {
        get {
            if originalPrice < 50 {
                return originalPrice
            }else{
                return originalPrice - Double((Int(originalPrice) / 50) * 10)
            }
        }
        
    }
    override func printOrder() {
        super.printOrder()
        print("订单编号：\(id)")
        print("订单类型：\(type)")
        print("下单时间：\(createTime)")
        print("订单状态：\(state)")
        print("客户姓名：\(customerName)")
        print("收货地址：\(address)")
        print("价格：\(originalPrice)")
        print("折扣：\(discountPrice)")
        print("支付价格：\(finalPrice)")
        print("零食编号：\(snacksNumber)")
        print("零食名称：\(snacksName)")
        print("零食数量：\(snacksCount)")
        print("零食类型：\(snacksType)")
        print("零食单价：\(snacksUnitPrice)")
    }
    init(snacksNumber: Int, snacksName: String, snacksCount: Int, snacksType: String, snacksUnitPrice: Double, id: Int, type: String, createTime: String, state: String, customerName: String, address: String) {
        self.snacksNumber = snacksNumber
        self.snacksName = snacksName
        self.snacksCount = snacksCount
        self.snacksType = snacksType
        self.snacksUnitPrice = snacksUnitPrice
        super.init(id: id, type: type, createTime: createTime, state: state, customerName: customerName, address: address)
    }
}

class Stationery: Order {
    var stationeryNumber: Int
    var stationeryName: String
    var stationeryCount: Int
    var stationeryType: String
    var stationeryUnitPrice: Double
    var promotionPrice:Double
    override var originalPrice: Double {
        get {
            Double(stationeryCount) * stationeryUnitPrice
        }
    }
    override var finalPrice: Double{
        get {
            promotionPrice * Double(stationeryCount)
        }
        
    }
    override func printOrder() {
        super.printOrder()
        print("订单编号：\(id)")
        print("订单类型：\(type)")
        print("下单时间：\(createTime)")
        print("订单状态：\(state)")
        print("客户姓名：\(customerName)")
        print("收货地址：\(address)")
        print("价格：\(originalPrice)")
        print("折扣：\(discountPrice)")
        print("支付价格：\(finalPrice)")
        print("文具编号：\(stationeryNumber)")
        print("文具名称：\(stationeryName)")
        print("文具数量：\(stationeryCount)")
        print("文具类型：\(stationeryType)")
        print("文具单价：\(stationeryUnitPrice)")
        print("文具促销价：\(promotionPrice)")
    }
    init(stationeryNumber: Int, stationeryName: String, stationeryCount: Int, stationeryType:String, stationeryUnitPrice: Double, promotionPrice: Double, id: Int, type: String, createTime: String, state: String, customerName: String, address: String) {
        self.stationeryNumber = stationeryNumber
        self.stationeryName = stationeryName
        self.stationeryCount = stationeryCount
        self.stationeryType = stationeryType
        self.stationeryUnitPrice = stationeryUnitPrice
        self.promotionPrice = promotionPrice
        super.init(id: id, type: type, createTime: createTime, state: state, customerName: customerName, address: address)
    }
}
 
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

var bookOrder = BookOrder(bookNumber: 1001, bookCount: 2, bookName: "swift with ios", bookType: "swift", bookUnitPrice: 54.3, id: 100001000001, type: "book", createTime: createTime(), state: OrderState.created.rawValue, customerName: "Tom", address: "xi'an")
var snacksOrder = Snacks(snacksNumber: 2001, snacksName: "Three Squirrel", snacksCount: 8, snacksType: "Snack Food", snacksUnitPrice: 12.4, id:2000010000001, type: "snack", createTime:createTime() , state: OrderState.created.rawValue, customerName: "Jerry", address: "China")
var stationeryOrder = Stationery(stationeryNumber: 3001, stationeryName: "pencil", stationeryCount: 10, stationeryType: "pen", stationeryUnitPrice: 4.2, promotionPrice: 3.5, id: 300001000001, type: "stationery", createTime: createTime(), state: OrderState.created.rawValue, customerName: "zzp", address: "jinye Road")
var orderManger = OrderManage()
//创建订单
orderManger.creatBookOrder(orderId: bookOrder.id, orderType: bookOrder.type, createTime: bookOrder.createTime, orderState: bookOrder.state, customerName: bookOrder.customerName, address: bookOrder.address, bookNumber: bookOrder.bookNumber, bookCount: bookOrder.bookCount,bookName: bookOrder.bookName, bookType: bookOrder.bookType, bookUnitPrice: bookOrder.bookUnitPrice, originalPrice: bookOrder.originalPrice, finalPrice: bookOrder.finalPrice, discountPrice: bookOrder.finalPrice)
orderManger.createSnacksOrder(orderId: snacksOrder.id, type: snacksOrder.snacksType, createTime: snacksOrder.createTime, state: snacksOrder.state, customerName: snacksOrder.customerName, address: snacksOrder.address, snacksNumber: snacksOrder.snacksNumber, snacksName: snacksOrder.snacksName, snacksCount: snacksOrder.snacksCount, snacksType: snacksOrder.snacksType, snacksUnitPrice: snacksOrder.snacksUnitPrice, originalPrice: snacksOrder.originalPrice, finalPrice: snacksOrder.finalPrice, discountPrice: snacksOrder.discountPrice )
orderManger.creatStationery(orderId: stationeryOrder.id, type: stationeryOrder.type, createTime: stationeryOrder.createTime, state: stationeryOrder.state, customerName: stationeryOrder.customerName, address: stationeryOrder.address, stationeryNumber: stationeryOrder.stationeryNumber, stationeryName: stationeryOrder.stationeryName, stationeryCount: stationeryOrder.stationeryCount, stationeryType: stationeryOrder.stationeryType, stationeryUnitPrice: stationeryOrder.stationeryUnitPrice, promotionPrice: stationeryOrder.promotionPrice, originalPrice: stationeryOrder.originalPrice, finalPrice: stationeryOrder.finalPrice, discountPrice: stationeryOrder.discountPrice)
//查询订单
var order = orderManger.queryOderById(id: bookOrder.id)
//更改订单状态为完成
orderManger.changeOrderState(id: bookOrder.id, state: OrderState.finished.rawValue)
order = orderManger.queryOderById(id: bookOrder.id)
print("更改后订单状态：\(String(describing: order?.state))")
//打印订单
orderManger.printOrder(id: bookOrder.id)
orderManger.printOrder(id: snacksOrder.id)
orderManger.printOrder(id: stationeryOrder.id)
//删除订单
orderManger.deletOrder(id: bookOrder.id)
