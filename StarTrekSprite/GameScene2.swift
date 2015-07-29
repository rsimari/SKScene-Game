//
//  GameScene2.swift
//  StarTrekSprite
//
//  Created by Robert Simari on 7/26/15.
//  Copyright (c) 2015 SimScript. All rights reserved.
//

//
//  GameScene.swift
//  StarTrekSprite
//
//  Created by Robert Simari on 7/13/15.
//  Copyright (c) 2015 SimScript. All rights reserved.
//
// add a timer so you cant just rapid fire
// weapon struct?
// add life/dmg system and display in label
// multiple power ups at once? stack them... may need to make them smaller though or side by side (how many?)

// make a deflector shield
// 10 seconds after power up is removed make another?
// after you shoot go back to no fill
// !!!something wrong with the removal of buttons!!!!
// i cant tell which way im facing bro
// load buttons? have color rise till top and then able to shoot -> if buttonfilled = true -> able to shoot
// make empty circles above the main UI and have them filled when you pick up a powerup
// if you get all 3 powerups you can use a huge attack (execute?)

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    func didBeginContact(contact: SKPhysicsContact) {
        var contactItem1 : SKPhysicsBody
        var contactItem2 : SKPhysicsBody
        // identify the two nodes colliding
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            contactItem1 = contact.bodyA
            contactItem2 = contact.bodyB
        } else {
            contactItem1 = contact.bodyB
            contactItem2 = contact.bodyA
        }
        if ((contactItem1.categoryBitMask == PhysicsCategory.bullet) && (contactItem2.categoryBitMask == PhysicsCategory.alien)) {
            contactItem1.node!.removeFromParent()
            // when alien and bullet collide
            // this does affect the alien's velocity
            //explosion(contactItem2)
        }
        if ((contactItem1.categoryBitMask == PhysicsCategory.human) && (contactItem2.categoryBitMask == PhysicsCategory.powerUp)) {
            // should pick the right spot to put the button
            powerUpCount++
            println(powerUpCount)
            humanCharacter.alpha = 0.2
            humanCharacter.strokeColor = SKColor.yellowColor() // turns human yellow
            specialButton = SKSpriteNode(color: SKColor.yellowColor(), size: CGSize(width: 110, height: 20)) // add special button to UI
            specialButton.alpha = 0.2
            if buttonFill == true {
                specialButton.position = CGPoint(x: self.frame.maxX - 80, y: 120)
            } else {
                specialButton.position = CGPoint(x: self.frame.maxX - 80, y: 92)
                buttonFill = true
            }
            self.addChild(specialButton)
            contactItem2.node!.removeFromParent() // removes powerup
            timer = NSTimer.scheduledTimerWithTimeInterval(8, target: self, selector: ("PowerUp"), userInfo: nil, repeats: false)
            // start timer? ie cant last forever
        }
        if ((contactItem1.categoryBitMask == PhysicsCategory.human) && (contactItem2.categoryBitMask == PhysicsCategory.powerUp2)) {
            // should pick the right spot to put the button
            powerUpCount++
            println(powerUpCount)
            humanCharacter.alpha = 0.2
            humanCharacter.strokeColor = SKColor.orangeColor() // turns human yellow
            specialButton2 = SKSpriteNode(color: SKColor.orangeColor(), size: CGSize(width: 110, height: 20)) // add special button to UI
            specialButton2.alpha = 0.2
            // if place below it is full already put above it
            if buttonFill == true {
                specialButton2.position = CGPoint(x: self.frame.maxX - 80, y: 120)
            } else {
                specialButton2.position = CGPoint(x: self.frame.maxX - 80, y: 92)
                buttonFill = true
            }
            self.addChild(specialButton2)
            contactItem2.node!.removeFromParent() // removes powerup
            timer2 = NSTimer.scheduledTimerWithTimeInterval(8, target: self, selector: ("PowerUp2"), userInfo: nil, repeats: false)
            // start timer? ie cant last forever
        }
    }
    func didEndContact(contact: SKPhysicsContact) {
        // happens everytime
    }
    /*
    func explosion(victim:SKPhysicsBody) {
    let victim = SKNode()
    shrapnel.position = victim.position
    let shrapnelSize = CGSize(width: 2, height: 2)
    let shrapnelImpulse = CGVectorMake(0, 1)
    shrapnel.physicsBody = SKPhysicsBody(rectangleOfSize: shrapnelSize)
    shrapnel.physicsBody?.applyImpulse(shrapnelImpulse)
    }
    */
    
    var moveLeftButton : SKNode!
    var moveRightButton : SKNode!
    var jumpButton : SKNode!
    var shootButton : SKNode!
    var specialButton : SKNode!
    var specialButton2 : SKNode!
    var buttonFill : Bool = false
    
    var powerUp : SKNode!
    var powerUp2 : SKNode!
    var humanDirection : Bool = true
    var timer : NSTimer!
    var timer2 : NSTimer!
    var currentPosition : CGPoint!
    var powerUpCount : Double = 0
    
    var bullet1 = SKShapeNode(rectOfSize: CGSize(width: 10, height: 10))
    var bullet2 = SKShapeNode(rectOfSize: CGSize(width: 2, height: 10))
    
    var humanCharacter = Human()
    var powerUpYellow = PowerUp(color: SKColor.yellowColor(), position: CGPoint(x: 200, y: 200))
    
    var alienCharacter = SKShapeNode(rectOfSize: CGSize(width: 30, height: 30))
    
    override func didMoveToView(view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        self.scene?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        // gravity duh
        self.physicsWorld.gravity = CGVectorMake(0, -5)
        
        // boundary
        let sceneBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        sceneBody.friction = 2
        self.physicsBody?.dynamic = false
        self.physicsBody?.categoryBitMask = PhysicsCategory.boundary
        self.physicsBody?.collisionBitMask = PhysicsCategory.none
        self.physicsBody?.contactTestBitMask = PhysicsCategory.none
        self.physicsBody = sceneBody
        
        // characters
        
        self.addChild(humanCharacter)
        self.addChild(powerUpYellow)
        // alien
        alienCharacter.position = CGPoint(x: 400,y:100)
        alienCharacter.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 30, height: 31))
        alienCharacter.strokeColor = SKColor.greenColor()
        alienCharacter.physicsBody?.affectedByGravity = true
        alienCharacter.physicsBody?.dynamic = true
        alienCharacter.physicsBody?.categoryBitMask = PhysicsCategory.alien
        alienCharacter.physicsBody?.collisionBitMask = PhysicsCategory.boundary | PhysicsCategory.bullet
        alienCharacter.physicsBody?.contactTestBitMask = PhysicsCategory.bullet
        self.addChild(alienCharacter)
    
        
        // move buttons
        moveLeftButton = SKSpriteNode(color: SKColor.greenColor(), size: CGSize(width: 40, height: 25))
        moveLeftButton.position = CGPoint(x: 40, y: 50)
        moveLeftButton.alpha = 0.2
        moveRightButton = SKSpriteNode(color: SKColor.greenColor(), size: CGSize(width: 40, height: 25))
        moveRightButton.position = CGPoint(x: 90, y: 50)
        moveRightButton.alpha = 0.2
        self.addChild(moveLeftButton)
        self.addChild(moveRightButton)
        
        // jump button
        jumpButton = SKSpriteNode(color: SKColor.blueColor(), size: CGSize(width: 50, height: 50))
        jumpButton.position = CGPoint(x: self.frame.maxX - 50, y: 50)
        jumpButton.alpha = 0.2
        self.addChild(jumpButton)
        
        // shoot button
        shootButton = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 50, height: 50))
        shootButton.position = CGPoint(x: self.frame.maxX - 110, y: 50)
        shootButton.alpha = 0.2
        self.addChild(shootButton)
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            if jumpButton.containsPoint(location) {
                // makes character jump
                humanCharacter.physicsBody?.applyImpulse(CGVectorMake(0.0, 15.0))
            }
            if shootButton.containsPoint(location) {
                // shoots bullet (node)
                // makes sure the character shoots in the correct direction
                // will need to check for weapon duh
                if humanCharacter.direction {
                    currentPosition = CGPoint(x: humanCharacter.position.x + 6, y: humanCharacter.position.y)
                } else {
                    currentPosition = CGPoint(x: humanCharacter.position.x - 6, y: humanCharacter.position.y)
                }
                humanCharacter.weapon.fire(currentPosition, direction: humanCharacter.direction)
            
                humanCharacter.fillColor = SKColor.blackColor()
            }
            if moveLeftButton.containsPoint(location) {
                humanCharacter.moveLeft()
                // to get them facing and shooting the right way
            }
            if moveRightButton.containsPoint(location) {
                humanCharacter.moveRight()
            }
            if specialButton != nil { // button isnt created at didLoad so I keep a check in here to prevent in from erroring
                if specialButton.containsPoint(location) {
                    // do special stuff of course
                    // depending on your color you do different stuff
                    powerUpCount--
                   // bullet.physicsBody = SKPhysicsBody(rectangleOfSize: bulletSize1)
                    humanCharacter.strokeColor = SKColor.yellowColor()
                    if humanCharacter.direction == true {
                        bullet1.position = CGPoint(x: humanCharacter.position.x + 6, y: humanCharacter.position.y)
                        self.addChild(bullet1)
                       // bullet.physicsBody?.applyImpulse(bulletSpeedR1)
                        specialButton.removeFromParent()
                    } else {
                        bullet2.position = CGPoint(x: humanCharacter.position.x - 6, y: humanCharacter.position.y)
                        self.addChild(bullet2)
                       // bullet.physicsBody?.applyImpulse(bulletSpeedL1)
                        // increases bullet size woohoo!
                        // gives one shot
                        specialButton.removeFromParent()
                    }
                }
            }
            if specialButton2 != nil { // button isnt created at didLoad so I keep a check in here to prevent in from erroring
                if specialButton2.containsPoint(location) {
                    // do special stuff of course
                    // depending on your color you do different stuff
                    powerUpCount--
                 //   bullet.physicsBody = SKPhysicsBody(rectangleOfSize: bulletSize2)
                    humanCharacter.strokeColor = SKColor.orangeColor()
                    if humanCharacter.direction == true {
                 //       bullet.position = CGPoint(x: humanCharacter.position.x + 6, y: humanCharacter.position.y)
                        
                        specialButton2.removeFromParent()
                    } else {
                   //     bullet.position = CGPoint(x: humanCharacter.position.x - 6, y: humanCharacter.position.y)
                        
                        specialButton2.removeFromParent()
                    }
                }
            }
        }
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}


