//
//  ViewController.m
//  HiChat
//
//  Created by Enzo Augusto on 12/12/19.
//  Copyright © 2019 Enzo Augusto. All rights reserved.
//

#import "ChatIniciarPermissoes.h"
#import "ChatWeb.h"

@interface ChatIniciarPermissoes ()

@end

@implementation ChatIniciarPermissoes

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)actIniciarAtendimento:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Chat" bundle:nil];
    UINavigationController *chat = [storyboard instantiateViewControllerWithIdentifier:@"ChatWebNav"];
    [self presentViewController:chat animated:YES completion:nil];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    if([self presentedViewController] != nil)
    {
        [super dismissViewControllerAnimated:flag completion:completion];
    }
}
@end
