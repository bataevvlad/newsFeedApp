//
//  ViewController.m
//  newsFeedApp
//
//  Created by Admin on 11.06.19.
//  Copyright © 2019 bataevvlad. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "SourceViewController.h"
#import "WebViewController.h"

#import "Links.h"
#import "Article.h"
#import "ArticleCell.h"
#import "Helper.h"
#import "Sources.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)configureView {
    if (self.source) {
        self.url = [NSString stringWithFormat:@"%@?source=%@&apiKey=%@",ARTICLES_URL,self.source.sourceId,API_KEY];
    }
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.articles = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self configureView];
    self.title = self.source.name;
    
    self.articles = [[NSMutableArray alloc] init];
    
    [self menuAction];
    [self fetchNewsUsingJSON];
}

#pragma mark Fetching Data

- (void)fetchNewsUsingJSON{

    Helper *utility = [Helper sharedInstance];
    
    [utility fetchDataWithUrl:self.url withView:self.view andHandler:^(NSDictionary *json) {
        
        NSArray * articles = [json objectForKey:@"articles"];
        
        for (id object in articles){
            Article * article = [[Article alloc] initWithDictionary:object];
            [self.articles addObject:article];
        }
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.articles = nil;
}


#pragma mark TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.articles count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"articleCell";
    
    ArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[ArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Article *article = [self.articles objectAtIndex:indexPath.row];
    
    cell.title.text = article.title;
    cell.descript.text = article.descr;
    cell.author.text = article.author;
    cell.imgView.image = [UIImage imageNamed:@"news-placeholder"];
    cell.imgView.contentMode = UIViewContentModeScaleAspectFill;
    cell.imgView.layer.cornerRadius = cell.imgView.frame.size.width / 2;
    cell.imgView.layer.masksToBounds = YES;

    if (article.image) {
        cell.imgView.image = article.image;
    }
    return cell;
}

#pragma mark Managing details

- (void)setSource:(Sources*)source {
    if (_source != source) {
        _source = source;
        [self configureView];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showWebView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WebViewController *destViewController = segue.destinationViewController;
        Article * article = [self.articles objectAtIndex:indexPath.row];
        [destViewController setArticle:article];
    }
}

#pragma mark Menu Action

- (void) menuAction {
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

@end
