//
//  FUATableViewController.m
//  TodoApp
//
//  Created by Therin Irwin on 10/15/13.
//  Copyright (c) 2013 Therin Irwin. All rights reserved.
//

#import "FUATableViewController.h"
#import "FUATableCell.h"

@interface FUATableViewController ()
{
    NSMutableArray *todos;
    NSString *path;
}
@end

@implementation FUATableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    path = [[self applicationDocumentsPath] stringByAppendingPathComponent:@"todo.items"];
    [self loadTodoItems];
    
    UINib *nibby = [UINib nibWithNibName:@"FUATableCell" bundle:nil];
    [self.tableView registerNib:nibby forCellReuseIdentifier:@"FUATableCell"];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTodoItem)];
}

- (void)loadTodoItems
{
    todos = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if (!todos) {
        todos = [[NSMutableArray alloc] init];
    }
}

- (BOOL)saveTodoItems
{
    return [NSKeyedArchiver archiveRootObject:todos toFile:path];
}

- (NSString *)applicationDocumentsPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (void)editTodoItemAtCell:(UITableViewCell *)tableCell withText:(NSString*)text
{
    NSIndexPath *idxPath = [self.tableView indexPathForCell:tableCell];
    int index = [idxPath indexAtPosition:[idxPath length] - 1];
    [todos setObject:text atIndexedSubscript:index];
}

- (void)addTodoItem
{
    static int ordinal = 1;
    [todos addObject:@"New Todo Item"];
    [self.tableView reloadData];
    ordinal++;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self saveTodoItems];
}

- (IBAction)onTap:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FUATableCell";
    FUATableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.delegate = self;
    cell.textField.text = [todos objectAtIndex:[indexPath indexAtPosition:[indexPath length] - 1]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [todos removeObjectAtIndex:[indexPath indexAtPosition:[indexPath length] - 1]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    int saneStartIndex = [fromIndexPath indexAtPosition:[fromIndexPath length] - 1];
    int saneEndIndex = [toIndexPath indexAtPosition:[toIndexPath length] - 1];
    
    id object = [todos objectAtIndex:saneStartIndex];
    [todos removeObjectAtIndex:saneStartIndex];
    [todos insertObject:object atIndex:saneEndIndex];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.editing) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleNone;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
