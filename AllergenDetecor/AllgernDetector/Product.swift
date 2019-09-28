//
//  Product.swift
//  AllgernDetector
//
//  Created by Yangfan Chang on 2019/9/28.
//  Copyright © 2019 Yangfan Chang. All rights reserved.
//

import Foundation

struct Product
{
    let id: String
}

extension Product: JSONDecodable
{
    init(_ decoder: JSONDecoder) throws {
        self.id = try decoder.value(forKey: "id")
    }
}
