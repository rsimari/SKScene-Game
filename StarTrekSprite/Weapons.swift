//
//  Weapons.swift
//  StarTrekSprite
//
//  Created by Robert Simari on 7/27/15.
//  Copyright (c) 2015 SimScript. All rights reserved.
//

import Foundation
import SpriteKit

class Phaser : Weapon {
    var bullet = SKShapeNode()
    var speedR = CGVectorMake(0.3, 0)
    var speedL = CGVectorMake(-0.3, 0)
    var damage : Double = 1
    var size = CGSize(width: 4, height: 2)
    
    func fire(origin : CGPoint, direction : Bool) -> SKShapeNode {
        // this needs to simply create the impulse 
        bullet = SKShapeNode(rectOfSize: size)
        bullet.strokeColor = SKColor.whiteColor()
        bullet.fillColor = SKColor.whiteColor()
        //bullet = SKPhysicsBody(circleOfRadius: CGFloat(4))
        bullet.physicsBody?.affectedByGravity = false
        bullet.physicsBody?.categoryBitMask = PhysicsCategory.bullet // this would be alot better if Physics Category struct was in all files but whatevs yo
        bullet.physicsBody?.collisionBitMask = 0
        bullet.physicsBody?.contactTestBitMask = PhysicsCategory.alien
        
        if direction { // this is sloppy I should be able to take it right from Human properties? right? idk
            bullet.physicsBody?.applyImpulse(speedR)
        } else {
            bullet.physicsBody?.applyImpulse(speedL)
        }
     return bullet
        // my weapon no shootsies oopsies
    }
}
class Rifle : Weapon {
    var bullet = SKShapeNode()
    var speedR = CGVectorMake(5.0,0)
    var speedL = CGVectorMake(-5.0,0)
    var damage : Double = 2
    var size = CGSize(width: 4, height: 4)
    func fire(origin : CGPoint, direction : Bool) -> SKShapeNode { return bullet}
}
protocol Weapon {
    var bullet : SKShapeNode {get}
    var speedR : CGVector {get}
    var speedL : CGVector {get}
    var damage : Double {get set}
    var size : CGSize {get}
    func fire(origin : CGPoint, direction : Bool) -> SKShapeNode
}