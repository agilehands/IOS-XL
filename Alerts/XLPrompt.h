//
//  XLPrompt.h
//
//  Created by Shaikh Sonny Aman on 1/8/12.
//  Copyright 2012 Xapplab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLPrompt : NSObject <UITextFieldDelegate, UIAlertViewDelegate> {
	void (^promptAction) (NSString* text, BOOL didCanceled );
}
@property(strong) UITextField* tfPrompt;
@property(strong) UIAlertView* alert;

- (void) promptWithTitle: (NSString*) title
		 placeHolderText: (NSString*) placeHolder
				 action : (void (^) (NSString* text, BOOL didCanceled)) action;

@end
