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

#import "cocos2d.h"

enum
{
    kCCBPositionTypeRelativeBottomLeft,
    kCCBPositionTypeRelativeTopLeft,
    kCCBPositionTypeRelativeTopRight,
    kCCBPositionTypeRelativeBottomRight,
    kCCBPositionTypePercent,
    kCCBPositionTypeMultiplyResolution,
};

enum
{
    kCCBSizeTypeAbsolute,
    kCCBSizeTypePercent,
    kCCBSizeTypeRelativeContainer,
    kCCBSizeTypeHorizontalPercent,
    kCCBSizeTypeVerticalPercent,
    kCCBSizeTypeMultiplyResolution,
};

enum
{
    kCCBScaleTypeAbsolute,
    kCCBScaleTypeMultiplyResolution
};

extern float ccbResolutionScale;

@interface CCNode (CCBRelativePositioning)

- (float) resolutionScale;

#pragma mark Positions

- (CGPoint) absolutePositionFromRelative:(CGPoint)pt type:(int)type parentSize:(CGSize)containerSize propertyName:(NSString*) propertyName;
- (void) setRelativePosition:(CGPoint)pt type:(int)type parentSize:(CGSize)containerSize propertyName:(NSString*) propertyName;
- (void) setRelativePosition:(CGPoint)position type:(int)type parentSize:(CGSize)parentSize;
- (void) setRelativePosition:(CGPoint)position type:(int)type;

#pragma mark Content Size

- (void) setRelativeSize:(CGSize)size type:(int)type parentSize:(CGSize)containerSize propertyName:(NSString*) propertyName;
- (void) setRelativeSize:(CGSize)size type:(int)type parentSize:(CGSize)parentSize;
- (void) setRelativeSize:(CGSize)size type:(int)type;

#pragma mark Scale

- (void) setRelativeScaleX:(float)x Y:(float)y type:(int)type propertyName:(NSString*)propertyName;
- (void) setRelativeScaleX:(float)x Y:(float)y type:(int)type;

#pragma mark Floats

- (void) setRelativeFloat:(float)f type:(int)type propertyName:(NSString*)propertyName;

@end
