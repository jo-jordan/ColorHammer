//
//  LocalStorage.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/31.
//

import UIKit

enum DefaultKey: String {
    case PreferredFontNameKey = ""
}

class LocalStorage {
    static let storage = UserDefaults()
    
    static func setValue(for key: DefaultKey, value: Any?) {
        storage.set(value, forKey: key.rawValue)
    }
    
    static func getValue(for key: DefaultKey) -> Any? {
        return  storage.value(forKey: key.rawValue)
    }
}
