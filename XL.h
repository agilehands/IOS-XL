//
//  XL.h
//
//  Created by Shaikh Sonny Aman on 1/8/12.
//  Copyright 2012 Xapplab. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XL : NSObject

/**
 * Shows a UIAlertView similar with a block as callback
 *
 * @param title Title of the alert box
 * @param message Descriptive message
 * @param cancelButton Text for the cancel button, pass nil if no cancel button is intendend
 * @param otherButtons Give other button titles
 * @param action action block. touched button index and cancelButtonIndex is passed as argument
 *
 * @example
 * Simple one line code as shown below:
 * <code>
 *	[XL alertWithTitle:@"Title" 
 *			description:@"Some message description" 
 *				 action:^(int buttonIndex, int cancelButtonIndex) {
 *							if( buttonIndex == cancelButtonIndex ) { // cancel button touched
 *								NSLog(@"Cancel button touched");
 *							} else { // yes button touched
 *								NSLog(@"Yes button touched");
 *							}// end of else if
 *						}// end of block 
 *		  cancelButton:@"Cancel" 
 *		  otherButtons:@"Yes", nil];
 * </code>
 */
+ (void) alertWithTitle: (NSString*) title
			description: (NSString*) message
			 action	   : (void (^) (int buttonIndex, int cancelButtonIndex)) action
		   cancelButton: (NSString*) textOrNil
		   otherButtons: (NSString*) firstButtonText, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * Shows a UIAlertView with a UITextField. A block is used as callback.
 *
 * @param title Title of the alert box
 * @param placeHolder Place holder text for the UITextField
 * @param action Callback block. text of the UITextField is passed along with a boolean value
 *			indicating if the user cancelled
 *
 * @example
 * <code>
 *  [XL promptWithTitle:@"Some title" 
 *		placeHolderText:@"Place holder text" 
 *				 action:^(NSString* text,BOOL didCanceled){
 *							if( !didCanceled ) {
 *								NSLog("Text: %@", text);
 *							} else {
 *								NSLog("Cancelled");
 *							}
 *						}// end of block
 * ];
 * </code>
 */
+ (void) promptWithTitle: (NSString*) title
			placeHolderText: (NSString*) placeHolder
			 action : (void (^) (NSString* text, BOOL didCanceled)) action;

@end
