//
//  AFPFlickrPhoto.h
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 10.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MKAnnotation.h>

@interface AFPFlickrPhoto : NSObject

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) UIImage *smallImage;

@property (nonatomic, copy) NSDictionary *info;

- (instancetype)initWithInfo:(NSDictionary *)info;

@end
