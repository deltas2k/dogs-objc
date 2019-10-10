//
//  MOBreed.h
//  dogs-objc
//
//  Created by Matthew O'Connor on 10/9/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOBreed : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString * name;
@property (nonatomic, readonly, nullable) NSArray * subBreeds;
@property (nonatomic, readonly, nonnull) NSArray * imageURLs;

- (instancetype)initWithName:(NSString *)name
                   subBreeds:(NSArray *)subBreeds
                   imageURLs:(NSArray *)imageURLs ;

@end


NS_ASSUME_NONNULL_END
