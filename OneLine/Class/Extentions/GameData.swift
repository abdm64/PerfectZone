//
//  GameData.swift
//  OneLine
//
//  Created by ABD on 06/12/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import Foundation


class GameData : NSObject, NSCoding {
     static let instance = GameData()
    
    struct Keys {
        
        
        static let Music = "Music"
        
        
    }
    private var isMusicOn = false
    override init() {}
    
    required init(coder aDecoer : NSCoder) {
        super.init()
        
        self.isMusicOn = aDecoer.decodeBool(forKey: Keys.Music)
        
    }
    func encode(with aCoder: NSCoder) {
        
        
        aCoder.encode(self.isMusicOn, forKey: Keys.Music)
    }
    
    func setMusicOn(isMusicOn : Bool){
        self.isMusicOn = isMusicOn
        
        
    }
    
    func getMusic() -> Bool{
        return self.isMusicOn
        
    }
    
    
    
    
}//Class
