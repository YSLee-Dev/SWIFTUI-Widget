//
//  ContentView.swift
//  SWIFTUI_Widget
//
//  Created by 이윤수 on 3/11/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            WidgetCenter.shared.getCurrentConfigurations { result in
                switch result {
                case .success(let infos):
                    for info in infos {
                        print(info)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
