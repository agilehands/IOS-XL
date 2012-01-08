//
//  XL.m
//
//  Created by Shaikh Sonny Aman on 1/8/12.
//  Copyright 2012 Xapplab. All rights reserved.
//

#import "XL.h"
#import "XLAlert.h"
#import "XLPrompt.h"

@interface XL(Private)
+ (XLAlert*) xlalert;
@end

@implementation XL

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


#pragma XLAlert methods
static XLAlert* alert = nil;
+ (XLAlert*) xlalert{
	if ( !alert ) {
		alert = [XLAlert new];
	}
	
	return alert;
}
+ (void) alertWithTitle: (NSString*) title
			description: (NSString*) message
			 action	   : (void (^) (int buttonIndex, int cancelButtonIndex)) action
		   cancelButton: (NSString*) textOrNil
		   otherButtons: (NSString*) firstButtonText, ...{
	
	NSMutableArray* buttons = [NSMutableArray new];
	
	va_list args;
    va_start(args, firstButtonText);
    for (NSString *arg = firstButtonText; arg != nil; arg = va_arg(args, NSString*)){
		[buttons addObject:arg];
    }
    va_end(args);
	
	[[XL xlalert] alertWithTitle:title 
					 description:message 
						  action:action 
					cancelButton:textOrNil 
					otherButtons:buttons];
}

#pragma mark XLPrompt
static XLPrompt* prompt = nil;
+ (XLPrompt*) prompt{
	if ( !prompt ) {
		prompt = [XLPrompt new];
	}
	
	return prompt;
}
+ (void) promptWithTitle: (NSString*) title
		 placeHolderText: (NSString*) placeHolder
				 action : (void (^) (NSString* text, BOOL didCanceled)) action{
	[[XL prompt] promptWithTitle:title 
			placeHolderText:placeHolder
					 action:action];
}
@end
