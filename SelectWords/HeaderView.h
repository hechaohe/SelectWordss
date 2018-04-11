//
//  HeaderView.h
//  SelectWords
//
//  Created by hc on 2018/4/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol HeaderDelegate <NSObject>

/**

 @param arr 展示的数据
 */
- (void)headerViewActionDelegate:(NSMutableArray *)arr;

@end


@interface HeaderView : UIView

@property (nonatomic,strong) NSMutableArray *headerDataArray;

@property (nonatomic,weak) id<HeaderDelegate> delegate;


@end
