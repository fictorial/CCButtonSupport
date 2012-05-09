//
//  ImageAndTextButton.h
//  ObjectAL
//
//  Created by Karl Stenerud on 10-08-17.
//

#import "Button.h"

@class CCSprite;

@interface CCSpriteButton : Button
{
	CCLabelTTF* label;
}

@property (nonatomic,readonly,retain) CCLabelTTF* label;
@property (nonatomic, assign) CGPoint labelOffsetWhenDown;

/** Create a new button.
 * @param filename the filename of the image to use as a touchable portion when pressed and not pressed.
 * @param label the label to display atop the image.
 * @param target the target to notify when the button is pressed.
 * @param selector the selector to call when the button is pressed.
 * @return a new button.
 */
+ (id)buttonWithImageFile:(NSString *)filename 
                    label:(CCLabelTTF *)label
                   target:(id)target
                 selector:(SEL)selector;

/** Create a new button.
 * @param normalSprite the sprite to use as a touchable portion when not pressed.
 * @param selectedSprite the sprite to use as a touchable portion when pressed.
 * @param label the label to display atop the image.
 * @param target the target to notify when the button is pressed.
 * @param selector the selector to call when the button is pressed.
 * @return a new button.
 */
+ (id)buttonWithSprite:(CCSprite *)normalSprite
        selectedSprite:(CCSprite *)selectedSprite
                 label:(CCLabelTTF*)label 
                target:(id)target
              selector:(SEL)selector;

/** Initialize a button.
 * @param filename the filename of the image to use as a touchable portion when pressed and not pressed.
 * @param label the label to display atop the image.
 * @param target the target to notify when the button is pressed.
 * @param selector the selector to call when the button is pressed.
 * @return the initialized button.
 */
- (id)initWithImageFile:(NSString *)filename 
                  label:(CCLabelTTF *)label
                 target:(id)target
               selector:(SEL)selector;

/** Initialize a button.
 * @param normalSprite the sprite to use as a touchable portion when not pressed.
 * @param selectedSprite the sprite to use as a touchable portion when pressed.
 * @param label the label to display atop the image.
 * @param target the target to notify when the button is pressed.
 * @param selector the selector to call when the button is pressed.
 * @return the initialized button.
 */
- (id)initWithSprite:(CCSprite *)normalSprite 
      selectedSprite:(CCSprite *)selectedSprite
               label:(CCLabelTTF *)labelIn
              target:(id)targetIn
            selector:(SEL)selectorIn;

@end
