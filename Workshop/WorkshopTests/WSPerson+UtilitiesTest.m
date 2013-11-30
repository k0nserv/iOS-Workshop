//
//  WSPerson+UtilitiesTest.m
//  Workshop
//
//  Created by Hugo Tunius on 30/11/13.
//  Copyright (c) 2013 Hugo Tunius. All rights reserved.
//

@import XCTest;
#import "WSPerson+Utilities.h"

@interface WSPerson_UtilitiesTest : XCTestCase
@property (nonatomic, strong) NSManagedObjectContext *moc;
@end

@implementation WSPerson_UtilitiesTest
@synthesize moc = _moc;

- (void)setUp
{
    [super setUp];

    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle bundleForClass:[WSPerson class]]]];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    XCTAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    self.moc = [[NSManagedObjectContext alloc] init];
    self.moc.persistentStoreCoordinator = psc;

}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void) testFullName {
    WSPerson *person = [	NSEntityDescription insertNewObjectForEntityForName:@"WSPerson" inManagedObjectContext:self.moc];
    NSString *firstName = @"Test";
    NSString *lastName  = @"Testsson";
    
    person.firstName = firstName;
    person.lastName  = lastName;
    NSString *fullName = [person fullName];
    NSString *expected = [NSString stringWithFormat:@"%@ %@", person.firstName, person.lastName];
    
    XCTAssertEqualObjects(fullName, expected);
}
@end
