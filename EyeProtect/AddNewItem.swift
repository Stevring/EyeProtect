//
//  AddNewItem.swift
//  EyeProtect
//
//  Created by Feiyu Xia on 2023/6/28.
//

import SwiftUI

struct AddNewItem: View {
    @ObservedObject var provider: NotifyItemProvider
    @State var title: String = ""
    @State var message: String = ""
    @State var repeatInterval: String = ""
    var body: some View {
        List{
            TextField("Title", text: $title)
            TextField("Message", text: $message)
            TextField("RepeatInterval", text: $repeatInterval)
            Button {
                provider.addItem(title: title, message: message, repeatInterval: UInt64(repeatInterval) ?? 0)
            } label: {
                Text("Submit")
            }

        }
    }
}

struct AddNewItem_Previews: PreviewProvider {
    static var provider = NotifyItemProvider()
    static var previews: some View {
        AddNewItem(provider: provider)
    }
}
