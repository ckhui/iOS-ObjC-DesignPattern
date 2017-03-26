//
//  PresistencyManager.h
//  BlueLibrary
//
//  Created by CKH on 24/03/2017.
//  Copyright © 2017 Eli Ganem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface PresistencyManager : NSObject


- (NSArray*)getAlbums;
- (void)addAlbum:(Album*)album atIndex:(int)index;
- (void)deleteAlbumAtIndex:(int)index;


- (void)saveImage:(UIImage*)image filename:(NSString*)filename;
- (UIImage*)getImage:(NSString*)filename;

//Archiving
- (void)saveAlbums;
@end
