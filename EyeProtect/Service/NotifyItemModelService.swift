//
//  NotifyItemModelService.swift
//  EyeProtect
//
//  Created by Feyoe on 2023/6/27.
//

import Foundation

class NotifyItemModelService {
    var items: [NotifyItem] = []
    func allNotifyItems() -> [NotifyItem] {
        if items.count > 0 {
            return items
        }
        let fileURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("NotifyItemModel").appendingPathExtension("json")
        do {
            let data = try Data(contentsOf: fileURL) // Don't know why FileManager.default.contents(atPath: ) returns nil, but Data(contentsOf:) works fine.
            items = try JSONDecoder().decode([NotifyItem].self, from: data)
        } catch {
            print("Decode failed \(error)")
            items = []
        }
        return items
    }
    
    func writeToFile() {
        do {
            let fileURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("NotifyItemModel").appendingPathExtension("json")
            let data = try JSONEncoder().encode(items)
            try data.write(to: fileURL)
        } catch {
            print("Encode failed \(error)")
        }
    }
}
