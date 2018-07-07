//
//  Extension.swift
//  OneLine
//
//  Created by ABD on 17/11/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import Foundation
import SpriteKit

struct ColliderType {
    
    static let Ball: UInt32 = 1 ;
    static let Bar: UInt32 = 2 ;
    static let Score : UInt32 = 4
    
    
    
}


extension GamePlayScene {
    
    func createBar(){
        barHolder = SKNode();
        barHolder.name = "Holder"
        let barRight = SKSpriteNode(imageNamed: "WhiteLazer") //BlueLazer
        let barLeft = SKSpriteNode(imageNamed: "WhiteLazer") // GreenLazer
        
        barRight.name = "Bar"
        barRight.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        barRight.position = CGPoint(x: 550 , y: 0) //550
       // barRight.xScale = 4
        barRight.size.width = 1000
        barRight.size.height = 70
        barRight.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: barRight.size.width - 60, height: barRight.size.height))
        barRight.physicsBody?.affectedByGravity = false
        barRight.physicsBody?.allowsRotation = false
      //  barRight.physicsBody?.isDynamic = false
        
        barRight.physicsBody?.categoryBitMask = ColliderType.Bar
        barRight.physicsBody?.collisionBitMask = ColliderType.Ball
        barRight.physicsBody?.contactTestBitMask = ColliderType.Ball
       
        
       
        
        let scoreNode = SKSpriteNode()
        scoreNode.name = "Score"
        scoreNode.zPosition = 3
        //scoreNode.color = UIColor.red
        scoreNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scoreNode.position = CGPoint(x: 0, y: 0)
        scoreNode.size = CGSize(width: 500, height: 10)
        scoreNode.physicsBody = SKPhysicsBody(rectangleOf: scoreNode.size)
        scoreNode.physicsBody?.categoryBitMask = ColliderType.Score ;
        scoreNode.physicsBody?.collisionBitMask = 0 ;
        scoreNode.physicsBody?.affectedByGravity = false
        scoreNode.physicsBody?.isDynamic = false
        barHolder.addChild(scoreNode)
        
        
        barLeft.name = "Bar"
        barLeft.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        barLeft.position = CGPoint(x: -550 , y: 0) // -550
        barLeft.size.width = 1000
        //barLeft.xScale = 4
        barLeft.size.height = 70
        
        barLeft.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: barLeft.size.width - 60, height: barLeft.size.height))
        barLeft.physicsBody?.affectedByGravity = false
        barLeft.physicsBody?.isDynamic = false
        barLeft.physicsBody?.allowsRotation = false
        
        barLeft.physicsBody?.categoryBitMask = ColliderType.Bar
        barLeft.physicsBody?.collisionBitMask = ColliderType.Ball
        barLeft.physicsBody?.contactTestBitMask = ColliderType.Ball
//
        
        barHolder.zPosition = 5
        barHolder.position = CGPoint(x: CGFloat.randomBetweenNumbers(firstNumb: -350, secondNumb: 350), y: 1219)
        barHolder.addChild(barRight)
        barHolder.addChild(barLeft)
        let move = SKAction.moveTo(y: -1218, duration: TimeInterval(x))
        let remove = SKAction.removeFromParent()
        barHolder.run(SKAction.sequence([move,remove]), withKey: "Move")
        
        self.addChild(barHolder)
        
        
        
    }
    
    func creatGear(){
        
      
        BlueGear.name = "Gear"
        BlueGear.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        BlueGear.position = CGPoint(x: 0, y: 0)
        BlueGear.zPosition = 2
        BlueGear.setScale(1.5)
        let rotate = SKAction.rotate(byAngle: CGFloat(-Double.pi/4), duration:0.9)
        let rotate4ever = SKAction.repeatForever(rotate)
        
        
        GreenGear.name = "Gear"
        GreenGear .anchorPoint = CGPoint(x: 0.5, y: 0.5)
        GreenGear .position = CGPoint(x: 0, y: 500)
        GreenGear .zPosition = 2
      //  let fade = SKAction.fadeAlpha(to: 0.5, duration: 10)
        
        BlueGear.run(rotate4ever)
        GreenGear.run(rotate4ever)
//        GreenGear.run(fade)
//        BlueGear.run(fade)
        self.addChild(BlueGear)
        //self.addChild(GreenGear)
        
        
        
        
    }
    
    
    func spownBars(){
                let spawn = SKAction.run( { () ->Void in
                    
             self.createBar()
        })
        
       let delay = SKAction.wait(forDuration:TimeInterval(CGFloat.randomBetweenNumbers(firstNumb: 1.4, secondNumb: 1.8)))
        let sequnce = SKAction.sequence([spawn, delay])
        
        self.run(SKAction.repeatForever(sequnce), withKey : "Spawn")
        
        
        
    }
    
    func createLabelNode(){
        scoreLabel.zPosition = 9
        scoreLabel = self.childNode(withName: "score") as! SKLabelNode
        scoreLabel.fontSize = 80
        scoreLabel.text = "0"
       // self.addChild(scoreLabel)
        
        
    }
    
    func incrementScore() {
        score += 1
        scoreLabel.text = String(score)
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
