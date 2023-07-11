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

extension NotifyItem: Identifiable {
  
}

class NotifyItemProvider: ObservableObject {
    @Published private(set) var items: [NotifyItem] = []
    func fetch(combine: Bool) {
        let diskItems = NotifyItemModelService.allNotifyItems()
        if combine {
            items.append(contentsOf: diskItems)
        } else {
            items = diskItems
        }
        print("fetched items \(diskItems)")
    }

    func addItem(title: String, message: String, repeatInterval: UInt64) {
        items.append(NotifyItem(title: title, message: message, repeatInterval: repeatInterval))
    }

    func deleteItem(item: NotifyItem) {
        items.removeAll { item1 in
            item1 == item
        }
    }

    func writeItem() {
        NotifyItemModelService.writeToFile(items)
    }

    func addDummy() {
        items.append(NotifyItem(title: "Item0", message: "Message0", repeatInterval: 10))
        items.append(NotifyItem(title: "Item1", message: "Message1", repeatInterval: 10))
    }
}
