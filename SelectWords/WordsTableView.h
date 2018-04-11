//
//  WordsTableView.h
//  SelectWords
//
//  Created by hc on 2018/4/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class HeaderView;

typedef void(^HeaderBlock)(NSMutableArray *);

@interface WordsTableView : UITableView

/**
 所有数据
 */
@property (nonatomic,strong) NSMutableArray *allDataArr;

/**
 默认选中的按钮
 */
@property (nonatomic,copy) NSArray *selectArr;


/**
 回调？
 */
@property (nonatomic,copy) HeaderBlock block;


/**
 点击删除后的数组
 */
@property(nonatomic,copy) NSArray *btnActionArr;

@end
