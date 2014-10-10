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
@property (nonatomic, strong, readonly) NSURL *smallImage;
@property (nonatomic, strong, readonly) NSURL *originalImage;
@property (nonatomic, strong, readonly) NSString *title;

- (instancetype)initWithTitle:(NSString *)title
                   smallImage:(NSURL *)smallImage
                originalImage:(NSURL *)originalImage
                   coordinate:(CLLocationCoordinate2D)coordinate;

@end
