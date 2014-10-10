//
//  AFPFlickrClient.m
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 09.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import "AFPFlickrClient.h"
#import "AFNetworking.h"
#import "AFPFlickrPhoto.h"

@implementation AFPFlickrClient

static NSString *api_key = @"52522cd09d43428026b9eff49fe493f7";

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:@"https://api.flickr.com/services/rest/"]];
    if (self){
        self.requestSerializer  = [AFHTTPRequestSerializer new];
        self.responseSerializer = [AFJSONResponseSerializer new];
    }
    return self;
}

- (void)getPhotosInRadius:(NSInteger)radius completion:(void(^)(NSArray *dictsArray))completionBlock {
    
    NSAssert(radius > 0 && radius <= 32, @"Incorrect radius value. Must be from 0 to 32");
    
    NSDictionary *parameters = @{@"method" :@"flickr.photos.search",
                                 @"api_key":api_key,
                                 @"lat":@(55),
                                 @"lon":@(37),
                                 @"radius":@(radius),
                                 @"format":@"json",
                                 @"nojsoncallback":@"1",
                                 @"extras":@"geo, url_sq, url_o"};
    
    [self GET:@""
   parameters:parameters
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          NSArray *dictsArray = responseObject[@"photos"][@"photo"];
          completionBlock(dictsArray);
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"We have some problems. Error: %@", error);
      }];
}

@end
