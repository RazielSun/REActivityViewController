# REActivityViewController

Open source alternative to UIActivityViewController, highly customizable and compatible with iOS 5.0. It is fork of original pod REActivityViewController.
It allows to create custom activites with ease, you control their apperance and behavior and no longer restricted to single-color icons as with the default `UIActivity`.

<img src="https://github.com/RazielSun/REActivityViewController/raw/master/Screenshot.png" alt="REActivityViewController Screenshot" width="660" height="480" />

> Without standart activities (Use only for create custom)

## Requirements
* Xcode 4.5 or higher
* Apple LLVM compiler
* iOS 5.0 or higher
* ARC

## Installation

Edit your Podfile and add `REActivityViewController`:

``` bash
$ edit Podfile
platform :ios, '5.0'
pod 'REActivityViewController', :git => 'https://github.com/RazielSun/REActivityViewController.git'
```

Install into your Xcode project:

``` bash
$ pod install
```

Add `#include "REActivityViewController.h"` to the top of classes that will use it.

### Manual installation

`REActivityViewController` needs to be linked with the following frameworks:

* QuartzCore
* AssetsLibrary
* MessageUI
* Twitter

The following framework must be added as optional (weak reference):

* Social

Dependencies:

* [REComposeViewController](https://github.com/romaonthego/REComposeViewController) ~> 2.1.2

## Customization

All views are exposed for your customization. Say, you want to change controller background and customize cancel button, here is how you would do it:

``` objective-c
REActivityViewController *activityViewController = [[REActivityViewController alloc] initWithViewController:self activities:activities];

activityViewController.activityView.backgroundImageView.image = [UIImage imageNamed:@"My_Cool_Background"];
[activityViewController.activityView.cancelButton setBackgroundImage:[UIImage imageNamed:@"My_Cool_Button"] forState:UIControlStateNormal];
```

Your custom activity icons must be 118x118 pixels and should include gloss, rounded corners and shadows. Easy way to make them:

1. Open your 114x114 icon with rounded corners in Photoshop (you can convert your square icon using template from http://appicontemplate.com).
2. Adjust canvas size to be 118x118, so the top part of the icon touches top part of the canvas.
3. Add drop shadow to the icon layer: angle 90, opacity 40%, distance 2px, size 2px.

## Original Contact 

Roman Efimov

- https://github.com/romaonthego
- https://twitter.com/romaonthego
- romefimov@gmail.com

## License

REActivityViewController is available under the MIT license.

Copyright © 2013 Roman Efimov.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
