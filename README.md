# Button support for Cocos2D-iPhone

This originates with [ObjectAL](https://github.com/kstenerud/ObjectAL-for-iPhone)'s
demo support code by *Karl Stenerud*. ObjectAL is released under the Apache 2.0 license.

I have simply extracted the Cocos2D-iPhone button related code, added a few
convenience methods to ImageButton and ImageAndLabelButton, and have packaged it
up so it can be used separately from ObjectAL.

And I have also added some additional features to go beyond the ObjectAL demo
for which this stuff was originally coded.

## ImageButton

- add initializer for CCSprite based images not just from a file. Useful if you
  use say UIImage-PDF to load your images (like I do)

## ImageAndLabelButton

- add initializer for CCSprite based images not just from a file. Useful if you
  use say UIImage-PDF to load your images (like I do)
- add a 'selected' state sprite
- center the label atop the sprite don't put it on the right of the image.
- a label offset for when the button is in the down state. If you have a
  selected sprite image that looks like it actually moves down/in, you can
  have the label move along with it.

