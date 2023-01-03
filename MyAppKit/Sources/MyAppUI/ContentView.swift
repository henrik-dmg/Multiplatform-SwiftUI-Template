//
//  ContentView.swift
//  MyApp
//
//  Created by Henrik Panhans on 03.01.23.
//

import SwiftUI

public struct ContentView: View {

    public init() {}

    public var body: some View {
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
