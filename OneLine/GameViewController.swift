//
//  GameViewController.swift
//  OneLine
//
//  Created by ABD on 07/11/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

class GameViewController: UIViewController, GADBannerViewDelegate  {
    var googleBannerView: GADBannerView!
    var interstitial: GADInterstitial!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        admobe()
                if let view = self.view as! SKView? {
                    if  let scene = MainMenu(fileNamed: "MainMenu") {
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene)
                    
                    view.ignoresSiblingOrder = true
                    
                   // view.showsFPS = true
                   // view.showsNodeCount = true
                        view.showsPhysics = false
                }
        }
         
    }
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func admobe(){
        
        googleBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        googleBannerView.adUnitID = "ca-app-pub-1405683736226327/1968381936"
        
        googleBannerView.rootViewController = self
        let request: GADRequest = GADRequest()
        googleBannerView.load(request)
        //        googleBannerView.frame = CGRect(x: 0, y: (view.bounds.height - googleBannerView.frame.size.height), width: googleBannerView.frame.size.width, height: googleBannerView.frame.size.height)
        
        self.view.addSubview(googleBannerView!)
    }
    
    
    private func initAds() {
    
    
    
    interstitial = GADInterstitial(adUnitID: "ca-app-pub-1405683736226327/7750259442")
    let request = GADRequest()
    request.testDevices = [ kGADSimulatorID, "2077ef9a63d2b398840261c8221a0c9b" ]
    interstitial.load(request)
    }
    
    
    
}
