//
//  AppSettings.swift
//  Day95Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/29/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefault<T: Codable> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            // Enables objects. Not only Strings and Ints
            guard let value = UserDefaults.standard.data(forKey: key) else {
                return defaultValue
            }
            let decoder = JSONDecoder()
            guard let decoded = try? decoder.decode(T.self, from: value) else {
                return defaultValue
            }
            return decoded
        }
        set {
            // Enables objects. Not only Strings and Ints
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
}

final class AppSettings: ObservableObject {
    private enum SettingKey: String {
        case chosenDice
    }
    
    let objectWillChange = ObservableObjectPublisher()
    
    @UserDefault(SettingKey.chosenDice.rawValue, defaultValue: DiceType.SixSided.rawValue)
    var chosenDice: String {
        willSet {
            objectWillChange.send()
        }
    }
}
