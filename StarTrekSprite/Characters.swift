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


class Human : SKScene, SKPhysicsContactDelegate, Player {
    var life : Double = 10
    var body = SKNode()
    var shape = SKShapeNode(rectOfSize: CGSize(width: 30, height: 30))
    func takeDamage(damage: Double) {
        life-=damage
    }
    var weapon : Weapon = Phaser()
}
protocol Weapon {
    func fire(target: Player)
}
protocol Player {
    var life : Double {get set}
    var body : SKNode {get}
    var shape : SKShapeNode {get}
    func takeDamage(damage: Double)
}
class Phaser : Weapon {
    func fire(target: Player) {
        target.takeDamage(1)
    }
}
class Rifle : Weapon {
    func fire(target: Player) {
        target.takeDamage(2)
    }
}











