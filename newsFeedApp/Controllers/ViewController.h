//
//  ViewController.h
//  newsFeedApp
//
//  Created by Admin on 11.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sources.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;

@property (strong, nonatomic) NSMutableArray *articles;
@property (strong, nonatomic) NSString *url;

@property (weak, nonatomic) Sources * source;

@end

