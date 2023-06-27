//
//  Model.swift
//  EyeProtect
//
//  Created by Feyoe on 2023/6/27.
//

import Foundation

class NotifyItem: Codable, Equatable {
    static func == (lhs: NotifyItem, rhs: NotifyItem) -> Bool {
        return lhs.title == rhs.title && lhs.message == rhs.message && lhs.repeatInterval == rhs.repeatInterval
    }
    
    var title: String
    var message: String
    var repeatInterval: UInt64
    init(title: String, message: String, repeatInterval: UInt64) {
        self.title = title
        self.message = message
        self.repeatInterval = repeatInterval
    }
}
