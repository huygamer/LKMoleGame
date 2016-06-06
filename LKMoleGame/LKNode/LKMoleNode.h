//
//  LKMoleNode.h
//  LKMoleGame
//
//  Created by Huy Nguyen on 6/6/16.
//  Copyright © 2016 Huy Nguyen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface LKMoleNode : SKNode
{
    SKSpriteNode * lkHoleFront;
    SKSpriteNode * lkHoleBack;
    
    SKSpriteNode * lkMoleSprite;
    SKSpriteNode * lkMask;
    SKCropNode * lkMoleCrop;
    
    CGPoint lkPos;
    CGSize lkSize;
}

- (void)lkCreatMole;
- (void)lkSettingNewPlace:(CGPoint)lkPosition;

- (void)lkGoUp;
@end
