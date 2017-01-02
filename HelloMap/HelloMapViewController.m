/*
 * Copyright © 2011-2016 HERE Global B.V. and its affiliate(s).
 * All rights reserved.
 * The use of this software is conditional upon having a separate agreement
 * with a HERE company for the use or utilization of this software. In the
 * absence of such agreement, the use of the software is not allowed.
 */

#import "HelloMapViewController.h"
#import <NMAKit/NMAKit.h>

@interface HelloMapViewController ()<NMAResultListener>{

}
@property (weak, nonatomic) IBOutlet NMAMapView *mapView;
@end

@implementation HelloMapViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    //set geo center
	NMAGeoCoordinates *geoCoordCenter = [[NMAGeoCoordinates alloc] initWithLatitude:49.260327 longitude:-123.115025];
	[self.mapView setGeoCenter:geoCoordCenter withAnimation:NMAMapAnimationNone];
    self.mapView.copyrightLogoPosition = NMALayoutPositionBottomCenter;
    
	//set zoom level
	self.mapView.zoomLevel = 13.2;
    
    
    
}


// NMAResultListener protocol callback implementation
- (void)request:(NMARequest*)request
didCompleteWithData:(id)data
          error:(NSError*)error
{
    if ( [request isKindOfClass:[NMAAutoSuggestionRequest class]] &&
         error.code == NMARequestErrorNone )
    {
        // Results are held in an array of NSString
        NSArray* textAutoSuggestionResult = (NSArray*) data;
    }
    else
    {
        // Handle error
    }
}
- (void) startSearch
{
    NMAGeoCoordinates* vancouver =
    [[NMAGeoCoordinates alloc] initWithLatitude:47.592229
                                      longitude:-122.315147];
    
    NMAAutoSuggestionRequest* request =
    [[NMAPlaces sharedPlaces] createAutoSuggestionRequestWithLocation:vancouver
                                                          partialTerm:@"rest"];
    
    // limit number of items in each result page to 10
    request.collectionSize = 10;
    
    NSError* error = [request startWithListener:self];
    if (error.code != NMARequestErrorNone)
    {
        // Handle request error

    }
}

@end
