//
//  GameScene.m
//  LKMoleGame
//
//  Created by Huy Nguyen on 6/6/16.
//  Copyright (c) 2016 Huy Nguyen. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

- (void)didMoveToView:(SKView *)view {
    SKSpriteNode * lkBackground = [SKSpriteNode spriteNodeWithImageNamed:@"Background"];
    lkBackground.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    lkBackground.zPosition = -10;
    [self addChild:lkBackground];
    
    
    lkMole = [LKMoleNode node];
    [lkMole lkCreatMole];
    [lkMole lkSettingNewPlace:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
    [self addChild:lkMole];
    
    SKAction * lkRunBlock = [SKAction runBlock:^{
        [self lkGo];
    }];
    
    SKAction * lkActionNow = [SKAction sequence:@[[SKAction waitForDuration:3.0], lkRunBlock]];
    [self runAction:lkActionNow withKey:@"Repeated"];
}

- (void)lkGo{
    [lkMole lkGoUp];
    
    SKAction * lkRunBlock = [SKAction runBlock:^{
        [self lkGo];
    }];
    
    SKAction * lkActionNow = [SKAction sequence:@[[SKAction waitForDuration:3.0], lkRunBlock]];
    [self runAction:lkActionNow withKey:@"Repeated"];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
