//
//  Helper.m
//  newsFeedApp
//
//  Created by Admin on 12.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (instancetype)sharedInstance {
    static Helper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Helper alloc] init];
    });
    return sharedInstance;
}

- (void)fetchDataWithUrl:(NSString*)urlString withView:(UIView*)view andHandler:(void (^)(NSDictionary * json))callback{

    NSURL *url = [NSURL URLWithString:urlString];

    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url
                                          completionHandler:^(NSData *data,
                                                              NSURLResponse *response,
                                                              NSError *error) {
                                              if(data){
                                                  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                                                      NSError* err = [[NSError alloc] init];
                                                      NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                                                                            options:kNilOptions
                                                                                                              error:&err];
                                                      dispatch_async(dispatch_get_main_queue(), ^{
                                                          if([json[@"status"]  isEqual: @"ok"]){
                                                              callback(json);
                                                          }else{
                                                              //handle error
                                                              NSLog(@"JSON ERROR: %@", json[@"status"] );
                                                          }
                                                      });
                                                  });
                                              }
                                          }];
    [downloadTask resume];
}

- (UIImage*)getImageFromURL:(NSString*)URL forSize:(int)size{
    
    UIImage * image = [[UIImage alloc] init];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:URL]];
    image = [UIImage imageWithData: imageData];
    //CGSize itemSize = CGSizeMake(size, size);
    //UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    //CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    //[image drawInRect:imageRect];
    //image = UIGraphicsGetImageFromCurrentImageContext();
    //UIGraphicsEndImageContext();
    
    return image;
}

@end
