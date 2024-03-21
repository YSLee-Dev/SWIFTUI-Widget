//
//  ContentView.swift
//  SWIFTUI_Widget
//
//  Created by 이윤수 on 3/11/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @State var tfText: String = ""
    @State var userSaveWord: [String] = []
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    TextField("저장하고 싶은 값을 입력하세요.", text: $tfText)
                    Button(action: {
                        guard self.tfText != "",
                              !self.userSaveWord.contains(self.tfText) else {return}
                        self.userSaveWord.append(tfText)
                        self.tfText = ""
                        UserDefaults.shareD.setValue(self.userSaveWord, forKey: "SaveWords")
                        WidgetCenter.shared.reloadAllTimelines()
                        
                    }, label: {
                       Text("저장")
                    })
                }
                .padding(.vertical, 20)
                
                Text("저장된 값")
                ForEach(userSaveWord,id: \.self) {
                    Text($0)
                }
            }
            .padding()
        }
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
            
            guard let saveWords = UserDefaults.shareD.object(forKey: "SaveWords") as? [String] else {return}
            
            self.userSaveWord = saveWords
        }
    }
}

#Preview {
    ContentView()
}
