import UIKit
import Combine

public func example(of description: String,
                    action: () -> Void) {
  print("\n——— Example of:", description, "———")
  action()
}

var subscriptions = Set<AnyCancellable>()

example(of: "switchToLatest - Network Request") {
  let url = URL(string: "https://source.unsplash.com/random")!

  func getImage() -> AnyPublisher<UIImage?, Never> {
      URLSession.shared
        .dataTaskPublisher(for: url)
        .map { data, _ in UIImage(data: data) }
        .print("image")
        .replaceError(with: nil)
        .eraseToAnyPublisher()
  }

  let taps = PassthroughSubject<Void, Never>()

  taps
    .map { _ in getImage() }
    .switchToLatest()
    .sink(receiveValue: { _ in })
    .store(in: &subscriptions)
  taps.send()

  DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    taps.send()
  }

  DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
    taps.send()
  }
}

// sink()
example(of: "Just") {
  let just = Just("Hello world!")
  _ = just
    .sink(
      receiveCompletion: {
        print("Received completion", $0)
      },
      receiveValue: {
        print("Received value", $0)
    })
}





//  Zip
example(of: "zip") {
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<String, Never>()

  publisher1
      .zip(publisher2)
      .sink(
        receiveCompletion: { _ in print("Completed") },
        receiveValue: { print("P1: \($0), P2: \($1)") }
      )
      .store(in: &subscriptions)

  publisher1.send(1)
  publisher1.send(2)
  publisher2.send("a")
  publisher2.send("b")
  publisher1.send(3)
  publisher2.send("c")
  publisher2.send("d")

  publisher1.send(completion: .finished)
  publisher2.send(completion: .finished)
}

//CombineLatest ???
example(of: "combineLatest") {
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<String, Never>()

  publisher1
    .combineLatest(publisher2)
    .sink(
      receiveCompletion: { _ in print("Completed") },
      receiveValue: { print("P1: \($0), P2: \($1)") }
    )
    .store(in: &subscriptions)

  publisher1.send(1)
  publisher1.send(2)
  
  publisher2.send("a")
  publisher2.send("b")
  
  publisher1.send(3)
  
  publisher2.send("c")

  publisher1.send(completion: .finished)
  publisher2.send(completion: .finished)
}

//  Merge
example(of: "merge(with:)") {
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<Int, Never>()

  publisher1
    .merge(with: publisher2)
    .sink(
      receiveCompletion: { _ in print("Completed") },
      receiveValue: { print($0) }
    )
    .store(in: &subscriptions)

  publisher1.send(1)
  publisher1.send(2)
    
  publisher2.send(3)

  publisher1.send(4)

  publisher2.send(5)

  publisher1.send(completion: .finished)
  publisher2.send(completion: .finished)
}

// Example in life SwitchToLatest
//example(of: "switchToLatest - Network Request") {
//  let url = URL(string: "https://source.unsplash.com/random")!
//
//  func getImage() -> AnyPublisher<UIImage?, Never> {
//      URLSession.shared
//        .dataTaskPublisher(for: url)
//        .map { data, _ in UIImage(data: data) }
//        .print("image")
//        .replaceError(with: nil)
//        .eraseToAnyPublisher()
//  }
//
//  let taps = PassthroughSubject<Void, Never>()
//
//  taps
//    .map { _ in getImage() }
//    .switchToLatest()
//    .sink(receiveValue: { _ in })
//    .store(in: &subscriptions)
//  taps.send()
//
//  DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//    taps.send()
//  }
//
//  DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
//    taps.send()
//  }
//}


//switchToLastest
example(of: "switchToLatest") {
  let publisher1 = PassthroughSubject<Int, Never>()
  let publisher2 = PassthroughSubject<Int, Never>()
  let publisher3 = PassthroughSubject<Int, Never>()
    
  let publishers = PassthroughSubject<PassthroughSubject<Int, Never>, Never>()

  publishers
    .switchToLatest()
    .sink(
      receiveCompletion: { _ in print("Completed!") },
      receiveValue: { print($0) }
    )
    .store(in: &subscriptions)

  publishers.send(publisher1)
  publisher1.send(1)
  publisher1.send(2)

  publishers.send(publisher2)
  publisher1.send(3)  //ignore
  publisher2.send(4)
  publisher2.send(5)

  publishers.send(publisher3)
  publisher2.send(6)  //ignore
  publisher3.send(7)
  publisher3.send(8)
  publisher3.send(9)

  publisher3.send(completion: .finished)
  publishers.send(completion: .finished)
// 1,2,4,5,7,8,9 Completed
}

//prepending
example(of: "prepend(Publisher) #2") {
    
    let publisher1 = [3, 4].publisher
    let publisher2 = PassthroughSubject<Int, Never>()

    publisher1
        .prepend(publisher2)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    publisher2.send(1)
    publisher2.send(2)   //1,2
    publisher2.send(completion: .finished)   //1, 2, 3
}

// Operator

example(of: "drop(untilOutputFrom:)") {
  let isReady = PassthroughSubject<Void, Never>()
  let taps = PassthroughSubject<Int, Never>()
  taps
    .drop(untilOutputFrom: isReady)
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
  (1...5).forEach { n in
    taps.send(n)
    if n == 3 {
      isReady.send()
    }
  }
}

example(of: "last(where:)") {
  let numbers = (1...9).publisher
  numbers
    .last(where: { $0 % 2 == 0 })
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)
}

example(of: "first(where:)") {
    let numbers = (1...9).publisher.print("numbers")
    numbers
        .first(where: { $0 % 2 == 0 })
        .sink(receiveCompletion: { print("Completed with: \($0)") },
              receiveValue: { print($0) })
        .store(in: &subscriptions)
}

