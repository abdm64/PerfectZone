//
//  GamePlayScene.swift
//  OneLine
//
//  Created by ABD on 07/11/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation



class GamePlayScene : SKScene, SKPhysicsContactDelegate  {
       
            let BlueGear = SKSpriteNode(imageNamed: "LightBlueGear")
            let GreenGear = SKSpriteNode(imageNamed: "LightGreenGear")
            let smoke = SKEmitterNode(fileNamed: "redSmoke")
            let scaleIn = SKAction.scale(to: 1, duration: 0)
    
            let scaleOut = SKAction.scale(to: 1.25, duration: 0)
    
            let again = SKSpriteNode(imageNamed: "Again")
            let exit = SKSpriteNode(imageNamed: "Exit")
    
            var mainCamera: SKCameraNode?
            let ball2 = Player(imageNamed: "RedBall")
        private var canMove = false
        private var moveLeft = false
        private var center : CGFloat?
                var barHolder = SKNode();
    var scoreLabel = SKLabelNode();
       var score = 0 ;
       var gameStarted = false
       var isAlive = false
       var x : CGFloat = 5.7
        var y : CGFloat = 1
    var  pressLeft = SKSpriteNode();
    var pressRight = SKSpriteNode();
    
   var PausePanel : SKSpriteNode?
    
    let ResumeBtn = SKSpriteNode(imageNamed: "Continue")
    let QuitBtn = SKSpriteNode(imageNamed: "Exit")
    var pauseBtn = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
       intro()
        
