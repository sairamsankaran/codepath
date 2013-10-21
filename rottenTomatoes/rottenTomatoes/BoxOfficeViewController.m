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
@property (nonatomic, strong) NSArray *movies;

@end

@implementation BoxOfficeViewController

// storyboard does not call this initializer
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// storyboard calls this initializer instead
- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        RottenTomatoesClient *client = [[RottenTomatoesClient alloc] init];
        //[client boxOffice];
        [client boxOfficeWithSuccess:^(AFHTTPRequestOperation *operation, NSArray *movies) {
            self.movies = movies;
            [self.tableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.description delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }];
        }
    return self;
}

- (void)viewDidLoad // could be called several times by the view controller
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
    return [self.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCellIdentifier" forIndexPath:indexPath];
    cell.movie = self.movies[indexPath.row];
//    cell.titleLabel.text = @"Star Wars";
//    cell.castLabel.text = @"Harrison Ford";
//    NSLog(@"Movie title from VC: %@", [[MovieDataStore sharedStore] boxOfficeMovies]);
//    cell.titleLabel.text = [[[MovieDataStore sharedStore] boxOfficeMovies] objectAtIndex:[indexPath row]];
//    cell.castLabel.text = @"Harrison Ford";

    return cell;
}

@end
