//
//  ViewController.h
//  新三小
//
//  Created by Zdst on 17/5/18.
//  Copyright © 2017年 yqh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *photoView;
@property(nonatomic,copy)NSMutableArray *PhotoArr;

@end

