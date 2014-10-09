//
//  AFPMapViewController.h
//  HW3 - FlickrPhotosOnMap
//
//  Created by Dmitry Arbuzov on 10.10.14.
//  Copyright (c) 2014 ru.watm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKMapView;

@interface AFPMapViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
