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
    
    [self.WebChat setNavigationDelegate:self];
    
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
        [self.WebChat loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:Url]]];
    }];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler;
{
    if ([self requestIsDownloadable:navigationAction.request])
    {
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
    }

    decisionHandler(WKNavigationActionPolicyAllow);
}

- (BOOL)requestIsDownloadable: (NSURLRequest *)request
{
    NSString *requestString = [[request URL] absoluteString];
    NSString *fileType = [requestString pathExtension];
    NSLog(@"FileType: %@", fileType);
    BOOL isDownloadable = (([fileType caseInsensitiveCompare:@"txt"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"doc"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"docx"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"ppt"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"pps"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"pdf"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"xls"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"xlsx"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"html"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"json"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"jpeg"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"jpg"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"png"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"gif"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"mp3"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"avi"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"mid"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"mpg"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"mp4"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"zip"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"rar"] == NSOrderedSame) ||
                           ([fileType caseInsensitiveCompare:@"gif"] == NSOrderedSame));
    
    return isDownloadable;
}

- (IBAction)actBtnFechar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
