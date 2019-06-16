//
//  WebViewController.h
//  newsFeedApp
//
//  Created by Admin on 12.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "Article.h"


@interface WebViewController : UIViewController <WKNavigationDelegate>

@property (strong, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) Article *article;
@property (strong, nonatomic) NSString *url;

@end
