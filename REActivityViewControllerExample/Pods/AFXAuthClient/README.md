# AFXAuthClient

[AFNetworking](https://github.com/AFNetworking/AFNetworking) Extension for XAuth Authentication.

## Requirements
* Xcode 4.5 or higher
* Apple LLVM compiler
* iOS 5.0 or higher / Mac OS X 10.7 or higher
* ARC

## Installation

### CocoaPods

The recommended approach for installating `AFXAuthClient` is via the [CocoaPods](http://cocoapods.org/) package manager, as it provides flexible dependency management and dead simple installation.
For best results, it is recommended that you install via CocoaPods >= **0.15.2** using Git >= **1.8.0** installed via Homebrew.

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Change to the directory of your Xcode project:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile
```

Edit your Podfile and add AFXAuthClient:

``` bash
pod 'AFXAuthClient', '~> 1.0.8'
```

Install into your Xcode project:

``` bash
$ pod install
```

Open your project in Xcode from the .xcworkspace file (not the usual project file)

``` bash
$ open MyProject.xcworkspace
```

Please note that if your installation fails, it may be because you are installing with a version of Git lower than CocoaPods is expecting. Please ensure that you are running Git >= **1.8.0** by executing `git --version`. You can get a full picture of the installation details by executing `pod install --verbose`.

### Manual Install

All you need to do is drop `AFXAuthClient` files into your project, and add `#include "AFXAuthClient.h"` to the top of classes that will use it.

## Example Usage

Here's the sample code that works with Tumblr XAuth:

``` objective-c
AFXAuthClient *client = [[AFXAuthClient alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.tumblr.com"]
                                                                                key:@"YOUR TUMBLR CONSUMER KEY"
                                                                             secret:@"YOUR TUMBLR CONSUMER SECRET"];

[client authorizeUsingXAuthWithAccessTokenPath:@"/oauth/access_token"
                                  accessMethod:@"POST"
                                      username:@"YOUR TUMBLR USERNAME"
                                      password:@"YOUR TUMBLR PASSWORD"
                                       success:^(AFXAuthToken *accessToken) {
                                           NSLog(@"Success = %@", accessToken);

                                           // Now let's request profile information
                                           //
                                           NSMutableURLRequest *request = [client requestWithMethod:@"POST" path:@"/v2/user/info" parameters:nil];
                                           AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                               NSLog(@"Info: %@", JSON);
                                           } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                               NSLog(@"Error: %@", error);
                                           }];
                                           [client enqueueHTTPRequestOperation:operation];
                                       } failure:^(NSError *error) {
                                           NSLog(@"Error: %@", error);
                                       }];
```

## Contact

Roman Efimov

- https://github.com/romaonthego
- https://twitter.com/romaonthego
- romefimov@gmail.com

## License

AFXAuthClient is available under the MIT license.

Copyright © 2013 Roman Efimov.

Based on AFOAuth1Client, copyright (c) 2011 Mattt Thompson (http://mattt.me/) and TwitterXAuth, copyright (c) 2010 Eric Johnson (https://github.com/ericjohnson)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
