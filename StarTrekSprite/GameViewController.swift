//
//  GameViewController.swift
//  jk;rba
//
//  Created by Robert Simari on 7/13/15.
//  Copyright (c) 2015 SimScript. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = self.view as SKView
        
        skView.showsFPS = false
        skView.showsNodeCount = true
        
        let scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFit
        
        skView.presentScene(scene)
        
    }

}
