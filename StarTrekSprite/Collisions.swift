//
//  Collisions.swift
//  StarTrekSprite
//
//  Created by Robert Simari on 7/28/15.
//  Copyright (c) 2015 SimScript. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    static let none : UInt32 = 0x1 << 1
    static let boundary : UInt32 = 0x1 << 2 // 4
    static let bullet : UInt32 = 0x1 << 3 // 8
    static let alien : UInt32 = 0x1 << 4 // 16
    static let human : UInt32 = 0x1 << 5 // 32
    static let powerUp : UInt32 = 0x1 << 6 // 64
    static let powerUp2 : UInt32 = 0x1 << 7 // 128
}