//
//  MOSubBreed.m
//  dogs-objc
//
//  Created by Matthew O'Connor on 10/9/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOSubBreed.h"

@implementation MOSubBreed

- (instancetype)initWithName:(NSString *)subBreedName imageURLs:(NSArray *)imageURLs
{
    self = [super init];
    if (self)
    {
        _subBreedName = subBreedName;
        _imageURLs = imageURLs;
    }
    return self;
}


@end
