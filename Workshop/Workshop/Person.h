//
//  Person.h
//  Workshop
//
//  Created by Hugo Tunius on 30/11/13.
//  Copyright (c) 2013 Hugo Tunius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * dateOfBirth;
@property (nonatomic, retain) NSString * phoneNumber;

@end
