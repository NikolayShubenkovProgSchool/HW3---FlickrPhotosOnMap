//
//  ViewController.m
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 09.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import "ViewController.h"
#import "AFPFlickrClient.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *photosArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AFPFlickrClient *client = [[AFPFlickrClient alloc] init];
    [client getPhotosInRadius:32];
    
}



@end
