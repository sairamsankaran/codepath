//
//  ToDoListTableViewController.m
//  toDoList
//
//  Created by Sairam Sankaran on 10/11/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItemCell.h"
#import "ToDoListItemStore.h"

@interface ToDoListTableViewController ()

- (void)addNewItem:(id)sender;

@end

@implementation ToDoListTableViewController {
    int indexOfLastAddedItem;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"To Do List";
    }
    
//    for (int i = 0; i < 5; i++) {
//        [[ToDoListItemStore sharedStore] createItem:@"Sairam Sankaran"];
//    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create nib with cell nib. Use same name
    UINib *toDoItemNib = [UINib nibWithNibName:@"ToDoItemCell" bundle:nil];
    // register this newly created nib with the table view
    [self.tableView registerNib:toDoItemNib forCellReuseIdentifier:@"toDoItemCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *newToDoItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self
                                                                                 action:@selector(addNewItem:)];
    self.navigationItem.rightBarButtonItem = newToDoItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[ToDoListItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoItemCell" forIndexPath:indexPath];
    
    NSString *item = [[[ToDoListItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    cell.toDoItemTextField.text = item;
    
    if ([indexPath row] == indexOfLastAddedItem) {
        [cell.toDoItemTextField becomeFirstResponder];
    }
    
    // Set the delegate of text field item to be this table view controller
    cell.toDoItemTextField.delegate = self;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableString *item = [[[ToDoListItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
        // Delete the row from the data source
        [[ToDoListItemStore sharedStore] removeItem:item];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [[ToDoListItemStore sharedStore] moveItemAtIndex:[fromIndexPath row]
                                             toIndex:[toIndexPath row]];
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    int totalNumberOfItems = (int)[[[ToDoListItemStore sharedStore] allItems] count];
    // Get the shared store. Get all the items already in store. Get the last item. Set its string to be the user enrty
    [[[[ToDoListItemStore sharedStore] allItems] objectAtIndex:totalNumberOfItems-1] setString:textField.text];
    [textField resignFirstResponder];
    return YES; // do default behaviour when user presses done/return
}

- (void)addNewItem:(id)sender {
    //NSLog(@"Added new item");
    // Create new item in datastore with empty task
    NSString *newItem = [[ToDoListItemStore sharedStore] createItem:[NSMutableString stringWithString:@""]];
    // Commenting this because we reloading view instead ot inserting
    int newRow = (int)[[[ToDoListItemStore sharedStore] allItems] indexOfObject:newItem];
    indexOfLastAddedItem = newRow;
    //[[[ToDoListItemStore sharedStore] allItems] indexOfObject:newItem];
    //[[self tableView] reloadData];
    
    NSIndexPath *ip = [NSIndexPath indexPathForRow:newRow inSection:0];
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObjects:ip, nil]
                            withRowAnimation:UITableViewRowAnimationBottom];
    
}

@end
