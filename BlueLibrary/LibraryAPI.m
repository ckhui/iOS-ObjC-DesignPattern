//
//  LibraryAPI.m
//  BlueLibrary
//
//  Created by CKH on 24/03/2017.
//  Copyright © 2017 Eli Ganem. All rights reserved.
//

#import "LibraryAPI.h"
#import "PresistencyManager.h"
#import "HTTPClient.h"

@interface LibraryAPI () {
    PresistencyManager *persistencyManager;
    HTTPClient *httpClient;
    BOOL isOnline;
}

@end


@implementation LibraryAPI

- (id)init
{
    self = [super init];
    if (self) {
        persistencyManager = [[PresistencyManager alloc] init];
        httpClient = [[HTTPClient alloc] init];
        isOnline = NO;
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadImage:) name:@"BLDownloadImageNotification" object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


+ (LibraryAPI *)sharedInstance {
    
    //declare a static variable for LibraryAPI
    static LibraryAPI * _sharedInstance = nil;
    
    //declare static variable to ensure initialized code execute only once
    static dispatch_once_t oncePredicate;
    
    
    //Use GCD initializer is never called again once the class has been instantiated.
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    
    return _sharedInstance;
    
}


- (NSArray*)getAlbums
{
    return [persistencyManager getAlbums];
}

- (void)addAlbum:(Album*)album atIndex:(int)index
{
    [persistencyManager addAlbum:album atIndex:index];
    if (isOnline)
    {
        [httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)deleteAlbumAtIndex:(int)index
{
    [persistencyManager deleteAlbumAtIndex:index];
    if (isOnline)
    {
        [httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}


- (void)downloadImage:(NSNotification*)notification
{
    // 1
    UIImageView *imageView = notification.userInfo[@"imageView"];
    NSString *coverUrl = notification.userInfo[@"coverUrl"];
    
    // 2
    imageView.image = [persistencyManager getImage:[coverUrl lastPathComponent]];
    
    if (imageView.image == nil)
    {
        // 3
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [httpClient downloadImage:coverUrl];
            
            // 4
            dispatch_sync(dispatch_get_main_queue(), ^{
                imageView.image = image;
                [persistencyManager saveImage:image filename:[coverUrl lastPathComponent]];
            });
        });
    }    
}


- (void)saveAlbums
{
    [persistencyManager saveAlbums];
}
@end
