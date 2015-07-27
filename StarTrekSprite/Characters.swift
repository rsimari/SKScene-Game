//
//  Characters.swift
//  StarTrekSprite
//
//  Created by Robert Simari on 7/13/15.
//  Copyright (c) 2015 SimScript. All rights reserved.
//

// Playground - noun: a place where people can play

// Star Trek based game

// Humans are given a default weapon (goes first i.e. advantage)
// Aliens may choose weapon and Race (chooses weapon i.e. advantage)
// once you defeat an enemy you may be able to pick up their weapon (less dmg?)
// You may rename your Lifeform

// make it turn based? human can go when turn = false, aliens when turn = true

// making characters unique (replace class Alien with races)

// possible moves : Shields Up!, Shoot, Regenerate (unique), Change Weapon,
// Charge Weapon, dodge and fire ( 50/50 hit and dodge )


import UIKit
import Foundation
import SpriteKit


class Human : SKShapeNode, Player { // this only should add properties/methods that dont already exist
    var life : Double = 10
    var direction : Bool = true
   
    override init() {
        super.init()
        // initalize the SKShapeNode parts of Human() here
        self.strokeColor = SKColor.whiteColor()
        var rect = CGRect(origin: CGPointZero, size: CGSize(width: 30, height: 30))
        self.path = CGPathCreateWithRect(rect, nil)
        self.position = CGPoint(x: 100,y: 100)
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 30, height: 30))
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.dynamic = true
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func jump() {
        self.physicsBody?.applyImpulse(CGVectorMake(0.0, 15.0))
    }
    func moveRight() {
        let moveR = SKAction.moveByX(30, y: 0, duration: 0.5)
        self.runAction(moveR) // or shape?
    }
    func moveLeft() {
        let moveL = SKAction.moveByX(-30, y: 0, duration: 0.5)
        self.runAction(moveL)
    }
    func takeDamage(damage: Double) {
        life-=damage
    }
    var weapon : Weapon = Phaser()
    func shootWeapon () {
        weapon.fire()
    }
}
protocol Weapon {
   // var bullet : SKNode {get}
    var speedR : CGVector {get}
    var speedL : CGVector {get}
    func fire()
    var damage : Double {get set}
}
protocol Player {
    var life : Double {get set}
   
    var direction : Bool {get}
    func takeDamage(damage: Double)
    func moveRight()
    func moveLeft()
    func jump()
}
class Phaser : Weapon {
    var bullet = SKNode()
    var speedR = CGVectorMake(0.3, 0)
    var speedL = CGVectorMake(-0.3, 0)
    var damage : Double = 1
    func fire() {
        // this has to put a node in the scene which is hard becasue the scene is a different file
        // I could make the input an SKScene and put self in for the other file
    }
}
class Rifle : Weapon {
    var bullet = SKNode()
    var speedR = CGVectorMake(5.0,0)
    var speedL = CGVectorMake(-5.0,0)
    var damage : Double = 2
    func fire() {}
}











