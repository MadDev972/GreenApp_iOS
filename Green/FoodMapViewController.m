//
//  FoodMapViewController.m
//  Green
//
//  Created by Sofia Maria Natacha Chevrolat on 10/10/12.
//  Copyright (c) 2012 MadDev. All rights reserved.
//

#import "FoodMapViewController.h"
#import "RestaurantLocation.h"
#import "StoreLocation.h"
#import "CafeLocation.h"
#import "DbHelper.h"



@interface FoodMapViewController ()

@end


@implementation FoodMapViewController
@synthesize phoneNb;
@synthesize website;
@synthesize description;
@synthesize locationManager;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"flower.jpg"]];

    self.Locations = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)plotFoodLocations
{
    for (id<MKAnnotation> annotation in _mapView.annotations)
    {
        [_mapView removeAnnotation:annotation];
    }
 
    NSArray *RestaurantsLocations = [[DbHelper database] RestaurantsLocations];
    NSArray *CafesLocations = [[DbHelper database] CafesLocations];
    NSArray *StoresLocations = [[DbHelper database] StoresLocations];

    [self.Locations addObjectsFromArray:RestaurantsLocations];
    [self.Locations addObjectsFromArray:CafesLocations];
    [self.Locations addObjectsFromArray:StoresLocations];
    
    for (RestaurantLocation *restaurant_place in RestaurantsLocations)
    {    
        [_mapView addAnnotation:restaurant_place];
	}
    
    for (CafeLocation *cafe_place in CafesLocations)
    {
        [_mapView addAnnotation:cafe_place];
	}
    
    for (StoreLocation *store_place in StoresLocations)
    {
        [_mapView addAnnotation:store_place];
	}
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *identifier_1 = @"RestaurantLocation";
    static NSString *identifier_2 = @"CafeLocation";
    static NSString *identifier_3 = @"StoreLocation";
    
    if ([annotation isKindOfClass:[RestaurantLocation class]])
    {
        MKAnnotationView *annotationView = (MKAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier_1];
        
        if (annotationView == nil)
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier_1];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"Restaurant_pin2.png"];
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        else
        {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    else if ([annotation isKindOfClass:[CafeLocation class]])
    {
        MKAnnotationView *annotationView = (MKAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier_2];
        
        if (annotationView == nil)
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier_2];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"Cafe_pin2.png"];
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        else
        {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    else if ([annotation isKindOfClass:[StoreLocation class]])
    {
        MKAnnotationView *annotationView = (MKAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier_3];
        
        if (annotationView == nil)
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier_3];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"Store_pin2.png"];
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        else
        {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;

    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    FoodLocation *location = (FoodLocation*)view.annotation;
    
    NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
    [location.mapItem openInMapsWithLaunchOptions:launchOptions];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self plotFoodLocations];
    [self hideInfos:YES];

    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    for (FoodLocation *_place in self.Locations)
    {
        if ([_place.name isEqualToString:view.annotation.title])
        {
            self.phoneNb.text = _place.phone;
            self.website.text = _place.website;
            self.description.text = _place.description;
            
            [self hideInfos:NO];
            
            break;
        }
	}
}

-(void)hideInfos:(BOOL)_hide
{
    [self.phoneNb setHidden:_hide];
    [self.website setHidden:_hide];
    [self.description setHidden:_hide];
}


#pragma CLLocationManagerDelegate method
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D userCoordinate = manager.location.coordinate;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userCoordinate, 1000, 1000);
    
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    
    [_mapView setRegion:adjustedRegion animated:YES];
    
    [locationManager stopUpdatingLocation];
}


@end
