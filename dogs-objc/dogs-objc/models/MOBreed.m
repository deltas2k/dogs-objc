//
//  MOBreed.m
//  dogs-objc
//
//  Created by Matthew O'Connor on 10/9/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOBreed.h"

@implementation MOBreed

- (instancetype)initWithName:(NSString *)name subBreeds:(NSArray *)subBreeds imageURLs:(NSArray *)imageURLs
{
    self = [super init];
    if (self)
    {
        _name = name;
        _subBreeds = subBreeds;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
