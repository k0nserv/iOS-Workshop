//
//  WSMainViewController.m
//  Workshop
//
//  Created by Hugo Tunius on 30/11/13.
//  Copyright (c) 2013 Hugo Tunius. All rights reserved.
//

#import "WSMainViewController.h"
#import "WSAppDelegate.h"

#import "WSPerson.h"
#import "WSPerson+Utilities.h"

@interface WSMainViewController ()
@property (nonatomic, strong) NSFetchedResultsController *resultController;
@end

@implementation WSMainViewController
@synthesize resultController = _resultController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WSAppDelegate *appDelegate = (WSAppDelegate*)[[UIApplication sharedApplication] delegate];
    
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    fetchRequest.entity = [NSEntityDescription entityForName:@"WSPerson" inManagedObjectContext:context];
    
    self.resultController = [[NSFetchedResultsController alloc]
                                    initWithFetchRequest:fetchRequest
                                    managedObjectContext:context
                                      sectionNameKeyPath:@"firstCharacterInFirstName"
                                               cacheName:@"WSPersonCache"];
    
    NSError *error;
    BOOL success = [self.resultController performFetch:&error];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return self.resultController.sections.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.resultController.sections.count > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [self.resultController.sections objectAtIndex:section];
        return [sectionInfo numberOfObjects];
    }
    else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"WSPersonCell"];
    WSPerson *managedObject = (WSPerson*)[self.resultController objectAtIndexPath:indexPath];
    
    
    cell.textLabel.text = [managedObject fullName];
    cell.detailTextLabel.text = [managedObject phoneNumber];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.resultController.sections.count > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [self.resultController.sections objectAtIndex:section];
        return [sectionInfo name];
    } else
        return nil;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.resultController.sectionIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [self.resultController sectionForSectionIndexTitle:title atIndex:index];
}
@end
