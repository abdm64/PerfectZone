//
//  Support.swift
//  OneLine
//
//  Created by ABD on 03/12/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import SpriteKit
import MessageUI
import Social
import UIKit



class Support :SKScene, MFMailComposeViewControllerDelegate {
    private var twitterBtn = SKSpriteNode()
    private var facebookBtn = SKSpriteNode()
    private var rateBtn = SKSpriteNode()
    private var mailBtn = SKSpriteNode()
    private var shareBtn = SKSpriteNode()
    private var backBtn = SKSpriteNode()
    
    let scaleIn = SKAction.scale(to: 1, duration: 0)
    
    let scaleOut = SKAction.scale(to: 1.25, duration: 0)
    
    
    override func didMove(to view: SKView) {
        intro()
    }
    
    func intro() {
         twitterBtn = self.childNode(withName: "twitter") as! SKSpriteNode
         facebookBtn = self.childNode(withName: "facebook") as! SKSpriteNode
         rateBtn = self.childNode(withName: "rate") as! SKSpriteNode
         mailBtn = self.childNode(withName: "mail") as! SKSpriteNode
         shareBtn = self.childNode(withName: "share") as! SKSpriteNode
        backBtn = self.childNode(withName: "back") as! SKSpriteNode
        
        let snow = SKEmitterNode(fileNamed: "Snow1")
        snow?.position = CGPoint(x: 0, y: 1168)
        snow?.advanceSimulationTime(1000)
        snow?.zPosition = 3
        self.addChild(snow!)

    
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            // print("Touches Began")
            if twitterBtn.contains(location) {
                
                
                twitterBtn.run(scaleOut)
                
                facebookBtn.run(scaleOut)
                
                rateBtn.run(scaleOut)
                
                mailBtn.run(scaleOut)
                shareBtn.run(scaleOut)
                backBtn.run(scaleOut)
                
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                
                //  print("Start")
                
                
                
            }
            else  if facebookBtn.contains(location) {
                
                twitterBtn.run(scaleOut)
                
                facebookBtn.run(scaleOut)
                
                rateBtn.run(scaleOut)
                
                mailBtn.run(scaleOut)
                shareBtn.run(scaleOut)
                backBtn.run(scaleOut)
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                
                
                
            } else  if mailBtn.contains(location) {
                
                twitterBtn.run(scaleOut)
                
                facebookBtn.run(scaleOut)
                
                rateBtn.run(scaleOut)
                
                mailBtn.run(scaleOut)
                shareBtn.run(scaleOut)
                backBtn.run(scaleOut)
                
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                
                
            }
            else  if shareBtn.contains(location) {
                
                twitterBtn.run(scaleOut)
                
                facebookBtn.run(scaleOut)
                
                rateBtn.run(scaleOut)
                
                mailBtn.run(scaleOut)
                shareBtn.run(scaleOut)
                backBtn.run(scaleOut)
                
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                
                
            }else  if backBtn.contains(location) {
                
                twitterBtn.run(scaleOut)
                
                facebookBtn.run(scaleOut)
                
                rateBtn.run(scaleOut)
                
                mailBtn.run(scaleOut)
                shareBtn.run(scaleOut)
                backBtn.run(scaleOut)
                
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                
                
            }else  if rateBtn.contains(location) {
                
                twitterBtn.run(scaleOut)
                
                facebookBtn.run(scaleOut)
                
                rateBtn.run(scaleOut)
                
                mailBtn.run(scaleOut)
                shareBtn.run(scaleOut)
                backBtn.run(scaleOut)
                
                self.run(SKAction.playSoundFileNamed("ButtonTouchSound.wav", waitForCompletion: false))
                
                
            }
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            // print("Touches Began")
            if twitterBtn.contains(location) {
                
                
                twitterBtn.run(scaleIn)
                
                facebookBtn.run(scaleIn)
                
                rateBtn.run(scaleIn)
                
                mailBtn.run(scaleIn)
                shareBtn.run(scaleIn)
                backBtn.run(scaleIn)
                
                
                //  print("Start")
                twitter()
                
                
            }
            else  if facebookBtn.contains(location) {
                
                twitterBtn.run(scaleIn)
                
                facebookBtn.run(scaleIn)
                
                rateBtn.run(scaleIn)
                
                mailBtn.run(scaleIn)
                shareBtn.run(scaleIn)
                backBtn.run(scaleIn)
                fb()
               
                
                
                
            } else  if mailBtn.contains(location) {
                
                twitterBtn.run(scaleIn)
                
                facebookBtn.run(scaleIn)
                
                rateBtn.run(scaleIn)
                
                mailBtn.run(scaleIn)
                shareBtn.run(scaleIn)
                backBtn.run(scaleIn)
                mail()
                
                
                
            }
            else  if shareBtn.contains(location) {
                
                twitterBtn.run(scaleIn)
                
                facebookBtn.run(scaleIn)
                
                rateBtn.run(scaleIn)
                
                mailBtn.run(scaleIn)
                shareBtn.run(scaleIn)
                backBtn.run(scaleIn)
                self.share()
                
                
                
            }else  if backBtn.contains(location) {
                
                twitterBtn.run(scaleIn)
                
                facebookBtn.run(scaleIn)
                
                rateBtn.run(scaleIn)
                
                mailBtn.run(scaleIn)
                shareBtn.run(scaleIn)
                backBtn.run(scaleIn)
                let scene = MainMenu(fileNamed: "MainMenu")
                scene?.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: SKTransition.crossFade(withDuration: 1.3))
                
                
            }else  if rateBtn.contains(location) {
                
                twitterBtn.run(scaleIn)
                
                facebookBtn.run(scaleIn)
                
                rateBtn.run(scaleIn)
                
                mailBtn.run(scaleIn)
                shareBtn.run(scaleIn)
                backBtn.run(scaleIn)
                rateApp()
                
                
                
            }
            
        }
    }
    
    func share(){
        let message = "Download PerFect ZoNe from the AppStore itms "
        
        if let link = NSURL(string: "itms-apps://itunes.apple.com/app/id1320076654")
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
            self.view?.window?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
        
        
    }
    
    func rateApp(){
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string : "itms-apps://itunes.apple.com/app/id1320076654")!, options: [:]) { (done) in
                // Handle results
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    func mail(){
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self //as? MFMailComposeViewControllerDelegate
            mail.setToRecipients(["abdm64@icloud.com"])
            mail.setSubject("PerFect ZoNe Feedback")
            mail.setMessageBody("Hi  would I like to share the following feedback .. \n ", isHTML: false)
            
            
            
            self.view?.window?.rootViewController?.present(mail, animated: true,completion: nil)
        } else {
            let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
            sendMailErrorAlert.show()
            
            
            
            
        }
        
    }
    func fb(){
        
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let fb: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            fb.setInitialText("Hey! Just scored \(GameManager.instance.getHighscore()) on PerFect ZoNe !  Try baet this!                            download From Here! https//itunes.apple.com/app/id1320076654 ")
            self.view?.window?.rootViewController?.present(fb, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please log into your Facebook account within the settings", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
            
            
            
            
        }
        
    }
    
    func twitter(){
        
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let twitter: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitter.setInitialText("Hey! Just scored \(GameManager.instance.getHighscore()) on PerFect ZoNe !  Try baet this!                            download From Here! https//itunes.apple.com/app/id1320076654 ")
           self.view?.window?.rootViewController?.present(twitter, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please log into your Twitter account within the settings", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
            
            
            
            
        }
    }
       
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        
        controller.dismiss(animated: true, completion: nil)
        }
        
        
        
        
    } // Class
    
    
    
    
    
    
    
    
    
    
    
//Class

