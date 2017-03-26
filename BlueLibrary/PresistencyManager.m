//
//  PresistencyManager.m
//  BlueLibrary
//
//  Created by CKH on 24/03/2017.
//  Copyright © 2017 Eli Ganem. All rights reserved.
//

#import "PresistencyManager.h"

@interface PresistencyManager () {
    //class extension, in .m, so is private
    
    // an array of all albums
    NSMutableArray *albums;
}

@end

@implementation PresistencyManager


- (id)init
{
    self = [super init];
    if (self) {
        
        NSData *data = [NSData dataWithContentsOfFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/albums.bin"]];
        albums = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if (albums == nil) {
            
        // a dummy list of albums
        albums = [NSMutableArray arrayWithArray:
                  @[[[Album alloc] initWithTitle:@"Best of Bowie" artist:@"David Bowie" coverUrl:@"https://kingofwallpapers.com/picture/picture-015.jpg" year:@"1992"],
                    [[Album alloc] initWithTitle:@"It's My Life" artist:@"No Doubt" coverUrl:@"https://kingofwallpapers.com/picture/picture-008.jpg" year:@"2003"],
                    [[Album alloc] initWithTitle:@"Nothing Like The Sun" artist:@"Sting" coverUrl:@"https://kingofwallpapers.com/picture/picture-038.jpg" year:@"1999"],
                    [[Album alloc] initWithTitle:@"Staring at the Sun" artist:@"U2" coverUrl:@"https://kingofwallpapers.com/picture/picture-013.jpg" year:@"2000"],
                    [[Album alloc] initWithTitle:@"American Pie" artist:@"Madonna" coverUrl:@"https://kingofwallpapers.com/picture/picture-002.jpg" year:@"2000"]]];
        }
    }
    return self;
}


- (NSArray*)getAlbums
{
    return albums;
}

- (void)addAlbum:(Album*)album atIndex:(int)index
{
    if (albums.count >= index)
        [albums insertObject:album atIndex:index];
    else
        [albums addObject:album];
}

- (void)deleteAlbumAtIndex:(int)index
{
    [albums removeObjectAtIndex:index];
}

- (void)saveImage:(UIImage*)image filename:(NSString*)filename
{
    filename = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", filename];
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:filename atomically:YES];
}

- (UIImage*)getImage:(NSString*)filename
{
    filename = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", filename];
    NSData *data = [NSData dataWithContentsOfFile:filename];
    return [UIImage imageWithData:data];
}


- (void)saveAlbums
{
    NSString *filename = [NSHomeDirectory() stringByAppendingString:@"/Documents/albums.bin"];
    
    
    //NSKeyedArchiver archives the album array into a file called albums.bin.
    //since NSArray and Album support NSCopying interface, everything in the array is automatically archived.

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:albums];
    [data writeToFile:filename atomically:YES];
}
@end
