//
//  AFPMapViewController.m
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 10.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import "AFPMapViewController.h"
#import <MapKit/MapKit.h>
#import "AFPFlickrClient.h"
#import "AFPFlickrPhoto.h"
#import "AFPFlickrPhotoParser.h"
#import "AFPFullscreenFlickrPhotoViewController.h"

@interface AFPMapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSArray *photosArray;

@end

@implementation AFPMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getPhotosFromServerAndParse];
    
}

#pragma mark - Private

- (void)getPhotosFromServerAndParse {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        AFPFlickrClient *flickrClient = [[AFPFlickrClient alloc] init];
        [flickrClient getPhotosInRadius:5 completion:^(NSArray *dictsArray) {
            NSArray *tempArray = [AFPFlickrPhotoParser parsePhotosFromDictsArray:dictsArray];
            NSAssert(tempArray, @"Parser returned nil");

            dispatch_async(dispatch_get_main_queue(), ^{
                [self addPreviewsOnMap:tempArray];
            });

        }];
        
    });
}


- (void)addPreviewsOnMap:(NSArray *)photosArray {
    self.photosArray = photosArray;
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    [self.mapView addAnnotations:self.photosArray];
    
    [self.mapView showAnnotations:self.photosArray
                         animated:YES];
    
}


#pragma mark - MKMapViewDelegate


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if (![annotation isKindOfClass:[AFPFlickrPhoto class]]){
        return nil;
    }
    NSString *identifier = @"AFPFlickrPhotoAnnotation";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView){
        annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation
                                                     reuseIdentifier:identifier];
    }
    AFPFlickrPhoto *flickrphoto = annotation;
    NSURL *previewURL = flickrphoto.smallImageURL;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data=[NSData dataWithContentsOfURL:previewURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            annotationView.image = [UIImage imageWithData:data];
        });
    });
    
    annotationView.canShowCallout = YES;
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    AFPFullscreenFlickrPhotoViewController *flvc = [self.storyboard instantiateViewControllerWithIdentifier:@"AFPFullscreenFlickrPhotoViewController"];
    AFPFlickrPhoto *flickrphoto = view.annotation;
    flvc.originalImageURL = flickrphoto.originalImageURL;
    flvc.navigationItem.title = flickrphoto.title;
    [self.navigationController pushViewController:flvc animated:YES];
}


@end
