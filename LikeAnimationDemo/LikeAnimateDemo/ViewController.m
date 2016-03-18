//
//  ViewController.m
//  LikeAnimateDemo
//
//  Created by 罗成 on 16/3/11.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
#import "UIButton+Common.h"
@interface ViewController ()
- (IBAction)clickLikeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (assign, nonatomic) BOOL flag;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.likeBtn setImage:[UIImage imageNamed:@"tweet_btn_like"] forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickLikeAction:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    
    btn.selected = !btn.selected;
    
    if (btn.selected) {
           [self.likeBtn setImage:[UIImage imageNamed:@"tweet_btn_like"] forState:UIControlStateNormal];
    }else {
            [self.likeBtn animateToImage:@"tweet_btn_liked"];
    }
    
}



@end
