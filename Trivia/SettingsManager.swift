//
//  SettingManger.swift
//  Trivia
//
//  Created by Michael on 25/06/2024.
//

import Foundation


class SettingsManager {
    var settings = Settings(category: .all, difficulty: .all)
    
    static let shared = SettingsManager()
    
    func setSettings(settings: Settings){
        self.settings = settings
    }
    
}
