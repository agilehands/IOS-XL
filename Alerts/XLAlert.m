//
//  XLAlert.m
//
//  Created by Shaikh Sonny Aman on 1/8/12.
//  Copyright 2012 Xapplab. All rights reserved.
//

#import "XLAlert.h"

@implementation XLAlert

- (id)init
{
    self = [super init];
    
    return self;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
	anyAction (buttonIndex, alertView.cancelButtonIndex);
}
- (void) alertWithTitle: (NSString*) title
			description: (NSString*) message
			 action	   : (void (^) (int buttonIndex, int cancelButtonIndex)) action_
		   cancelButton: (NSString*) textOrNil
		   otherButtons: (NSArray*) otherButtons{
	anyAction = action_;
	
	alert = [[UIAlertView alloc] initWithTitle:title 
									   message:message 
									  delegate:self 
							 cancelButtonTitle:textOrNil 
							 otherButtonTitles:nil];
	
	for (NSString* text in otherButtons) {
		NSLog(@"%d)Added button %@",[alert addButtonWithTitle:text], text);
	}
    
	[alert show];
}

@end
