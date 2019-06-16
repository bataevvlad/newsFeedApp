//
//  Sources.m
//  newsFeedApp
//
//  Created by Admin on 12.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import "Sources.h"


@implementation Sources

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
        NSLog(@"Article: %@",dict);
        
        if(dict[@"id"] != (id)[NSNull null]){
            _sourceId = dict[@"id"];
        }else{
            _sourceId = @"";
        }
        if(dict[@"name"] != (id)[NSNull null]){
            _name = dict[@"name"];
        }else{
            _name = @"";
        }
        
        if(dict[@"description"] != (id)[NSNull null]){
            _descript = dict[@"description"];
        }else{
            _descript = @"";
        }
        
        if(dict[@"url"] != (id)[NSNull null]){
            _url = dict[@"url"];
        }else{
            _url = @"";
        }
        
        if(dict[@"category"] != (id)[NSNull null]){
            _category = dict[@"category"];
        }else{
            _category = @"";
        }
        
        if(dict[@"language"] != (id)[NSNull null]){
            _language = dict[@"language"];
        }else{
            _language = @"";
        }
        
        if(dict[@"sortBysAvailable"] != (id)[NSNull null]){
            _sortBysAvailable = dict[@"sortBysAvailable"];
        }else{
            _sortBysAvailable = @[];
        }
        
    }
    
    return self;
}


@end
