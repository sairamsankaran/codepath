//
//  BoxOfficeViewController.m
//  rottenTomatoes
//
//  Created by Sairam Sankaran on 10/18/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import "BoxOfficeViewController.h"
#import "MovieCell.h"
#import "RottenTomatoesClient.h"
#import "MovieDataStore.h"

@interface BoxOfficeViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BoxOfficeViewController

// storyboard does not call this initializer
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    NSLog(@"In initWithNibName");
    return self;
}

// storyboard calls this initializer instead
- (id) initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"In initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        RottenTomatoesClient *client = [[RottenTomatoesClient alloc] init];
        [client boxOffice];
    }
    return self;
}

- (void)viewDidLoad // could be called several times by the view controller
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    NSLog(@"In viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Table View Methods

- (int)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"In tableView:cellForRowAtIndexPath");
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCellIdentifier"];
    cell.titleLabel.text = @"Star Wars";
    cell.castLabel.text = @"Harrison Ford";
    NSLog(@"Movie title from VC: %@", [[MovieDataStore sharedStore] boxOfficeMovies]);
//    cell.titleLabel.text = [[[MovieDataStore sharedStore] boxOfficeMovies] objectAtIndex:[indexPath row]];
//    cell.castLabel.text = @"Harrison Ford";

    return cell;
}

@end
