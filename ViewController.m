//
//  ViewController.m
//  TableView复用
//
//  Created by cocolee on 2017/4/5.
//  Copyright © 2017年 TR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *Mytable;
@property(nonatomic,strong)NSMutableArray *TestArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self TestArr];
    [self Mytable];
}


//懒加载Table
-(UITableView*)Mytable{
    if (!_Mytable) {
        _Mytable =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStylePlain];
        _Mytable.delegate = self;
        _Mytable.dataSource = self;
        [self.view addSubview:_Mytable];
        
    }
    return _Mytable;
}

//懒加载数据
-(NSMutableArray*)TestArr{
    if (!_TestArr)
    {
        _TestArr =[NSMutableArray array];
        for (int i = 0 ; i<10; i++)
        {
            [_TestArr addObject:[NSString stringWithFormat:@"%d",i]];
        }
        
        [_TestArr addObject:@"Text测试"];
        
        for (int i = 0 ; i<10; i++)
        {
            [_TestArr addObject:[NSString stringWithFormat:@"%d",i]];
        }
        NSLog(@"%@",_TestArr);

        
    }
    return _TestArr;
}


#pragma mark Uitableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _TestArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    
//    static NSString *identify = @"Cell";
//
//    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identify];
//    if (cell == nil) {
//        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
//    }
//    
//    NSString *Result =[_TestArr objectAtIndex:indexPath.row];
//    
//    if ([Result hasPrefix:@"Text测试"]) {
//        cell.textLabel.textAlignment = NSTextAlignmentCenter;
//
//    }
//    cell.textLabel.text = _TestArr [indexPath.row];
//    return cell;
    
    /*  
     
     上面这段代码  刷新的时候  会出现问题 当我们要展示的数据有不同的时候 我们更改一下方法
     
     
     使用下面这段代码 就不会出现错误
     
    */
    UITableViewCell *cell =[[UITableViewCell alloc]init];
 
    NSString *Result =[_TestArr objectAtIndex: indexPath.row];
    if ([Result hasPrefix:@"Text测试"])
    {
        static NSString *identify = @"Cell";
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.text = [NSString stringWithFormat:@"%@",Result];
        
    }
    else
    {
        static NSString *identify = @"Cellss";
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%@",Result];
    }
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
