//
//  StartGameScene.swift
//  StarTrekSprite
//
//  Created by Robert Simari on 7/13/15.
//  Copyright (c) 2015 SimScript. All rights reserved.
//

import UIKit
import SpriteKit

class Arena: SKNode {
    private let characterSize = CGSizeMake(10.0,10.0)
    private let baseAlpha: CGFloat = 1.0
    
    private func spawnCharacter() {
        if let gameScene = self.scene {
            let humanStartPositionY = gameScene.size.height
            let humanStartPositionX = gameScene.size.width - 100
            let humanSpawnPoint = CGPointMake(humanStartPositionX,humanStartPositionY)
            
            let humanCharacter = SKSpriteNode(imageNamed: "sphere")
            humanCharacter.position = humanSpawnPoint
            humanCharacter.size = characterSize
            humanCharacter.alpha = baseAlpha
            
            self.addChild(humanCharacter)
        }
    }
    
    
    
}
