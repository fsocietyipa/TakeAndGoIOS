//
//  Decodable+Extension.swift
//  TakeAndGo
//
//  Created by fsociety.3 on 10/22/20.
//

import Foundation

extension Decodable {
  init(from any: Any) throws {
    let data = try JSONSerialization.data(withJSONObject: any)
    self = try JSONDecoder().decode(Self.self, from: data)
  }
}
