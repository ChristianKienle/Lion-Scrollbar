//
//  Lion_ScrollbarAppDelegate.m
//  Lion Scrollbar
//
//  Created by Christian Kienle on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lion_ScrollbarAppDelegate.h"

@implementation Lion_ScrollbarAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
   NSUInteger count = 100;
   while(count--) {
      NSDictionary *person = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"Person %lu", count], @"firstName", nil];
      [arrayController addObject:person];
   }
}

@end
