//
//  PowerUps.swift
//  StarTrekSprite
//
//  Created by Robert Simari on 7/26/15.
//  Copyright (c) 2015 SimScript. All rights reserved.
//

import Foundation
import SpriteKit

// still need to add this to main class
class PowerUp : SKNode {
    // needs timer and spawn stuffy stuff
    var count : Int = 0 // not sure if this is what i want
    init(color : SKColor, position : CGPoint) {
        super.init()
        var rect = CGRect(origin: CGPointZero, size: CGSize(width: 10, height: 10))
        //self.path = CGPathCreateWithRect(rect, nil)
        //self.s = color
        self.position = position
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 10, height: 10))
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.collisionBitMask = PhysicsCategory.none
        self.alpha = 0.2
        var rotateAction = SKAction.rotateByAngle(3.14159, duration: 2)
        self.runAction(SKAction.repeatActionForever(rotateAction))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

 