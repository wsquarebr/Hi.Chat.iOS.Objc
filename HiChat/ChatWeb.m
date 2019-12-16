//
//  ViewController.m
//  HiChat
//
//  Created by Enzo Augusto on 12/12/19.
//  Copyright © 2019 Enzo Augusto. All rights reserved.
//

#import "ChatWeb.h"


@interface ChatWeb ()


@end

@implementation ChatWeb



- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Read plist from bundle and get Root Dictionary out of it
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Chat" ofType:@"plist"]];
    
    // Your dictionary contains an array of dictionary
    // Now pull an Array out of it.
    NSArray *arrayList = [NSArray arrayWithArray:[dictRoot objectForKey:@"Url"]];
    
    // Now a loop through Array to fetch single Item from catList which is Dictionary
    [arrayList enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
        // Fetch Single Item
        // Here obj will return a dictionary
        NSString *Url= ((void)(@"Url : %@"),[obj valueForKey:@"BotUrl"]);
        self->_WebChat.delegate = self;
        [self->_WebChat loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:Url]]];
    }];
    
    
  
    
}


- (BOOL)webView:(UIWebView *)_webChatView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([self requestIsDownloadable:request])
    {
        [[UIApplication sharedApplication] openURL:request.URL];
        
        return NO;
    }
    
    
    return YES;
}

- (BOOL)requestIsDownloadable: (NSURLRequest *)request
{
    NSString *requestString = [[request URL] absoluteString];
    NSString *fileType = [requestString pathExtension];
    NSLog(@"FileType: %@", fileType);
    BOOL *isDownloadable = (
                            ([fileType caseInsensitiveCompare:@"zip"] == NSOrderedSame) ||
                            ([fileType caseInsensitiveCompare:@"rar"] == NSOrderedSame) ||
                            ([fileType caseInsensitiveCompare:@"jpeg"] == NSOrderedSame) ||
                            ([fileType caseInsensitiveCompare:@"pdf"] == NSOrderedSame) ||
                            ([fileType caseInsensitiveCompare:@"docx"] == NSOrderedSame) ||
                            ([fileType caseInsensitiveCompare:@"jpg"] == NSOrderedSame) ||
                            ([fileType caseInsensitiveCompare:@"png"] == NSOrderedSame)
                            );
    
    return isDownloadable;
}

- (IBAction)actBtnFechar:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    
}
@end
