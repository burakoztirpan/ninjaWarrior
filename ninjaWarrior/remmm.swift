//
//  PlayScene.swift
//  myFirstGame
//
//  Created by Burak Öztırpan on 12.03.2015.
//  Copyright (c) 2015 Burak Öztırpan. All rights reserved.
//

import SpriteKit

class PlayScene: SKScene,SKPhysicsContactDelegate {
    
    let ground = SKSpriteNode(imageNamed:"ground")
    
    
    let textureAtlas = SKTextureAtlas(named:"run.atlas")
    var currentTexture = 0
    var hero: SKSpriteNode!
    var box : SKSpriteNode!
    
    
    var origGroundPositionX = CGFloat(0)
    var maxBarX = CGFloat(0)
    var groundSpeed = 5
    var test = 1
    
    
    override func didMoveToView(view: (SKView!)) {
        self.backgroundColor = UIColor.blueColor()
        
        self.ground.anchorPoint = CGPointMake(0, 0.5)
        self.ground.size = CGSizeMake(self.frame.size.width+100,self.ground.size.height)
        self.ground.position = CGPointMake(
            CGRectGetMinX(self.frame),
            CGRectGetMinY(self.frame) + (self.ground.size.height/2))
        self.addChild(self.ground)
        self.origGroundPositionX = self.ground.position.x
        self.maxBarX = self.ground.size.width - self.frame.size.width
        self.maxBarX *= -1
        
        
        self.ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: self.ground.size.width, height: self.ground.size.height/2))
        self.ground.physicsBody?.dynamic = false
        
        hero = SKSpriteNode(texture:textureAtlas.textureNamed("frame1"))
        hero.size = CGSizeMake(self.frame.size.width/20,self.frame.size.height/10)
        hero.position = CGPointMake(self.ground.position.x+30,self.ground.position.y+self.ground.size.height)
        hero.physicsBody = SKPhysicsBody(circleOfRadius: hero.size.height / 2.75)
        hero.physicsBody?.dynamic = true
        
        self.addChild(hero)
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -2)
        
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches
        {
            self.hero.physicsBody?.velocity = CGVectorMake(0, 5)
            self.hero.physicsBody?.applyImpulse(CGVectorMake(0, 4))
        }
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        //BOX
        
        
        if(test == 100){
            box = SKSpriteNode(imageNamed: "test")
            box.position = CGPointMake(self.ground.position.x+490,self.ground.position.y+self.ground.size.height)
            box.size = CGSizeMake(self.frame.size.width/20,self.frame.size.height/10)
            self.addChild(box)
            test = 0
            println("ekle")
        }
        ++test
        
        
        //Ground
        if self.ground.position.x <= maxBarX {
            self.ground.position.x = self.origGroundPositionX
        }
        
        hero.texture = textureAtlas.textureNamed("frame\(currentTexture)")
        //move screen animations
        ground.position.x -= CGFloat(self.groundSpeed)
        
        ++currentTexture
        
        if(currentTexture > 5) {
            currentTexture = 1
        }
        
    }
}



func warrior(location: CGPoint) -> Warrior {
    let warrior = Warrior(imageNamed:"star.png")
    
    warrior.physicsBody?.dynamic = true;
    
    warrior.xScale = 0.075
    warrior.yScale = 0.075
    warrior.position = location
    
    return warrior
}


