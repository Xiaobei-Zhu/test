import UIKit
//类型转换
var str = "Hello, playground"

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
var movieCount = 0
var songCount = 0
for item in library{
    if item  is Movie {
        movieCount += 1
    }else if item is Song {
        songCount += 1
    }
}
print("Media library contains \(movieCount) movies and \(songCount) songs")   //Media library contains 2 movies and 3 songs
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}
//Movie: Casablanca, dir. Michael Curtiz
//Song: Blue Suede Shoes, by Elvis Presley
//Movie: Citizen Kane, dir. Orson Welles
//Song: The One And Only, by Chesney Hawkes
//Song: Never Gonna Give You Up, by Rick Astley
var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}
//zero as an Int
//zero as a Double
//an integer value of 42
//a positive double value of 3.14159
//a string value of "hello"
//an (x, y) point at 3.0, 5.0
//a movie called Ghostbusters, dir. Ivan Reitman
//Hello, Michael
//let optionalNumber: Int? = 3
//things.append(optionalNumber)        // 警告
//things.append(optionalNumber as Any) // 没有警告
//嵌套类型
struct BlackjackCard {
    
    enum Suit: Character {
        //嵌套Suit枚举  扑克牌四种花色，花色符号
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    //嵌套 Rank 枚举 描述扑克牌从Ace~10,J,Q,K
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int,second: Int?
        }
        var values: Values{
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += "value is \(rank.values.first)"
        if let second = rank.values.second {
            output += "or\(second)"
        }
        return output
    }
}
let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("The AceOfSpades: \(theAceOfSpades.description)")   //TheAceOfSpades: suit is ♠,value is 1or11

//引用嵌套类型
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue    //红心符号为“♡“
//方法扩展
extension Int {
    func repetitions(task: () -> Void){
        for _ in 0..<self {
            task()
        }
    }
}
2.repetitions {
    print("Hello!")
}
extension Int{
    mutating func square(){
        self = self * self
    }
}
var someInt = 3
someInt.square()  //9
