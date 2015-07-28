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
    var bullet = SKNode()
    var speedR = CGVectorMake(0.3, 0)
    var speedL = CGVectorMake(-0.3, 0)
    var damage : Double = 1
    func fire() {
        // this has to put a node in the scene which is hard becasue the scene is a different file
        // I could make the input an SKScene and put self in for the other file
        // GameScene.addChild(bullet) something like this?
    }
}
class Rifle : Weapon {
    var bullet = SKNode()
    var speedR = CGVectorMake(5.0,0)
    var speedL = CGVectorMake(-5.0,0)
    var damage : Double = 2
    func fire() {}
}
protocol Weapon {
    // var bullet : SKNode {get}
    var speedR : CGVector {get}
    var speedL : CGVector {get}
    func fire()
    var damage : Double {get set}
}