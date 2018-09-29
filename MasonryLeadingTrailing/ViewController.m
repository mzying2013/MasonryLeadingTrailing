//
//  ViewController.m
//  MasonryLeadingTrailing
//
//  Created by liu on 2018/9/29.
//  Copyright © 2018年 mzying.com. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()
@property (nonatomic,strong) UILabel * nameLabel;
@property (nonatomic,strong) UIView * lineView;
@property (nonatomic,strong) UIButton * btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.btn];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel.superview);
        make.leading.equalTo(self.nameLabel.superview).offset(20);
        make.width.mas_equalTo(100);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.centerX.equalTo(self.lineView.superview);
        make.leading.greaterThanOrEqualTo(self.nameLabel.mas_trailing);
        make.width.mas_equalTo(1);
        make.top.equalTo(self.nameLabel).offset(-20);
    }];

    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lineView);
        make.leading.greaterThanOrEqualTo(self.lineView.mas_trailing);
        make.trailing.equalTo(self.btn.superview.mas_trailing).offset(-20);
    }];
}


#pragma mark - Property Method
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"Name Text";
        _nameLabel.backgroundColor = [UIColor blackColor];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}



-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor redColor];
    }
    return _lineView;
}


-(UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitle:@"I'm Button" forState:UIControlStateNormal];
        [_btn setBackgroundColor:[UIColor grayColor]];
    }
    return _btn;
}





@end
