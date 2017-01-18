//
//  ViewController.h
//  DataInterchange
//
//  Created by wanghuiyong on 08/11/2016.
//  Copyright © 2016 wanghuiyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tvParseResult;
- (IBAction)onParseJson:(id)sender;

@end

