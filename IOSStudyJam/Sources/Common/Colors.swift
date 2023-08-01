//
//  Colors.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

enum Colors {
    case gray
    case darkGray

    var color: UIColor {
        switch self {
        case .gray: return UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
        case.darkGray: return UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
        }
    }

    var cgColor: CGColor {
        return self.color.cgColor
    }
}

