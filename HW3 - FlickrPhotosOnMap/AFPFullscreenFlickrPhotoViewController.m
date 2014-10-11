//
//  AFPFullscreenFlickrPhotoViewController.m
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 11.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import "AFPFullscreenFlickrPhotoViewController.h"
#import "UIImageView+AFNetworking.h"

@interface AFPFullscreenFlickrPhotoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation AFPFullscreenFlickrPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imageView setImageWithURL:self.originalImageURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