        scaleMode = .aspectFill
        physicsWorld.contactDelegate = self
        pauseBtn = self.childNode(withName: "Stop") as! SKSpriteNode

    }
    func intro(){
    
        ball2.name = "Ball"
        ball2.position = CGPoint(x: 0, y: -(self.frame.size.height / 4 - 50))
        ball2.zPosition = 5
        ball2.xScale = 1.8
        ball2.yScale = 1.8
        ball2.physicsBody = SKPhysicsBody(circleOfRadius: self.ball2.size.height / 2)
        ball2.physicsBody?.affectedByGravity = false
       // ball2.physicsBody?.isDynamic = false
        ball2.physicsBody?.categoryBitMask = ColliderType.Ball
        ball2.physicsBody?.collisionBitMask = ColliderType.Bar
        ball2.physicsBody?.contactTestBitMask = ColliderType.Bar
        ball2.physicsBody?.contactTestBitMask = ColliderType.Score
        
        
        smoke?.position = ball2.position
        smoke?.zRotation = CGFloat(Double.pi)
        smoke?.advanceSimulationTime(100000)
        smoke?.zPosition = 5
       // smoke?.targetNode = self.ball2
       // ball2.addChild(smoke!)
        
        
      // self.addChild(smoke!)
        
      self.addChild(ball2)
       
          center = self.frame.size.width / self.frame.size.height
        
        mainCamera = self.childNode(withName: "Camera") as? SKCameraNode! ;
       
        //createBar()
      
        creatGear()
        createLabelNode()
        addsnow()
       // createInstruction()
    }
    func createInstruction(){
        pressLeft = SKSpriteNode(imageNamed: "LeftFinger")
        pressRight = SKSpriteNode(imageNamed: "RightFinger")
        pressLeft.position = CGPoint(x: -300, y: -500)
        pressRight.position = CGPoint(x: 300, y: -500)
        pressLeft.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pressRight.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pressRight.setScale(3.5)
        pressLeft.setScale(3.5)
        
        pressRight.zPosition = 4
        pressLeft.zPosition = 4
        
        let scaleIn1 = SKAction.scale(to: 3.8, duration: 0.1)
        
        let scaleOut1 = SKAction.scale(to: 3.5, duration: 0.2)
        
        
        
        
      var zoom = SKAction.sequence([SKAction.fadeIn(withDuration: 1.0), SKAction.wait(forDuration: 2.0), SKAction.fadeOut(withDuration: 1.0)])
        
        pressRight.run(SKAction.repeatForever(zoom))
        pressLeft.run(SKAction.repeatForever(zoom))
        
        
        self.addChild(pressRight)
        self.addChild(pressLeft)
        
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            isAlive = true
            gameStarted = true
              spownBars()
            //addsnow()
        }
        for touch in touches {
            
            
            
            let location = touch.location(in: self)
            if location.x > center! {
                moveLeft = false
                //print("right")
                
            } else {
                
                moveLeft = true
               // print("left")
            }
            
            if again.contains(location) {
                 self.run(SKAction.playSoundFileNamed("taptap.wav", waitForCompletion: false))
                let scale = SKAction.scale(to: 4, duration: 0)
                again.run(scale)
               
                let scale2 = SKAction.scale(to: 3, duration: 0)
                exit.run(scale2)
                
                print("Start")
                
                
                
            } else if  exit.contains(location) {
                 self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                let scale = SKAction.scale(to: 3, duration: 0)
                exit.run(scale)
                let scale2 = SKAction.scale(to: 4, duration: 0)
                again.run(scale2)
                
            } else if pauseBtn.contains(location){
                self.scene?.isPaused = true
                
                createPausePanel()
            }else if ResumeBtn.contains(location){
                 self.scene?.isPaused = false
                let scale = SKAction.scale(to: 2, duration: 0)
                ResumeBtn.run(scale)
                let scale2 = SKAction.scale(to: 2, duration: 0)
                QuitBtn.run(scale2)
                ResumeBtn.removeFromParent()
                QuitBtn.removeFromParent()
                
            }else if QuitBtn.contains(location){
                
                let scene = MainMenu(fileNamed: "MainMenu")
                scene?.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: SKTransition.crossFade(withDuration: 1.3))
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                let scale = SKAction.scale(to: 2, duration: 0)
                ResumeBtn.run(scale)
                let scale2 = SKAction.scale(to: 2, duration: 0)
                QuitBtn.run(scale2)
            }
            
        }
        canMove = true
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
           canMove = false
        for touch in touches {
            let location = touch.location(in: self)
            
        if again.contains(location) {
            
            let scene = GamePlayScene(fileNamed: "GamePlayScene")
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: SKTransition.crossFade(withDuration: 1.3))
            let scale2 = SKAction.scale(to: 5.3, duration: 0)
            again.run(scale2)
            let scale3 = SKAction.scale(to: 4.3, duration: 0)
            exit.run(scale3)
            
          
        } else if exit.contains(location) {
            let scale3 = SKAction.scale(to: 5.3, duration: 0)
            again.run(scale3)
            let scale2 = SKAction.scale(to: 4.3, duration: 0)
                exit.run(scale2)
            
            let scene = MainMenu(fileNamed: "MainMenu")
            scene?.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: SKTransition.crossFade(withDuration: 1.3))
            
            
            }
        }
    }
    override func update(_ currentTime: TimeInterval) {
        manageBall()
       // barHolder.position.y -= 5
        if isAlive {
        x -= 0.001
        if x < 2.5 {
            x = 2.7
            
        }
        
        print(String(describing: x))
        }
        
    }
    func manageBall(){
        if canMove {
            
          ball2.move(left: moveLeft)
            
            
            
            
        }
        
        
        
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        
        if contact.bodyA.node?.name == "Ball" {
            
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            
            
            
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            
            
        }
        
        if firstBody.node?.name == "Ball" && secondBody.node?.name == "Score" {
            
            incrementScore()
        } else if firstBody.node?.name == "Ball" && secondBody.node?.name == "Bar" {
             self.run(SKAction.playSoundFileNamed("1E.wav", waitForCompletion: false))
            let explosion = SKEmitterNode(fileNamed: "Explod")!
           AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            explosion.position = ball2.position
            self.addChild(explosion)
            explosion.removeFromParent()
            
           
            
            
            firstBody.node?.removeFromParent()
           
            if isAlive {
                ballExplod()
                
                
            }
           
            
            

        }
    }
    
    func ballExplod(){
       
        isAlive = false
        self.removeAction(forKey: "Spawn")
        for child in children {
            if child.name == "Holder" {
                child.removeAction(forKey: "Move")
                
                
            }
            
            
        }
        let hightScore = GameManager.instance.getHighscore()
        
        if hightScore < score {
            GameManager.instance.setHighscore(score)
            
        }
        
        again.name = "again"
        again.zPosition = 6
        again.setScale(0)
        again.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        again.position = CGPoint(x: 0, y: 250)
    
        
        
        exit.name = "exit"
        exit.zPosition = 6
        exit.setScale(0)
        exit.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        exit.position = CGPoint(x: 0, y: -250)
       
        
        let scaleUp1 = SKAction.scale(to: 3.5, duration: 0.5)
        let scaleUp2 = SKAction.scale(to: 4.5, duration: 0.5)
        
        again.run(scaleUp2)
        exit.run(scaleUp1)
        self.addChild(again)
        self.addChild(exit)
      
        
        self.removeAllActions()
        

        
        
    }
    
    func    addsnow() {
        
        let snow = SKEmitterNode(fileNamed: "Snow1")
        snow?.position = CGPoint(x: 0, y: 1168)
        snow?.advanceSimulationTime(1000)
        snow?.zPosition = 3
        self.addChild(snow!)
        
    }
    
   
        
    
    
    
    
    
}//
