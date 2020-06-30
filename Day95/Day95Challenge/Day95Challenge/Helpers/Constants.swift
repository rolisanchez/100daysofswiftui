//
//  Constants.swift
//  Day95Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/29/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import Foundation

enum DiceType: String, CaseIterable {
    case FourSided = "4-Sided"
    case SixSided = "6-Sided"
    case EightSided = "8-Sided"
    case TenSided = "10-Sided"
    case TwelveSided = "12-Sided"
    case TwentySided = "20-Sided"
    case HundredSided = "100-Sided"
}

let DiceLimits: [DiceType: Int] = [
    .FourSided: 4,
    .SixSided: 6,
    .EightSided: 8,
    .TenSided: 10,
    .TwelveSided: 12,
    .TwentySided: 20,
    .HundredSided: 100
]
