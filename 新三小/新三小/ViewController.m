//
//  ViewController.m
//  新三小
//
//  Created by Zdst on 17/5/18.
//  Copyright © 2017年 yqh. All rights reserved.
//

#import "ViewController.h"
#import "TZImagePickerController.h"

#define screenW  self.view.frame.size.width
#define screenH  self.view.frame.size.height

@interface ViewController ()<TZImagePickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,strong)TZImagePickerController *tvc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    self.view.userInteractionEnabled = YES;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(100, 100, 50, 40);
    rightButton.backgroundColor = [UIColor yellowColor];
//    [rightButton addTarget:self action:@selector(createUI) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:rightButton];
    
}

-(NSMutableArray *)PhotoArr{
    if (!_PhotoArr) {
        _PhotoArr = [[NSMutableArray alloc]init];
        UIImage *image = [UIImage imageNamed:@"addImg"];
        [_PhotoArr addObject:image];
    }
    return _PhotoArr;
}

-(TZImagePickerController *)tvc{
    if (!_tvc) {
        _tvc = [[TZImagePickerController alloc]initWithMaxImagesCount:9 delegate:self];
    }
    return _tvc;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item == 0) {
        
        UIAlertControllerStyle style = UIAlertControllerStyleActionSheet;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            style = UIAlertControllerStyleAlert;
        }
        __weak __typeof(&*self)weakSelf = self;
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"选择图片来源" message:nil preferredStyle:style];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"图库" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            weakSelf.tvc.allowPickingVideo = NO;
            [weakSelf presentViewController:_tvc animated:YES completion:nil];
        }];
        UIAlertAction *action2 =[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *vc = [[UIImagePickerController alloc]init];
                vc.delegate = weakSelf;
                vc.sourceType = UIImagePickerControllerSourceTypeCamera;
                vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
                vc.modalPresentationStyle=UIModalPresentationFullScreen;
                BOOL cameraAvailableFlag = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
                if (cameraAvailableFlag)
                    [self presentViewController:vc animated:YES completion:nil];
            }else{
                //            [self showAAlertViewWithAlertText:@"此设备不支持相机"];
                NSLog(@"该设备不支持相机");
            }
        }];
        UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        [alert addAction:action1];
        [alert addAction:action2];
        [alert addAction:action3];
        
        [self.navigationController presentViewController:alert animated:YES completion:nil];
    }
}

-(void)createUI{
    
    //创建一个 layout 布局
    UICollectionViewFlowLayout *flowLatout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直
    flowLatout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个 item 的大小
    flowLatout.itemSize = CGSizeMake(100, 100);
    flowLatout.minimumLineSpacing = 5.0f;
    _imageShow = [[PhotoView alloc]initWithFrame:CGRectMake(10, 70, screenW-20,screenH-70) collectionViewLayout:flowLatout];
    _imageShow.delegate = self;
    _imageShow.dataSource = self;
    [_imageShow registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.view addSubview:_imageShow];
    
}

-(void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    
    for (UIImage *image in photos) {
        [self.PhotoArr addObject:image];
    }
    [self.imageShow reloadData];
    
    /**
    //创建一个 layout 布局
    UICollectionViewFlowLayout *flowLatout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直
    flowLatout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个 item 的大小
    flowLatout.itemSize = CGSizeMake(100, 100);
    flowLatout.minimumLineSpacing = 5.0f;
    _photoView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 70, self.view.frame.size.width-20, self.view.frame.size.height-70) collectionViewLayout:flowLatout];
    _photoView.delegate = self;
    _photoView.dataSource = self;
    [_photoView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
     ****/
//    [self.view addSubview:_photoView];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.PhotoArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    UIImageView *photo= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    photo.image = self.PhotoArr[indexPath.item];
    [cell.contentView addSubview:photo];
    return cell;
}
 

-(void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos{
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
