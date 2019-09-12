//
//  GetIngredient.swift
//  AllgernDetector
//
//  Created by Yangfan Chang on 2019/8/21.
//  Copyright © 2019 Yangfan Chang. All rights reserved.
//

import Foundation
import UIKit


class GetAllergen{
    
    func GetAllergenInfo(Barcode: String, completion:  @escaping (String) -> ()){
        let url = URL(string: "https://www.woolworths.com.au/apis/ui/Search/products")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let payload: [String : Any] = [
            "Filters": "[]",
            "IsSpecial": "false",
            "Location": "/shop/search/products?searchTerm=" + Barcode,
            "PageNumber": "1",
            "PageSize": "24",
            "SearchTerm": Barcode,
            "SortType": "TraderRelevance"
        ]
        request.httpBody = payload.percentEscaped().data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,let jsonString = String(data: data, encoding: String.Encoding.utf8), error == nil {
                completion(jsonString)
            } else {
                print("error=\(error!.localizedDescription)")
            }
        }
        task.resume()
    }
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
