//
//  ExtentionMainMenu.swift
//  OneLine
//
//  Created by ABD on 01/12/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit



extension MainMenu {
    
    func athPlayer(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainMenu.showAuthenticationViewController), name:NSNotification.Name(rawValue: PresentAuthenticationViewController), object: nil)
        
        
        GameCenter.instance.authenticateLocalPlayer()
        
    }
    func showGameCenter(){
        
        let gcvc = GKGameCenterViewController()
        gcvc.gameCenterDelegate = self //as? GKGameCenterControllerDelegate
        
        self.view?.window?.rootViewController?.present(gcvc, animated: true, completion: nil)
        
        
    }
    @objc func showAuthenticationViewController(){
        let gameKitHelper = GameCenter.instance
        if gameKitHelper.authenticationViewController != nil{
            
            self.view?.window?.rootViewController?.present(GameCenter.instance.authenticationViewController!, animated: true, completion: nil)
            
        }
        
        
    }
       
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
        print("Dismiss")
    }
    
    
    func creatGear(){
        
        
        BlueGear.name = "Gear"
        BlueGear.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        BlueGear.position = CGPoint(x: 0, y: -100)
        BlueGear.zPosition = 0
        BlueGear.setScale(1.5)
        let rotate = SKAction.rotate(byAngle: CGFloat(-Double.pi/4), duration:0.9)
        let rotate4ever = SKAction.repeatForever(rotate)
        
        
       
        
        
        BlueGear.run(rotate4ever)
       
        self.addChild(BlueGear)
        
        
        
        
        
    }
    
    
    
    
    
    
    
}
