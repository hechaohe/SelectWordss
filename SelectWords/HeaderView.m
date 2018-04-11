//
//  HeaderView.m
//  SelectWords
//
//  Created by hc on 2018/4/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = Color(235, 235, 235);
    }
    return self;
    
}

- (void)setHeaderDataArray:(NSMutableArray *)headerDataArray {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _headerDataArray = headerDataArray;
    [self readWord];
    
}


- (void)readWord {
    
    CGFloat btnX = 0;
    CGFloat btnY = Spacing;
    CGFloat btnH = 40;
    for (int i = 0; i < _headerDataArray.count; i ++) {
        UIButton *titleBtn = [UIButton buttonWithType:0];
        titleBtn.backgroundColor = [UIColor whiteColor];
        [titleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        NSDictionary *dic = _headerDataArray[i];
        [titleBtn setTitle:dic[@"word"] forState:UIControlStateNormal];
        titleBtn.tag = 1000 + i;
        [titleBtn addTarget:self action:@selector(titleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //计算文字大小
        CGSize titleSize = [dic[@"word"] boundingRectWithSize:CGSizeMake(MAXFLOAT, btnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleBtn.titleLabel.font} context:nil].size;
        CGFloat titleBtnW = titleSize.width + 2 * Spacing; //按钮的长度加间距
        //判断按钮是否传出屏幕的宽度
        if ((btnX + titleBtnW) > SCREEN_WIDTH) {
            btnX = 0;
            btnY += btnH + Spacing;
        }
        titleBtn.frame = CGRectMake(btnX, btnY, titleBtnW, btnH);
        
        btnX += titleBtnW + Spacing;
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, btnY + btnH + 10);
        [self addSubview:titleBtn];
    }
    if (_headerDataArray.count == 0) { //headerView数据为空时默认显示的view的frame
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60);
    }
    
}

- (void)titleBtnClicked:(UIButton *)sender {
    [_headerDataArray removeObjectAtIndex:sender.tag - 1000];
    
    [self.delegate headerViewActionDelegate:_headerDataArray];
    
}

@end
