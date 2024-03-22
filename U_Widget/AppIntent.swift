//
//  AppIntent.swift
//  U_Widget
//
//  Created by 이윤수 on 3/12/24.
//

import WidgetKit
import AppIntents

enum FavoriteAnimal: String, AppEnum {
    case dog, cat,rabbit
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "FavoriteAnimal"
    static var caseDisplayRepresentations: [FavoriteAnimal : DisplayRepresentation] = [
        .dog: "🐶",
        .cat: "🐱",
        .rabbit: "🐰"
    ]
}

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var intentClassName: String = "ConfigurationAppIntent"
    
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
    
    @Parameter(title: "User Text", default: "Hello")
    var userText: String
    
    @Parameter(title: "Favorite Animal")
    var favoriteAnimal: FavoriteAnimal
    
    @Parameter(title: "Save Words", optionsProvider: UserSaveWords())
    var saveWords: String?
}

struct UserSaveWords: DynamicOptionsProvider {
    func results() async throws -> [String] {
        guard let words = UserDefaults(suiteName: "group.com.SWIFTUI-Widget")!.object(forKey: "SaveWords") as? [String] else {return ["NOTLOADING"] }
        return words
    }
    
    typealias Result = [String]
}
