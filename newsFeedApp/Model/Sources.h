//
//  Sources.h
//  newsFeedApp
//
//  Created by Admin on 12.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sources : NSObject

@property (strong, nonatomic) NSString * sourceId;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * descript;
@property (strong, nonatomic) NSString * url;
@property (strong, nonatomic) NSString * category;
@property (strong, nonatomic) NSString * language;
@property (strong, nonatomic) NSArray * sortBysAvailable;

- (id)initWithDictionary:(NSDictionary*)dict;

@end
