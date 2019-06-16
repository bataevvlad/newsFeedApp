//
//  Helper.h
//  newsFeedApp
//
//  Created by Admin on 12.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Helper : NSObject

+ (Helper *)sharedInstance;

- (UIImage*)getImageFromURL:(NSString*)URL forSize:(int)size;
- (void)fetchDataWithUrl:(NSString*)urlString withView:(UIView*)view andHandler:(void (^)(NSDictionary * json))callback;

@end
