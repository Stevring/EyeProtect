//
//  NotifyItemModelService.swift
//  EyeProtect
//
//  Created by Feyoe on 2023/6/27.
//

import Foundation

class NotifyItemModelService {
    static func allNotifyItems() -> [NotifyItem] {
        let fileURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("NotifyItemModel").appendingPathExtension("json")
        do {
            let data = try Data(contentsOf: fileURL) // Don't know why FileManager.default.contents(atPath: ) returns nil, but Data(contentsOf:) works fine.
            return try JSONDecoder().decode([NotifyItem].self, from: data)
        } catch {
            print("Decode failed \(error)")
            return []
        }
    }
    
    static func writeToFile(_ items: [NotifyItem]) {
        do {
            let fileURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("NotifyItemModel").appendingPathExtension("json")
            let data = try JSONEncoder().encode(items)
            try data.write(to: fileURL)
        } catch {
            print("Encode failed \(error)")
        }
    }
}
