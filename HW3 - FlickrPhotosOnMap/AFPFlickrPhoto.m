//
//  AFPFlickrPhoto.m
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 10.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import "AFPFlickrPhoto.h"

@implementation AFPFlickrPhoto

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        _info = [info copy];
//        _coordinate = ;
//        _smallImage = ;
    }
    return self;
}


@end
