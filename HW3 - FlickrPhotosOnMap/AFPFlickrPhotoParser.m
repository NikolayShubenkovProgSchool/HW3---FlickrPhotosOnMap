//
//  AFPFlickrPhotoParser.m
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 10.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import "AFPFlickrPhotoParser.h"
#import <MapKit/MapKit.h>
#import "AFPFlickrPhoto.h"

@implementation AFPFlickrPhotoParser

+ (NSArray *)parsePhotosFromDictsArray:(NSArray *)dictsArray {
    NSMutableArray *photosArray = [NSMutableArray array];
    CLLocationCoordinate2D coordinate;
    NSString *tempString;
    for (NSDictionary *dict in dictsArray) {
        NSString *title = dict[@"title"];
        tempString = dict[@"url_sq"];
        if (!tempString) {
            continue;
        }
        NSURL *smallImage = [[NSURL alloc] initWithString:tempString];
        tempString = dict[@"url_o"];
        if (!tempString) {
            continue;
        }
        NSURL *originalImage = [[NSURL alloc] initWithString:tempString];
        coordinate.latitude = [dict[@"latitude"] doubleValue];
        coordinate.longitude = [dict[@"longitude"] doubleValue];
        
        AFPFlickrPhoto *photo = [[AFPFlickrPhoto alloc] initWithTitle:title
                                                           smallImage:smallImage
                                                        originalImage:originalImage
                                                           coordinate:coordinate];
        
        [photosArray addObject:photo];
    }
    return photosArray;
}

@end
