//
//  Bullet.swift
//  StarTrekSprite
//
//  Created by Robert Simari on 7/28/15.
//  Copyright (c) 2015 SimScript. All rights reserved.
//

import Foundation
import SpriteKit

class defaultBullet : SKNode { // this probably isnt necessary
    override init() {
        super.init()
        // this should simply create the bullet shape and physics properties
        // self.addChild(defaultBullet())
        // var bullets : [SKNode] = []
        // just put addChild(___)?
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
protocol Bullet {
    var shape : SKNode {get}
    
}
