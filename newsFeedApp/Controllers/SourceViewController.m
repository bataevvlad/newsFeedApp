//
//  SourceViewController.m
//  newsFeedApp
//
//  Created by Admin on 14.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import "SourceViewController.h"
#import "ViewController.h"
#import "WebViewController.h"
#import "SWRevealViewController.h"
#import "Helper.h"
#import "Article.h"
#import "Sources.h"
#import "ArticleCell.h"
#import "Links.h"

@interface SourceViewController ()

@end

static NSString *simpleTableIdentifier = @"Cell";
static NSString *vc = @"viewController";


@implementation SourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tablView.delegate = self;
    self.tablView.dataSource = self;
    
    self.sources = [[NSMutableArray alloc] init];

    [self fetchData];
    [self.tablView endUpdates];
}

- (void)fetchData {
    
    Helper * utils = [Helper sharedInstance];
    
    [utils fetchDataWithUrl:SOURCES_URL withView:self.view andHandler:^(NSDictionary * json) {
        
        [self processSources:[json objectForKey:@"sources"] andHandler:^() {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tablView reloadData];
            });
        }];
    }];
}

- (void)processSources:(NSArray *)sources andHandler:(void (^)(void))callback{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        int i = 0;
        
        for (id object in sources) {
            Sources * source = [[Sources alloc] initWithDictionary:object];
            [self.sources addObject:source];
            i++;
        }
        
        callback();
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    self.articles = nil;
    self.collectionView = nil;
    self.sources = nil;
    self.tablView = nil;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue isKindOfClass:[SWRevealViewControllerSegueSetController class] ]) {
        
        UIViewController *dvc = [segue destinationViewController];
        UINavigationController *navCtrl = (UINavigationController *) self.revealViewController.frontViewController;
        [navCtrl setViewControllers:@[dvc] animated:NO];
        [self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    }


    if ([segue.identifier isEqualToString:@"showSourceDetail"]) {
        NSIndexPath *indexPath = [self.tablView indexPathForSelectedRow];
        ViewController *destViewController = segue.destinationViewController;
        Sources* source = [self.sources objectAtIndex:indexPath.row];
        [destViewController setSource:source];
    }

}

#pragma mark - UITableView DataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.sources count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 40;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
        
        Sources * source = [self.sources objectAtIndex:indexPath.row];
        
        cell.textLabel.text = source.name;
        
        return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showSourceDetail" sender:self];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 48;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

@end
