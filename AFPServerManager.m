//
//  AFPServerManager.m
//  
//
//  Created by Dmitry Arbuzov on 09.10.14.
//
//

#import "AFPServerManager.h"
#import "AFNetworking.h"

@interface AFPServerManager ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *requestOperationManager;

@end

@implementation AFPServerManager

+ (instancetype)sharedManager {
    static AFPServerManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFPServerManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURL *url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    }
    return self;
}

@end
