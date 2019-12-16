//
//  ViewController.h
//  HiChat
//
//  Created by Enzo Augusto on 12/12/19.
//  Copyright © 2019 Enzo Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebKit/WebKit.h"

@interface ChatWeb : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *WebChat;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnFechar;

- (IBAction)actBtnFechar:(id)sender;


@end

