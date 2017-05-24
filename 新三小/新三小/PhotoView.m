//
//  PhotoView.m
//  新三小
//
//  Created by Zdst on 17/5/19.
//  Copyright © 2017年 yqh. All rights reserved.
//

#import "PhotoView.h"

@implementation PhotoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self) {
        self = [super initWithFrame:frame collectionViewLayout:layout];
    }
    return self;
}

//-(NSMutableArray *)imageArr{
//    if (!_imageArr) {
//        _imageArr = [[NSMutableArray alloc]init];
//        [_imageArr addObject:@"addImg"];
//    }
//    return _imageArr;
//}
//
//-(NSInteger)numberOfItemsInSection:(NSInteger)section{
//
//    return self.imageArr.count;
//}
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
//    UIImageView *photo= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    photo.image = self.imageArr[indexPath.item];
//    [cell.contentView addSubview:photo];
//    return cell;
//}
//
//-(void)selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition{
//    if (indexPath.item == 0) {
//        
//    }
//
//}

@end
