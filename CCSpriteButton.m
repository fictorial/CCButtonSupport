//
//  ImageAndTextButton.m
//  ObjectAL
//
//  Created by Karl Stenerud on 10-08-17.
//

#import "CCSpriteButton.h"
#import "CCNode+ContentSize.h"

enum {
    kNormalSpriteTag = 787878,
    kSelectedSpriteTag
};

#pragma mark ImageAndLabelButton

@implementation CCSpriteButton

@synthesize labelOffsetWhenDown;

#pragma mark Object Management

+ (id)buttonWithImageFile:(NSString *)filename
                    label:(CCLabelTTF *)label
                   target:(id)target
                 selector:(SEL)selector
{
	return [[[self alloc] initWithImageFile:filename
                                      label:label
                                     target:target
                                   selector:selector] autorelease];
}

+ (id)buttonWithSprite:(CCSprite *)normalSprite
        selectedSprite:(CCSprite *)selectedSprite
                 label:(CCLabelTTF*)label 
                target:(id)target
              selector:(SEL)selector
{
    return [[[self alloc] initWithSprite:normalSprite 
                          selectedSprite:selectedSprite
                                   label:label
                                  target:target
                                selector:selector] autorelease];
}

- (id)initWithImageFile:(NSString *)filename
                  label:(CCLabelTTF *)labelIn 
                 target:(id)targetIn
               selector:(SEL)selectorIn
{
	CCSprite* sprite = [CCSprite spriteWithFile:filename];
    return [self initWithSprite:sprite selectedSprite:sprite label:labelIn target:targetIn selector:selectorIn];
}

- (id)initWithSprite:(CCSprite *)normalSprite 
      selectedSprite:(CCSprite *)selectedSprite
               label:(CCLabelTTF *)labelIn
              target:(id)targetIn
            selector:(SEL)selectorIn
{
    label = labelIn;
	
	float maxHeight = normalSprite.contentSize.height;
	if (label.contentSize.height > maxHeight)
	{
		maxHeight = label.contentSize.height;
	}
	
	float halfHeight = maxHeight * 0.5f;
	
	normalSprite.anchorPoint = selectedSprite.anchorPoint = ccp(0.5f, 0.5f);
	normalSprite.position = selectedSprite.position = ccp(normalSprite.contentSize.width*0.5f, halfHeight);
    
    normalSprite.tag = kNormalSpriteTag;
    selectedSprite.tag = kSelectedSpriteTag;
    
	label.position = normalSprite.position;
	
	CCNode* node = [CCNode node];
	[node addChild:selectedSprite];
	[node addChild:normalSprite];
    
    if (label != nil)    
        [node addChild:label];
    
	[node setContentSizeFromChildren];
	
    return [super initWithTouchablePortion:node target:targetIn selector:selectorIn];
}

- (void)onButtonDown 
{
    [super onButtonDown];

    CCNode *normalSprite = [self.touchablePortion getChildByTag:kNormalSpriteTag];
    normalSprite.visible = NO;
    
    CCNode *selectedSprite = [self.touchablePortion getChildByTag:kSelectedSpriteTag];
    selectedSprite.visible = YES;

    label.position = ccpAdd(label.position, self.labelOffsetWhenDown);
}

- (void)onButtonUp
{
    [super onButtonUp];
    
    CCNode *normalSprite = [self.touchablePortion getChildByTag:kNormalSpriteTag];
    normalSprite.visible = YES;
    
    CCNode *selectedSprite = [self.touchablePortion getChildByTag:kSelectedSpriteTag];
    selectedSprite.visible = NO;
    
    label.position = ccpSub(label.position, self.labelOffsetWhenDown);
}

@synthesize label;

@end