// filter
example(of: "filter") {
  let numbers = (1...10).publisher
  numbers
    .filter { $0.isMultiple(of: 3) }
    .sink(receiveValue: { n in
      print("\(n) is a multiple of 3!")
    })
    .store(in: &subscriptions)
}
// scan
example(of: "scan") {
  var dailyGainLoss: Int { .random(in: -10...10) }
  let august2019 = (0..<22)
    .map { _ in dailyGainLoss }
    .publisher

  august2019
    .scan(50) { latest, current in
      max(0, latest + current)
    }
    .sink(receiveValue: { _ in })
    .store(in: &subscriptions)
}
// flatMap
example(of: "flatMap") {
  func decode(_ codes: [Int]) -> AnyPublisher<String, Never> {
    Just(
      codes.compactMap { code in
          guard (32...255).contains(code) else { return nil }
          return String(UnicodeScalar(code) ?? " ")
        }
        .joined()
    )
    .eraseToAnyPublisher()
  }
    [72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
      .publisher
      .collect()
      .flatMap(decode)
      .sink(receiveValue: { print($0) })
      .store(in: &subscriptions)
}

// map(_:)
example(of: "map") {
  let formatter = NumberFormatter()
  formatter.numberStyle = .spellOut
  [123, 4, 56].publisher
    .map {
      formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
    }
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}

example(of: "tryMap") {
  Just("Directory name that does not exist")
//    .tryMap { try FileManager.default.contentsOfDirectory(atPath: $0) }
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })
    .store(in: &subscriptions)
}

// collect()
example(of: "collect") {
  ["A", "B", "C", "D", "E"].publisher
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })
    .store(in: &subscriptions)

    ["A", "B", "C", "D", "E"].publisher
      .collect(2)
      .sink(receiveCompletion: { print($0) },
            receiveValue: { print($0) })
      .store(in: &subscriptions)
}

// Publisher & Subscriber
// async/await
example(of: "async/await") {
    let subject = CurrentValueSubject<Int, Never>(0)
// Task use swift5.5 to implement async/await
//    Task  {
//        for awaitElement in subject.values {
//            print("Element: \(element)")
//        }
//        print("Completed.")
//    }
    subject.send(1)
    subject.send(2)
    subject.send(3)

    subject.send(completion: .finished)
}

example(of: "Type erasure") {
  let subject = PassthroughSubject<Int, Never>()
  let publisher = subject.eraseToAnyPublisher()
  publisher
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
  subject.send(1)
}

example(of: "Dynamically adjusting Demand") {
  final class IntSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
      subscription.request(.max(2))
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
      print("Received value", input)
      
      switch input {
      case 1:
        return .max(2) // 1
      case 3:
        return .max(1) // 2
      default:
        return .none // 3
      }
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
      print("Received completion", completion)
    }
  }
  
  let subscriber = IntSubscriber()
  
  let subject = PassthroughSubject<Int, Never>()
  
  subject.subscribe(subscriber)
  
  subject.send(1)
  subject.send(2)
  subject.send(3)
  subject.send(4)
  subject.send(5)
  subject.send(6)
}

example(of: "CurrentValueSubject") {
  var subscriptions = Set<AnyCancellable>()
  let subject = CurrentValueSubject<Int, Never>(0)
  subject
    .print()
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
    subject.send(1)
    subject.send(2)
    subject.value = 3
    subject.send(completion: .finished)
    print(subject.value)

}
//  Subject
example(of: "PassthroughSubject") {
    enum MyError: Error {
      case test
    }

  final class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MyError
    
    func receive(subscription: Subscription) {
      subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
      print("Received value", input)
      return input == "World" ? .max(1) : .none
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
      print("Received completion", completion)
    }
  }
  let subscriber = StringSubscriber()
}
// Customer Subscriber
example(of: "Custom Subscriber") {
  let publisher = (1...6).publisher

  final class IntSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never

    func receive(subscription: Subscription) {
      subscription.request(.max(3))
    }

    func receive(_ input: Int) -> Subscribers.Demand {
      print("Received value", input)
      return .unlimited
    }

    func receive(completion: Subscribers.Completion<Never>) {
      print("Received completion", completion)
    }
  }
    let subscriber = IntSubscriber()
    publisher.subscribe(subscriber)
}
// Customer Subscriber
example(of: "Custom Subscriber") {
  let publisher = (1...6).publisher

  final class IntSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never

    func receive(subscription: Subscription) {
      subscription.request(.max(3))
    }

    func receive(_ input: Int) -> Subscribers.Demand {
      print("Received value", input)
      return .unlimited
    }

    func receive(completion: Subscribers.Completion<Never>) {
      print("Received completion", completion)
    }
  }
    let subscriber = IntSubscriber()
    publisher.subscribe(subscriber)
}

// assign(to:)
example(of: "assign(to:)") {
  class SomeObject {
    @Published var value = 0
  }
  
  let object = SomeObject()
 
  object.$value
    .sink {
      print($0)
    }

  (0..<10).publisher
    .assign(to: &object.$value)
}

// assign(to:on:)

example(of: "assign(to:on:)") {
  class SomeObject {
    var value: String = "" {
      didSet {
        print(value)
      }
    }
  }
  let object = SomeObject()
  let publisher = ["Hello", "world!"].publisher
  _ = publisher
    .assign(to: \.value, on: object)
}

print("adddaddaddaddaddaddaddaddaddaddadddaddaddaddaddaddaddaddaddaddissississ")
// sink()
example(of: "Just") {
  let just = Just("Hello world!")
  _ = just
    .sink(
      receiveCompletion: {
        print("Received completion", $0)
      },
      receiveValue: {
        print("Received value", $0)
    })
}

















