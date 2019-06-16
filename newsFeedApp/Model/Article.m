//
//  Article.m
//  newsFeedApp
//
//  Created by Admin on 12.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import "Article.h"
#import "Helper.h"

@implementation Article

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (id)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    
    if (self) {
        Helper * util = [[Helper alloc] init];
        
        if(dict[@"author"] != (id)[NSNull null]){
            _author = dict[@"author"];
        }else{
            _author = @"Unknown";
        }
        if(dict[@"title"] != (id)[NSNull null]){
            _title = dict[@"title"];
        }else{
            _title = @"";
        }
        
        if(dict[@"description"] != (id)[NSNull null]){
            _descr = dict[@"description"];
        }else{
            _descr = @"";
        }
        
        if(dict[@"url"] != (id)[NSNull null]){
            _url = dict[@"url"];
        }else{
            _url = @"";
        }
        
        if(dict[@"urlToImage"] != (id)[NSNull null]){
            _imageUrl = dict[@"urlToImage"];
            _image = [util getImageFromURL:_imageUrl forSize:40];
            
        }else{
            _image = [UIImage imageNamed:@"news-placeholder"];
            _imageUrl = @"";
        }
    }
    
    return self;
}

@end
