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
class PowerUp : SKSpriteNode {
    // needs timer and spawn stuffy stuff
    init(color : SKColor, position : CGPoint) {
        super.init()
        self.position = position
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 10, height: 10))
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.affectedByGravity = false
        self.alpha = 0.2
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/*
powerUp = SKSpriteNode(color: SKColor.yellowColor(), size: powerUpSize)
powerUp.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
powerUp.physicsBody = SKPhysicsBody(rectangleOfSize: powerUpSize)
powerUp.physicsBody?.categoryBitMask = PhysicsCategory.powerUp
powerUp.physicsBody?.collisionBitMask = 0
if powerUpCount <= 1 {
    powerUp.physicsBody?.contactTestBitMask = PhysicsCategory.human
} else {
    powerUp.physicsBody?.contactTestBitMask = 0
}
powerUp.physicsBody?.allowsRotation = true
powerUp.physicsBody?.affectedByGravity = false
powerUp.runAction(SKAction.repeatActionForever(rotateAction))
powerUp.alpha = 0.2
*/