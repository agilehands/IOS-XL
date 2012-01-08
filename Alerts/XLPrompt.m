//
//  XLPrompt.m
//
//  Created by Shaikh Sonny Aman on 1/8/12.
//  Copyright 2012 Xapplab. All rights reserved.
//

#import "XLPrompt.h"

@implementation XLPrompt

@synthesize tfPrompt, alert;
- (id)init
{
    self = [super init];
    if (self) {
		self.alert = [[UIAlertView alloc] initWithTitle:@"" 
												message:@"\n\n" 
											   delegate:self 
									  cancelButtonTitle:@"Cancel" 
									  otherButtonTitles:@"Done", nil];
		tfPrompt = [[UITextField alloc] init];
		tfPrompt.delegate = self;
    }
    
    return self;
}

- (void) promptWithTitle: (NSString*) title
		 placeHolderText: (NSString*) placeHolder
				 action : (void (^) (NSString* text, BOOL didCanceled)) action{
	promptAction = action;
	[alert setTitle:title];
	tfPrompt.placeholder = placeHolder;
	[alert show];
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	[alert dismissWithClickedButtonIndex:1 animated:YES];
	return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
	return  YES;
}

#pragma mark UIAlertViewDelegate
- (void)willPresentAlertView:(UIAlertView *)alertView{
	alertView.frame = CGRectMake( 18, 62, alertView.frame.size.width, alertView.frame.size.height);
	[alertView addSubview:tfPrompt];
	[alertView bringSubviewToFront:tfPrompt];
	tfPrompt.text = @"";
	tfPrompt.textColor = [UIColor blackColor];
	tfPrompt.backgroundColor = [UIColor whiteColor];
	tfPrompt.borderStyle = UITextBorderStyleRoundedRect;
	tfPrompt.frame = CGRectMake(27, 52, 230, 28);
}
- (void)didPresentAlertView:(UIAlertView *)alertView{
	NSLog(@"%f, %f", alertView.frame.origin.x, alertView.frame.origin.y);
	[tfPrompt becomeFirstResponder];
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
	NSLog(@"Button index= %d, NO of buttons:%d", buttonIndex, alertView.numberOfButtons);
	switch (buttonIndex) {
		case 0:
			promptAction( tfPrompt.text, YES );
			break;
		case 1:
			promptAction( tfPrompt.text, NO );
			break;
		default:
			break;
	}
}

@end
