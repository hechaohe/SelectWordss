//
//  WordsTableView.m
//  SelectWords
//
//  Created by hc on 2018/4/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "WordsTableView.h"

#import "HeaderView.h"
#import "WordsTableViewCell.h"


@interface WordsTableView () <UITableViewDelegate,UITableViewDataSource,WordsCellDelegate>

@property (nonatomic,strong) NSMutableArray *deleteArray; //header展示的数组

@end

@implementation WordsTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"WordsTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
    }
    return self;
}
//默认选中的按钮
//- (void)setSelectArr:(NSArray *)selectArr {
//
//    [self.deleteArray removeAllObjects];
//
//    [self.deleteArray addObjectsFromArray:selectArr];
//
//
//    !self.block ? : self.block(self.deleteArray);
//
//
//}
//点击按钮刷新列表数据?
- (void)setBtnActionArr:(NSArray *)btnActionArr {
    
    [self.deleteArray removeAllObjects];
    
    [self.deleteArray addObjectsFromArray:btnActionArr];
    
    [self reloadData];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allDataArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    if (!cell) {
        cell = [[WordsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    NSDictionary *dic = self.allDataArr[indexPath.row];
    cell.nameLabel.text = dic[@"word"];
    cell.indexRow = indexPath.row;
    cell.delegate = self;
    
    if ([self.deleteArray containsObject:dic]) {
//        cell.markBtn.selected = NO;
        cell.markBtn.selected = YES;
    } else {
//        cell.markBtn.selected = YES;
        cell.markBtn.selected = NO;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WordsTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
//    if (cell.markBtn.selected !=YES) {
//        cell.markBtn.selected = YES;
//        [self.deleteArray removeObject:self.allDataArr[indexPath.row]];
//    } else {
//        [self.deleteArray addObject:self.allDataArr[indexPath.row]];
//        cell.markBtn.selected = NO;
//    }
    
    if (cell.markBtn.selected !=YES) {
        cell.markBtn.selected = YES;
        [self.deleteArray addObject:self.allDataArr[indexPath.row]];
    } else {
        cell.markBtn.selected = NO;
        [self.deleteArray removeObject:self.allDataArr[indexPath.row]];
    }
    
    !self.block ? : self.block(self.deleteArray);
}

// old混乱的逻辑
//- (void)wordsCellDelegate:(NSInteger)indexRow isRemov:(BOOL)isRemove {
//
////    if (isRemove) {
////        [self.deleteArray removeObject:self.allDataArr[indexRow]];
////    } else {
////        [self.deleteArray addObject:self.allDataArr[indexRow]];
////    }
////    !self.block ? : self.block(self.deleteArray);
//
//
//    if (isRemove) {
//        [self.deleteArray addObject:self.allDataArr[indexRow]];
//    } else {
//        [self.deleteArray removeObject:self.allDataArr[indexRow]];
//    }
//    !self.block ? : self.block(self.deleteArray);
//
//}

- (void)wordsCellDelegate:(NSInteger)indexRow isSelected:(BOOL)isSelected {
    
    if (isSelected) {
        [self.deleteArray addObject:self.allDataArr[indexRow]];
    } else {
        [self.deleteArray removeObject:self.allDataArr[indexRow]];
    }
    !self.block ? : self.block(self.deleteArray);
    
}



- (NSMutableArray *)deleteArray {
    if (!_deleteArray) {
        _deleteArray = [NSMutableArray array];
    }
    return _deleteArray;
}

@end
