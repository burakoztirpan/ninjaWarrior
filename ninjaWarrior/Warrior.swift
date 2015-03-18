//
//  Warrior.swift
//  ninjaWarrior
//
//  Created by Burak Öztırpan on 17.03.2015.
//  Copyright (c) 2015 Burak Öztırpan. All rights reserved.
//

import Foundation
import SpriteKit


class Warrior:SKSpriteNode {
    
    var warriorId:Int = 0
    var warriorHealt:Int = 0
    var warriorSpeed:Int = 0
    var warriorAttack:Int = 0
    var warriorReflex:Int  = 0
    var randomPosition:Int  = 0
    var height:Int  = 10
    var width:Int  = 7
    

    
    func addWarrior(frame){
        let warrior = Warrior(imageNamed:"warrior")
        warrior.size.height = 10
        warrior.size.width = 10
        warrior.position = CGPoint(x: 3,y: 3)
        walk(warrior)
        
        warrior.physicsBody = SKPhysicsBody() //SKPhysicsBody(texture: SKTexture(imageNamed: "warrior.atlas")
        if let warrior = warrior.physicsBody {
            warrior.affectedByGravity = true
            warrior.dynamic = true;
        }
         self.addChild(warrior)
    }
    
    
    func jump(warrior:SKSpriteNode){ //Jump Warrior
        warrior.physicsBody?.velocity = CGVectorMake(0, 5)
        warrior.physicsBody?.applyImpulse(CGVectorMake(0, 4))
    }
    
    func walk(warrior:SKSpriteNode){
        var moveBottomLeft = SKAction.moveTo(CGPointMake(400,100), duration:2.0)
        warrior.runAction(moveBottomLeft)
    }

    
}