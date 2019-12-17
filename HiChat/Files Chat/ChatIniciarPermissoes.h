//
//  ViewController.h
//  HiChat
//
//  Created by Enzo Augusto on 12/12/19.
//  Copyright © 2019 Enzo Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatIniciarPermissoes : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnIniciarAtendimento;

- (IBAction)actIniciarAtendimento:(UIButton *)sender;
- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;

@end

