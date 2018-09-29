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
    
    /*
     运行效果的前提
     1. PROJECT -> MasonryLeadingTrailing -> Info -> Localizations；
     2. 点击 “+”，添加 Arabic 语言；
     3. Edit Scheme -> Options -> Application Language -> Arabic。
    
     在模拟器运行即可看到阿拉伯语言的效果，不需要在模拟器系统里面设置【语言与地区】为阿拉伯语。
    */
    
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
