
import UIKit
import Combine

public func example(of description: String,
                    action: () -> Void) {
  print("\n——— Example of:", description, "———")
  action()
}

var subscriptions = Set<AnyCancellable>()


//handleEvents
let request = URLSession.shared
  .dataTaskPublisher(for: URL(string: "https://www.raywenderlich.com/")!)

request
    .handleEvents(receiveSubscription: { _ in
      print("Network request will start")
    }, receiveOutput: { _ in
      print("Network request data received")
    }, receiveCancel: {
      print("Network request cancelled")
    })

    .sink(receiveCompletion: { completion in
    print("Sink received completion: \(completion)")
    }) { (data, _) in
    print("Sink received data: \(data)")
    }
    .store(in: &subscriptions)



let intSubject = PassthroughSubject<Int, Never>()

intSubject.sink(receiveValue: { value in
   print(value)
   print(Thread.current)
}).store(in: &subscriptions)

intSubject.send(1)

DispatchQueue.global().async {
  intSubject.send(2)
}

let queue = OperationQueue()
queue.maxConcurrentOperationCount = 1
queue.underlyingQueue = DispatchQueue(label: "com.donnywals.queue")

queue.addOperation {
  intSubject.send(3)
}


example(of: "tryMap") {
  enum NameError: Error {
    case tooShort(String)
    case unknown
  }
  let names = ["Marin", "Shai", "Florent"].publisher
  names
    .tryMap { value -> Int in
      let length = value.count
      guard length >= 5 else {
        throw NameError.tooShort(value)
      }

      return value.count
    }
    .sink(
      receiveCompletion: { print("Completed with \($0)") },
      receiveValue: { print("Got value: \($0)") }
    )
}


enum MyError: Error {
  case ohNo
}

example(of: "assertNoFailure") {
  Just("Hello")
    .setFailureType(to: MyError.self)
    .assertNoFailure()
    .sink(receiveValue: { print("Got value: \($0) ")})
    .store(in: &subscriptions)
}


//let subscription = (1...3).publisher
// .print("publisher")
// .sink { _ in }

// Sequence Operators

example(of: "reduce") {
  let publisher = ["Hel", "lo", " ", "Wor", "ld", "!"].publisher
  
  publisher
    .print("publisher")
    .reduce("") { accumulator, value in
      accumulator + value
    }
    .sink(receiveValue: { print("Reduced into: \($0)") })
    .store(in: &subscriptions)
}

//allSatisfy
example(of: "allSatisfy") {
//let publisher = stride(from: 0, to: 5, by: 2).publisher
    let publisher = stride(from: 0, to: 5, by: 1).publisher

publisher
  .print("publisher")
  .allSatisfy { $0 % 2 == 0 }
  .sink(receiveValue: { allEven in
    print(allEven ? "All numbers are even"
                  : "Something is odd...")
  })
  .store(in: &subscriptions)
}

//contains(where:)
example(of: "contains(where:)") {
  struct Person {
    let id: Int
    let name: String
  }

  let people = [
    (123, "Shai Mishali"),
    (777, "Marin Todorov"),
    (214, "Florent Pillet")
  ]
  .map(Person.init)
  .publisher

  people
    .contains(where: { $0.id == 800 || $0.name == "Marin Todorov" })
//    .contains(where: { $0.id == 800 })
    .sink(receiveValue: { contains in
      // 4
      print(contains ? "Criteria matches!"
                     : "Couldn't find a match for the criteria")
    })
    .store(in: &subscriptions)
}

//contains
example(of: "contains") {
  let publisher = ["A", "B", "C", "D", "E"].publisher
  let letter = "C"

  publisher
    .print("publisher")
    .contains(letter)
    .sink(receiveValue: { contains in
      print(contains ? "Publisher emitted \(letter)!"
                     : "Publisher never emitted \(letter)!")
    })
    .store(in: &subscriptions)
}

example(of: "count") {
  let publisher = ["A", "B", "C"].publisher

  publisher
    .print("publisher")
    .count()
    .sink(receiveValue: { print("I have \($0) items") })
    .store(in: &subscriptions)
}

example(of: "output(in:)") {
  let publisher = ["A", "B", "C", "D", "E"].publisher

  publisher
    .output(in: 1...3)
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print("Value in range: \($0)") })
    .store(in: &subscriptions)
}

example(of: "output(at:)") {
  let publisher = ["A", "B", "C"].publisher
  publisher
    .print("publisher")
    .output(at: 1)
    .sink(receiveValue: { print("Value at index 1 is \($0)") })
    .store(in: &subscriptions)
}


example(of: "last") {
  let publisher = ["A", "B", "C"].publisher

  publisher
    .print("publisher")
    .last()
    .sink(receiveValue: { print("Last value is \($0)") })
    .store(in: &subscriptions)
}

example(of: "first(where:)") {
  let publisher = ["J", "O", "H", "N"].publisher

  publisher
    .print("publisher")
    .first(where: { "Hello World".contains($0) })
    .sink(receiveValue: { print("First match is \($0)") })
    .store(in: &subscriptions)
}

//first
example(of: "first") {
  let publisher = ["A", "B", "C"].publisher

  publisher
    .print("publisher")
    .first()
    .sink(receiveValue: { print("First value is \($0)") })
    .store(in: &subscriptions)
}

// max
example(of: "max") {
  let publisher = ["A", "F", "Z", "E"].publisher
  publisher
    .print("publisher")
    .max()
    .sink(receiveValue: { print("Highest value is \($0)") })
    .store(in: &subscriptions)
}

// min non-Comparable
example(of: "min non-Comparable") {
  let publisher = ["12345",
                   "ab",
                   "hello world"]
    .map { Data($0.utf8) } // [Data]
    .publisher // Publisher<Data, Never>

  publisher
    .print("publisher")
    .min(by: { $0.count < $1.count })
    .sink(receiveValue: { data in
      let string = String(data: data, encoding: .utf8)!
      print("Smallest data is \(string), \(data.count) bytes")
    })
    .store(in: &subscriptions)
}

// min
example(of: "min") {
  let publisher = [1, -50, 246, 0].publisher

  publisher
    .print("publisher")
    .min()
    .sink(receiveValue: { print("Lowest value is \($0)") })
    .store(in: &subscriptions)
}
