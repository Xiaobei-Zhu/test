//: [Previous](@previous)

import Foundation


let test = [[[1,2,3],[4,5,6]], [[1,3],[5,7]]]
let temp = 4
let test1 = test.forEach { aTest in
    aTest.compactMap { bTest in
        if bTest.contains(temp) {
            print(aTest)
        }
    }
}

