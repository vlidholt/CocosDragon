/*
 * CocosBuilder: http://www.cocosbuilder.com
 *
 * Copyright (c) 2012 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "Dragon.h"
#import "Coin.h"
#import "Bomb.h"
#import "GameScene.h"
#import "CCBAnimationManager.h"

#define kCJStartSpeed 8
#define kCJCoinSpeed 8
#define kCJStartTarget 160

#define kCJTargetFilterFactor 0.05
#define kCJSlowDownFactor 0.995
#define kCJGravitySpeed 0.1
#define kCJGameOverSpeed -10
#define kCJDeltaToRotationFactor 5

@implementation Dragon

@synthesize xTarget;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    xTarget = kCJStartTarget;
    ySpeed = kCJStartSpeed;
    
    return self;
}

- (void) update
{
    // Calculate new position
    CGPoint oldPosition = self.position;
    
    float xNew = xTarget * kCJTargetFilterFactor + oldPosition.x * (1-kCJTargetFilterFactor);
    float yNew = oldPosition.y + ySpeed;
    
    self.position = ccp(xNew,yNew);
    
    // Update the vertical speed
    ySpeed = (ySpeed - kCJGravitySpeed) * kCJSlowDownFactor;
    
    // Tilt the dragon depending on horizontal speed
    float xDelta = xNew - oldPosition.x;
    self.rotation = xDelta * kCJDeltaToRotationFactor;
    
    // Check for game over
    if (ySpeed < kCJGameOverSpeed)
    {
        [[GameScene sharedScene] handleGameOver];
    }
}

- (void) handleCollisionWith:(GameObject *)gameObject
{
    if ([gameObject isKindOfClass:[Coin class]])
    {
        // Took a coin
        ySpeed = kCJCoinSpeed;
        
        [GameScene sharedScene].score += 1;
    }
    else if ([gameObject isKindOfClass:[Bomb class]])
    {
        // Hit a bomb
        if (ySpeed > 0) ySpeed = 0;
        
        CCBAnimationManager* animationManager = self.userObject;
        NSLog(@"animationManager: %@", animationManager);
        [animationManager runAnimationsForSequenceNamed:@"Hit"];
    }
}

- (float) radius
{
    return 25;
}

@end
