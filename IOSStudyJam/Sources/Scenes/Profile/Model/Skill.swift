//
//  Skill.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import Foundation

struct Skill {
    let name: String
}

extension Skill {
    static func createMockData() -> [Skill] {
        ["MVI/MVVM", "Kotlin Coroutines", "Room", "OkHttp"].map { Skill(name: $0) }
    }
}
