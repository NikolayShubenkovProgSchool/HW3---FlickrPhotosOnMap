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

@end
