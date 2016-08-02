//
//  GameScene.swift
//  ChangingSky
//
//  Created by Stephen Brennan on 8/2/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
        
        nextSky()
    }
    
    var skyCount = 0;
    
    
    let colors = [
        UIColor.redColor(),
        UIColor.yellowColor(),
        UIColor.blueColor(),
        UIColor.purpleColor(),
        ]
    
    func nextSky() {
        if let sky = childNodeWithName("//sky") as? SKSpriteNode {
            let fadeBackground = SKAction.colorizeWithColor(colors[skyCount % colors.count], colorBlendFactor: 1, duration: 3)
            let block = SKAction.runBlock({
                self.nextSky()
            })
            let seq = SKAction.sequence([ fadeBackground, block ])
            skyCount += 1
            sky.runAction(seq)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for _ in touches {
            let theColor = colors [ random() % colors.count ]
            if let sky = childNodeWithName("//sky") as? SKSpriteNode {
                let action = SKAction.colorizeWithColor(theColor, colorBlendFactor: 1, duration: 1)
                sky.runAction(action)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
