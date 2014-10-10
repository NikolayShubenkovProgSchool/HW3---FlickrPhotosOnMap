//
//  AFPFlickrPhotoParser.h
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 10.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFPFlickrPhotoParser : NSObject

+ (NSArray *)parsePhotosFromDictsArray:(NSArray *)dictsArray;

@end
