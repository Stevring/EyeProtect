//
//  ContentView.swift
//  EyeProtect
//
//  Created by Feyoe on 2023/6/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 * Model Layer
 * NotifyItem
 *  - Title // string
 *  - RepeatInterval // int (second)
 *  - Message // string
 */
