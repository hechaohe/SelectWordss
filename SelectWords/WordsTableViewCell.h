//
//  WordsTableViewCell.h
//  SelectWords
//
//  Created by hc on 2018/4/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WordsCellDelegate <NSObject>

/**
 
 cell右边的选中按钮是否选中
 @param indexRow cell的标识
 @param isSelected 是否选中
 */
- (void)wordsCellDelegate:(NSInteger)indexRow isSelected:(BOOL)isSelected;

@end



@interface WordsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *markBtn;

@property (nonatomic,assign) NSInteger indexRow;
@property (nonatomic,weak) id<WordsCellDelegate> delegate;


@end
