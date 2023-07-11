//
//  NotifyItemRow.swift
//  EyeProtect
//
//  Created by Feiyu Xia on 2023/6/28.
//

import SwiftUI

struct NotifyItemRow: View {
    @State private var isActive = false
    @ObservedObject var viewModel: NotifyItemViewModel
    var deleteAction: () -> Void
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.title).font(.title)
                Toggle(isOn: $isActive) {
                    Text("")
                }
                .toggleStyle(SwitchToggleStyle())
                .onChange(of: isActive) { active in
                    if active {
                        viewModel.startTimer()
                    } else {
                        viewModel.stopTimer()
                    }
                }
                Text(String(viewModel.remainingTime))
                Button {
                    deleteAction()
                } label: {
                    Image(systemName: "trash")
                }

            }

            HStack {
                Text(viewModel.message).font(.body)
                Text("repeat \(viewModel.repeatInterval)").font(.callout)
            }

        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text(viewModel.title),
                message: Text(viewModel.message),
                dismissButton: .default(Text("Got it!")) {
                    viewModel.startTimer()
                }
            )
        }
    }
}

struct NotifyItemRow_Previews: PreviewProvider {
    static var item = NotifyItem(title: "Item0", message: "ItemContenthhhhhhh", repeatInterval: 3)
    static var previews: some View {
        NotifyItemRow(viewModel: NotifyItemViewModel(item: item)) {
            
        }
    }
}
