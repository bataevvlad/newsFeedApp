//
//  Article.h
//  newsFeedApp
//
//  Created by Admin on 12.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Article : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *descr;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) UIImage  *image;

- (id)initWithDictionary:(NSDictionary*)dict;

@end
