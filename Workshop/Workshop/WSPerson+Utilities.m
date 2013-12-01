//
//  WSPerson+Utilities.m
//  Workshop
//
//  Created by Hugo Tunius on 30/11/13.
//  Copyright (c) 2013 Hugo Tunius. All rights reserved.
//

#import "WSPerson+Utilities.h"

@implementation WSPerson (Utilities)
- (NSString*) fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString*)  firstCharacterInFirstName {
    return [self.firstName substringToIndex:1];
}
@end
