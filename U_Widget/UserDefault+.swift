//
//  UserDefault+.swift
//  SWIFTUI_Widget
//
//  Created by 이윤수 on 3/21/24.
//

import Foundation

extension UserDefaults {
    static var shareD: UserDefaults {
        let id = "group.com.SWIFTUI-Widget"
        return UserDefaults(suiteName: id)!
    }
}
