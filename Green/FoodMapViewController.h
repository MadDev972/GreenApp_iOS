//
//  FoodMapViewController.h
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/10/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FoodMapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager* locationManager;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *phoneNb;
@property (weak, nonatomic) IBOutlet UILabel *website;
@property (weak, nonatomic) IBOutlet UITextView *description;

@property (nonatomic, strong) NSMutableArray *Locations;

-(void)hideInfos:(BOOL)_hide;

@end
