//
//  MOSubBreed.h
//  dogs-objc
//
//  Created by Matthew O'Connor on 10/9/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface MOSubBreed : NSObject

@property (nonatomic, copy, readonly) NSString * subBreedName;
@property (nonatomic, copy, readonly) NSArray * imageURLs;

- (instancetype)initWithName:(NSString *)subBreedName
                   imageURLs:(NSArray *)imageURLs;

@end

NS_ASSUME_NONNULL_END
