//
//  MainMenu.swift
//  OneLine
//
//  Created by ABD on 13/11/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import SpriteKit
import GameKit


class MainMenu : SKScene, GKGameCenterControllerDelegate {
    private var startBtn = SKSpriteNode()
    private var soundBtn = SKSpriteNode()
    private var scoreBtn = SKSpriteNode()
    private var supportBtn = SKSpriteNode()
    private let soundON = SKTexture(imageNamed: "Sound1")
    private let soundOff = SKTexture(imageNamed: "Sound")
    let scaleIn = SKAction.scale(to: 1, duration: 0)
    let BlueGear = SKSpriteNode(imageNamed: "LightBlueGear")
    
    let scaleOut = SKAction.scale(to: 1.25, duration: 0)
    
    var scoreLabl = SKLabelNode()
     let PresentAuthenticationViewController = "PresentAuthenticationViewController"
    
    override func didMove(to view: SKView) {
        
        let snow = SKEmitterNode(fileNamed: "Snow1")
        snow?.position = CGPoint(x: 0, y: 1168)
        snow?.advanceSimulationTime(1000)
        snow?.zPosition = 3
        self.addChild(snow!)
        startBtn = self.childNode(withName: "Start") as! SKSpriteNode
        soundBtn = self.childNode(withName: "sound") as! SKSpriteNode
        scoreBtn = self.childNode(withName: "score") as! SKSpriteNode
        supportBtn = self.childNode(withName: "support") as! SKSpriteNode
       // AudioManager.instance.playBGMusic()
        scoreLabl = self.childNode(withName: "Labl") as! SKLabelNode
        scoreLabl.text = String(GameManager.instance.getHighscore())
        athPlayer()
         GameCenter.instance.saveHighScore(identifier:"Score", score: Int(GameManager.instance.getHighscore()))
         GameManager.instance.initializeGameData()
            setMusic()
        creatGear()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
          
            let location = touch.location(in: self)
             // print("Touches Began")
            if startBtn.contains(location) {
                
               
                startBtn.run(scaleOut)
               
                soundBtn.run(scaleOut)
             
                supportBtn.run(scaleOut)
               
                scoreBtn.run(scaleOut)
              
                self.run(SKAction.playSoundFileNamed("taptap.wav", waitForCompletion: false))
                
              
          
                
           
            }
               else if supportBtn.contains(location) {
                
               
                startBtn.run(scaleOut)
               
                soundBtn.run(scaleOut)
             
                supportBtn.run(scaleOut)
             
                scoreBtn.run(scaleOut)
                
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                
                
                
                
            } else  if soundBtn.contains(location) {
              
                startBtn.run(scaleOut)
               
                soundBtn.run(scaleOut)
               
                supportBtn.run(scaleOut)
               
                scoreBtn.run(scaleOut)
                
               
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                
                
                
            } else  if scoreBtn.contains(location) {
                
                startBtn.run(scaleOut)
               
                soundBtn.run(scaleOut)
               
                supportBtn.run(scaleOut)
               
                scoreBtn.run(scaleOut)
                
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                
                
                
            }
           
        }
       
    }
    
    private func setMusic(){
        if GameManager.instance.getIsMusicOn(){
            if AudioManager.instance.isAudioPlayerInitialzed(){
                AudioManager.instance.playBGMusic()
               // musicBtn.texture = musicOff
                soundBtn.texture = soundOff
                
            }
            
        }
        
        GameManager.instance.saveData()
        
    }
    private func handleMusicBottun(){
        if GameManager.instance.getIsMusicOn() {
            AudioManager.instance.stopBgMusic()
            GameManager.instance.setIsMusicOn(isMusicOn: false)
           soundBtn.texture = soundON
            
            
        }else {
            AudioManager.instance.playBGMusic()
            GameManager.instance.setIsMusicOn(isMusicOn: true)
            
                soundBtn.texture = soundOff
            
            
        }
        GameManager.instance.saveData()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if startBtn.contains(location) {
                startBtn.run(scaleIn)
                soundBtn.run(scaleIn)
                supportBtn.run(scaleIn)
               
                scoreBtn.run(scaleIn)
                
                
                let scene = GamePlayScene(fileNamed: "GamePlayScene")
                scene?.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: SKTransition.crossFade(withDuration: 1.3))
            } else if scoreBtn.contains(location){
                startBtn.run(scaleIn)
                soundBtn.run(scaleIn)
                supportBtn.run(scaleIn)
                scoreBtn.run(scaleIn)
                
                showGameCenter()
            } else if supportBtn.contains(location) {
                startBtn.run(scaleIn)
                soundBtn.run(scaleIn)
                supportBtn.run(scaleIn)
                scoreBtn.run(scaleIn)
                let scene = Support(fileNamed: "Support")
                scene?.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: SKTransition.crossFade(withDuration: 1.3))
                
                
                
            } else if soundBtn.contains(location) {
                startBtn.run(scaleIn)
                soundBtn.run(scaleIn)
                supportBtn.run(scaleIn)
                scoreBtn.run(scaleIn)
                handleMusicBottun()
                
                
            }
            
            
        }
        
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
}// Class

