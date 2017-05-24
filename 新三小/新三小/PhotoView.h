//
//  PhotoView.h
//  新三小
//
//  Created by Zdst on 17/5/19.
//  Copyright © 2017年 yqh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoView : UICollectionView

@property(nonatomic,strong)UIImageView *photoImageView;
@property(nonatomic,copy)NSMutableArray *imageArr;

@end
