//
//  NotifyItemViewModel.swift
//  EyeProtect
//
//  Created by Feiyu Xia on 2023/6/28.
//

import Foundation

class NotifyItemViewModel: ObservableObject {
    @Published var isActive: Bool = false
    @Published var showAlert: Bool = false
    @Published var remainingTime: Int64 = 0

    private var item: NotifyItem
    private var timer: Timer?


    var title: String {
        get {
            return item.title
        }
    }

    var message: String {
        get {
            return item.message
        }
    }

    var repeatInterval: UInt64 {
        get {
            return item.repeatInterval
        }
    }

    init(item: NotifyItem) {
        self.item = item
    }
    func startTimer() {
        stopTimer() // stop previous one
        remainingTime = Int64(item.repeatInterval)
        self.timer = Timer(timeInterval: 1, repeats: true, block: { [weak self] timer in
            self?.remainingTime -= 1
            if let remainingTime = self?.remainingTime, remainingTime <= 0 {
                self?.showAlert = true
                self?.timer?.invalidate()
                self?.timer = nil
                self?.remainingTime = 0
            }
        })
        RunLoop.main.add(self.timer!, forMode: .common)
    }

    func stopTimer() {
        guard let timer = self.timer else {
            return
        }
        timer.invalidate()
        self.timer = nil
        remainingTime = 0
    }
}
