//
//  AFPFlickrClient.h
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 09.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface AFPFlickrClient : AFHTTPRequestOperationManager

- (void)getPhotosInRadius:(NSInteger)radius;

@end
