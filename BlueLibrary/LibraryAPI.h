//
//  LibraryAPI.h
//  BlueLibrary
//
//  Created by CKH on 24/03/2017.
//  Copyright © 2017 Eli Ganem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface LibraryAPI : NSObject

//singleton
+ (LibraryAPI *) sharedInstance;


- (NSArray*)getAlbums;
- (void)addAlbum:(Album*)album atIndex:(int)index;
- (void)deleteAlbumAtIndex:(int)index;

//Archiving
- (void)saveAlbums;

@end
