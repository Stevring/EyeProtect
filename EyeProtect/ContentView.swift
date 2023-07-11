//
//  ContentView.swift
//  EyeProtect
//
//  Created by Feyoe on 2023/6/27.
//

import SwiftUI

struct ContentView: View {
    @StateObject var itemProvider = NotifyItemProvider()

    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    List(itemProvider.items) { item in
                        NotifyItemRow(viewModel: NotifyItemViewModel(item: item)) {
                            itemProvider.deleteItem(item: item)
                        }
                    }
                } label: {
                    Text("Current")
                }
                NavigationLink {
                    AddNewItem(provider: itemProvider)
                } label: {
                    Text("Add")
                }
            }
            .onAppear {
                itemProvider.fetch(combine: false)
            }
            .onDisappear {
                itemProvider.writeItem()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
