//
//  BGClass.swift
//  OneLine
//
//  Created by ABD on 12/11/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import Foundation
import SpriteKit


class BGClass: SKSpriteNode {
    func moveBG(camera: SKCameraNode){
        if self.position.y + self.size.height + 10 < camera.position.y {
            self.position.y += self.size.height * 3
            
            
        }
        
        
    }
    
    
}
