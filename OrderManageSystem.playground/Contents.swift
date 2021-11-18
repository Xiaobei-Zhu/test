import UIKit


class OrderManage{
    var orders: [Int: Order]
    func creatBookOrder(orderId: Int, orderType: String, createTime: String, orderState: String, customerName: String,address: String, bookNumber: Int, bookCount: Int,bookName: String, bookType: String, bookUnitPrice: Double, originalPrice:Double, finalPrice: Double, discountPrice: Double) -> Bool {
        guard !orders.keys.contains(orderId) else {
            return false
        }
        let bookOrder = Book(bookId: bookId, bookCount: bookCount,bookName: bookName, bookType: bookType, bookUnitPrice: bookUnitPrice)
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
    func printOrder(id: Int) -> String? {
        if orders[id] != nil {
//            let orderAllAtribute = orders[id]?.allAttributes
//            print(orderAllAtribute!)
//            return orderAllAtribute
        }
        return nil
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
    var originalPrice: Double
    var finalPrice: Double
    var discountPrice: Double{
        originalPrice - finalPrice
    }

    init(id: Int, type: String, createTime: String, state: String, customerName: String, address: String, originalPrice: Double, finalPrice: Double) {
        self.id = id
        self.type = type
        self.createTime = createTime
        self.state = state
        self.customerName = customerName
        self.address = address
        self.originalPrice = originalPrice
        self.finalPrice = finalPrice
    }
}

class CalculatePrice{
    func originPrice(count: Int, unitPrice: Double) -> Double {
        return Double(count) * unitPrice
    }
    func withCountFinalPrice(count: Int, originalPrice: Double) -> Double {
        switch count {
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
    func withPriceFinalPrice(count: Int, originalPrice: Double) -> Double {
        if originalPrice < 50 {
            return originalPrice
        }else{
            return originalPrice - Double((Int(originalPrice) / 50) * 10)
        }
    }
    func withPromotionPrice(promotionPrice: Double, count: Int) -> Double {
        promotionPrice * Double(count)
    }
   
}

class Book {
    var bookId: Int
    var bookCount: Int
    var bookName: String
    var bookType: String
    var bookUnitPrice: Double
    init(bookId: Int, bookCount:Int, bookName: String, bookType: String,bookUnitPrice: Double) {
        self.bookId = bookId
        self.bookCount = bookCount
        self.bookName = bookName
        self.bookType = bookType
        self.bookUnitPrice = bookUnitPrice
    }
}
    

class Snacks {
    var snacksId: Int
    var snacksName: String
    var snacksCount: Int
    var snacksType: String
    var snacksUnitPrice: Double
    
    init(snacksId: Int, snacksName: String, snacksCount: Int, snacksType: String, snacksUnitPrice: Double) {
        self.snacksId = snacksId
        self.snacksName = snacksName
        self.snacksCount = snacksCount
        self.snacksType = snacksType
        self.snacksUnitPrice = snacksUnitPrice
        
    }
}

class Stationery {
    var stationeryId: Int
    var stationeryName: String
    var stationeryCount: Int
    var stationeryType: String
    var stationeryUnitPrice: Double
    var promotionPrice:Double
    
    init(stationeryId: Int, stationeryName: String, stationeryCount: Int, stationeryType:String, stationeryUnitPrice: Double, promotionPrice: Double) {
        self.stationeryId = stationeryId
        self.stationeryName = stationeryName
        self.stationeryCount = stationeryCount
        self.stationeryType = stationeryType
        self.stationeryUnitPrice = stationeryUnitPrice
        self.promotionPrice = promotionPrice
}
 
func createTime() -> String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
    return dateformatter.string(from: Date())
}

enum OrderType: String {
    case book = "book"
    case snacks = "snacks"
    case stationery = "stationery"
}

enum OrderState: String {
    case created = "Created"
    case finishPay = "Paid"
    case shipped = "Shipped"
    case finished = "Finished"
    case failure = "Expired"
    
}

var book = Book(bookId: 1001, bookCount: 2, bookName: "swift", bookType: "swift", bookUnitPrice: 54.3)
var snacks = Snacks(snacksId: 2001, snacksName: "Three Squirrel", snacksCount: 8, snacksType: "SnackFood", snacksUnitPrice: 12.4)
var stationeryOrder = Stationery(stationeryId: 3001, stationeryName: "Pencil", stationeryCount: 10, stationeryType: "pen", stationeryUnitPrice: 4.2, promotionPrice: 3.5)
//calculate price
var calculatePrice = CalculatePrice()

var orderManger = OrderManage()
//creatOrder
orderManger.creatBookOrder(orderId: bookOrder.id, orderType: bookOrder.type, createTime: bookOrder.createTime, orderState: bookOrder.state, customerName: bookOrder.customerName, address: bookOrder.address, bookNumber: bookOrder.bookNumber, bookCount: bookOrder.bookCount,bookName: bookOrder.bookName, bookType: bookOrder.bookType, bookUnitPrice: bookOrder.bookUnitPrice, originalPrice: bookOriginalPrice, finalPrice: bookfinalPrice, discountPrice: bookDiscountPrice)
orderManger.createSnacksOrder(orderId: snacksOrder.id, type: snacksOrder.snacksType, createTime: snacksOrder.createTime, state: snacksOrder.state, customerName: snacksOrder.customerName, address: snacksOrder.address, snacksNumber: snacksOrder.snacksNumber, snacksName: snacksOrder.snacksName, snacksCount: snacksOrder.snacksCount, snacksType: snacksOrder.snacksType, snacksUnitPrice: snacksOrder.snacksUnitPrice, originalPrice: snacksoriginalPrice, finalPrice: snacksFinalPrice, discountPrice: snacksDiscountPrice)
orderManger.creatStationery(orderId: stationeryOrder.id, type: stationeryOrder.type, createTime: stationeryOrder.createTime, state: stationeryOrder.state, customerName: stationeryOrder.customerName, address: stationeryOrder.address, stationeryNumber: stationeryOrder.stationeryNumber, stationeryName: stationeryOrder.stationeryName, stationeryCount: stationeryOrder.stationeryCount, stationeryType: stationeryOrder.stationeryType, stationeryUnitPrice: stationeryOrder.stationeryUnitPrice, promotionPrice: stationeryOrder.promotionPrice, originalPrice: stationeryOriginalPrice, finalPrice: stationFinalPrice, discountPrice: stationeryDiscount)
//QueryOrder
var order = orderManger.queryOderById(id: bookOrder.id)
//Change order to finished
orderManger.changeOrderState(id: bookOrder.id, state: OrderState.finished.rawValue)
order = orderManger.queryOderById(id: bookOrder.id)
//print("changed order state：\(String(describing: order?.state))")
//print order
orderManger.printOrder(id: bookOrder.id)

//orderManger.printOrder(id: snacksOrder.id)
//print(orderManger.printOrder(id: stationeryOrder.id) as Any)
//delet order
//orderManger.deletOrder(id: bookOrder.id)

