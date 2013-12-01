//
//  WSAddContactViewController.m
//  Workshop
//
//  Created by Hugo Tunius on 01/12/13.
//  Copyright (c) 2013 Hugo Tunius. All rights reserved.
//

#import "WSAddContactViewController.h"

#import "WSPerson.h"
#import "WSAppDelegate.h"

@interface WSAddContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameCell;
@property (weak, nonatomic) IBOutlet UITextField *lastNameCell;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberCell;

@property (weak, nonatomic) NSManagedObjectContext *moc;
@end

@implementation WSAddContactViewController
@synthesize firstNameCell   = _firstNameCell;
@synthesize lastNameCell    = _lastNameCell;
@synthesize phoneNumberCell = _phoneNumberCell;

@synthesize moc             = _moc;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    WSAppDelegate *delegate = (WSAppDelegate*)[[UIApplication sharedApplication] delegate];
    self.moc = delegate.managedObjectContext;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtonPressed:(id)sender {
    WSPerson *person = (WSPerson*)[NSEntityDescription
                                   insertNewObjectForEntityForName:@"WSPerson"
                                            inManagedObjectContext:self.moc];
    
    person.firstName    = self.firstNameCell.text;
    person.lastName     = self.lastNameCell.text;
    person.phoneNumber  = self.phoneNumberCell.text;
    
    //TODO: Handle this error
    [self.moc save:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
