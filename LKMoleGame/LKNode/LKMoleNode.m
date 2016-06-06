//
//  LKMoleNode.m
//  LKMoleGame
//
//  Created by Huy Nguyen on 6/6/16.
//  Copyright © 2016 Huy Nguyen. All rights reserved.
//

#import "LKMoleNode.h"

@implementation LKMoleNode
- (void)lkCreatMole{
    lkSize = CGSizeMake(150, 150);
    
    lkHoleBack = [SKSpriteNode spriteNodeWithImageNamed:@"HoleBack"];
    lkHoleBack.size = lkSize;
    lkHoleBack.name = @"Back";
    
    lkHoleFront = [SKSpriteNode spriteNodeWithImageNamed:@"HoleFront"];
    lkHoleFront.size = lkSize;
    lkHoleFront.name = @"Front";
    
    lkHoleBack.zPosition = -1;
    lkHoleFront.zPosition = 100;
    
    [self addChild:lkHoleBack];
    [self addChild:lkHoleFront];
    
    lkMoleSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Bunny"];
    lkMoleSprite.size = lkSize;
    lkMoleSprite.name = @"NormalMole";
    
    lkMask = [SKSpriteNode spriteNodeWithImageNamed:@"Background"];
    lkMask.name = @"Mark";
    lkMask.size = lkSize;
    
    
    lkMoleCrop = [SKCropNode node];
    lkMoleCrop.name = @"Crop";
    [lkMoleCrop addChild:lkMoleSprite];
    [lkMoleCrop setMaskNode:lkMask];
    
    [self addChild:lkMoleCrop];
}

- (void)lkSettingNewPlace:(CGPoint)lkPosition{
    lkHoleBack.position = lkPosition;
    lkHoleFront.position = lkPosition;
    lkMoleSprite.position = CGPointMake(lkPosition.x, lkPosition.y - lkSize.height);
    lkMask.position = CGPointMake(lkPosition.x, lkPosition.y + lkSize.height/10);
    
    lkPos = lkPosition;
}

- (void)lkGoUp{
    SKAction * lkMoveUp = [SKAction moveTo:lkPos duration:0.5];
    SKAction * lkMoveDown = [SKAction moveTo:CGPointMake(lkPos.x, lkPos.y - lkSize.height) duration:0.5];
    
    [lkMoleSprite runAction:[SKAction sequence:@[lkMoveUp, [SKAction waitForDuration:1.0], lkMoveDown]] withKey:@"MoleMove"];
    
    NSLog(@"Go Up");
}

- (void)lkGetHit{
    SKAction * lkMoveDown = [SKAction moveTo:CGPointMake(lkPos.x, lkPos.y - lkMoleSprite.size.height) duration:0.5];
    SKAction * lkFinishMove = [SKAction runBlock:^{
//        [self lkFinishAction];
    }];
    
    lkMoleSprite.texture = [SKTexture textureWithImageNamed:@"BurnBunny"];
    lkMoleSprite.name = @"MoleGotHit";
    
    [lkMoleSprite runAction:[SKAction sequence:@[lkMoveDown, lkFinishMove]] withKey:@"MoleMove"];
}
@end
