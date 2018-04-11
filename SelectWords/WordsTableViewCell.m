//
//  WordsTableViewCell.m
//  SelectWords
//
//  Created by hc on 2018/4/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "WordsTableViewCell.h"

@implementation WordsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)markBtnAction:(UIButton *)sender {
    if (sender.selected !=YES) {
        sender.selected = YES;
    } else {
        sender.selected = NO;
    }
    
    [self.delegate wordsCellDelegate:_indexRow isSelected:sender.selected];
    
    
}
- (void)setIndexRow:(NSInteger)indexRow {
    _indexRow = indexRow;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
