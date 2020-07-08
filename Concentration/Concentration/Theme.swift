//
//  Theme.swift
//  Memorygame
//
//  Created by Adam on 07/07/2020.
//  Copyright © 2020 Adam, Krystian. All rights reserved.
//

import Foundation

class Theme
{
    enum Theme: UInt32 {
        case halloween
        case love
        case animal
        case waterCreatures
        case plants
        case weather
    }
    
    func getThemeIcons(by theme: Theme) -> [String] {
        switch theme {
        case .halloween:
            return ["👻", "😈", "👹", "👺", "🎃", "☠️", "🦇", "💀"]
        case .love:
            return ["💕","💋", "💌", "💘", "❤️", "💓", "💖", "💔"]
        case .animal:
            return ["🐶", "🐒", "🐔", "🦊", "🦉", "🐭", "🐥", "🦎"]
        case .waterCreatures:
            return ["🦑", "🐙", "🐠", "🐡", "🐳", "🐚", "🦀", "🦈"]
        case .plants:
            return ["🍁", "🍄", "🌹", "💐", "🌾", "🌸", "🌺", "🌻"]
        case .weather:
            return ["🔥", "❄️", "☀️", "💦", "☔️", "🌬", "☁️", "🌪", "⛈"]
        }
    }
        
    func random() -> Theme {
        let max = Theme.weather.rawValue
        let randomIndex = arc4random_uniform(max + UInt32(1))
        return Theme(rawValue: randomIndex) ?? Theme.halloween
    }
    
    func getRandomThemeIcons() ->[String] {
        return getThemeIcons(by: random())
    }

}


