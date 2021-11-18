//
//  MockServer.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2020/12/31.
//

import UIKit
import Alamofire

class MockServer {
    static func verifyEmail(_ emailAddress: String) -> Bool {
        return true
    }
    static func verifyPassword(_ password: String) -> Bool {
        return true
    }
    
    static let sharedInstance = MockServer()
//
//    var country: Array<NSDictionary>?
    
    func getCountry(_ completion: @escaping ([[String: String]]) -> Void) {
        Alamofire.request("http://localhost:3001/rest/v1/product/countries").responseJSON { (DataResponse) in
            if let json = DataResponse.result.value{
                // NSData->NSDictonary
                let data = try? JSONSerialization.data(withJSONObject: json, options: [])
                let dic = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if let country = dic?.value(forKey: "country") as? [[String: String]] {
                    completion(country)
//                    print("xiaobei \(country)")
                } else {
                    completion(Array())
//                    print("xiaobeibei \( completion(Array()))")
                }
            }
        }
    }

   
}
