//
//  AFPFlickrPhoto.m
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 10.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import "AFPFlickrPhoto.h"

@implementation AFPFlickrPhoto

- (instancetype)initWithTitle:(NSString *)title
                   smallImage:(NSURL *)smallImage
                originalImage:(NSURL *)originalImage
                   coordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        _title = title;
        _smallImageURL = smallImage;
        _originalImageURL = originalImage;
        _coordinate = coordinate;
    }
    return self;
}

@end
