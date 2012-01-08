//
//  XLAlert.h
//
//  Created by Shaikh Sonny Aman on 1/8/12.
//  Copyright 2012 Xapplab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XLAlert.h"


@interface XLAlert : NSObject<UIAlertViewDelegate>{
	void (^anyAction)(int buttonIndex, int cancelButtonIndex);
	UIAlertView* alert;
}
- (void) alertWithTitle: (NSString*) title
			description: (NSString*) message
			 action	   : (void (^) (int buttonIndex, int cancelButtonIndex)) action
		   cancelButton: (NSString*) textOrNil
		   otherButtons: (NSArray*) otherButtons;
@end
