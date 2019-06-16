//
//  SourceViewController.h
//  newsFeedApp
//
//  Created by Admin on 14.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SourceViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSArray * articles;
@property NSMutableArray * sources;
@property (weak, nonatomic) IBOutlet UITableView *tablView;
@property (weak, nonatomic) UICollectionView * collectionView;

@end
