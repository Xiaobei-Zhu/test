//
//  CountryInformationDetailMockServer.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2021/1/10.
//

import UIKit
import Alamofire
class CountryDetailMockServer {
   
    static let sharedInstance = CountryDetailMockServer()
//
//    var country: Array<NSDictionary>?
    
    func getCountryDetail(countryName: String, _ completion: @escaping ([String:[String: Int]]) -> Void) {
        Alamofire.request("http://localhost:3001/rest/v1/path/product/countries").responseJSON { (DataResponse) in
            if let json = DataResponse.result.value{
                // NSData->NSDictonary
                let data = try? JSONSerialization.data(withJSONObject: json, options: [])
                let dic = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//                print("xxxxxxxx \(dic)")
//                print("sssdsadasd=====\(dic?.value(forKey: countryName))")
                if let country = dic?.value(forKey: countryName) as? [String:[String: Int]] {
                    completion(country)
//                    print("xiaobei \(country)")
                }else{
//                    print("xiaobeibei")
                }
//               
            }
        }
    }

   
}
