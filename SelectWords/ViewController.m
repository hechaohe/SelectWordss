//
//  ViewController.m
//  SelectWords
//
//  Created by hc on 2018/4/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "ViewController.h"
#import "WordsTableView.h"
#import "HeaderView.h"

@interface ViewController () <HeaderDelegate>

@property (nonatomic,strong) HeaderView *headerView;
@property (nonatomic,strong) WordsTableView *wordsTbale;

@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"words" ofType:@"plist"]];
    self.dataArr = [NSMutableArray arrayWithArray:arr];
    
    [self initUI];
    
}

- (void)initUI {
    self.wordsTbale = [[WordsTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.wordsTbale.allDataArr = self.dataArr;
    [self.view addSubview:self.wordsTbale];
    
    self.headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    self.headerView.delegate = self;
    
    self.wordsTbale.tableHeaderView = _headerView;
    
    
    //设置默认选中数据？
    __block WordsTableView *blockTabelView = self.wordsTbale;
    __block HeaderView *blockHeaderView = _headerView;

    _wordsTbale.block = ^(NSMutableArray *arr) {

        blockHeaderView.headerDataArray = arr;  //deleteArray的数据传递给headerView

        NSLog(@"选中的数组：%@",arr);
        
        
        if (@available(iOS 11.0,*)) {
            [blockTabelView performBatchUpdates:^{
                [blockTabelView setTableHeaderView:blockHeaderView];
            } completion:^(BOOL finished) {
                
            }];
        } else {
            [blockTabelView beginUpdates];
            [blockTabelView setTableHeaderView:blockHeaderView];
            [blockTabelView endUpdates];
        }
        
    };

//    self.wordsTbale.selectArr = [self.dataArr subarrayWithRange:NSMakeRange(5, 3)];
    
    
    
}

- (void)headerViewActionDelegate:(NSMutableArray *)arr {
    
    NSLog(@"1");
    _headerView.headerDataArray = arr;
    _wordsTbale.btnActionArr = [NSArray arrayWithArray:arr];  //btnActionArr
    
    if (@available(iOS 11.0, *)) {
        [self.wordsTbale performBatchUpdates:^{
            [self.wordsTbale setTableHeaderView:_headerView];
        } completion:^(BOOL finished) {
            
        }];
    } else {
        [self.wordsTbale beginUpdates];
        [self.wordsTbale setTableHeaderView:_headerView];
        [self.wordsTbale endUpdates];
    }
    
}



















@end
