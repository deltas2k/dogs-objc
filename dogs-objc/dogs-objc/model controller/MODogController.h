//
//  MODogController.h
//  dogs-objc
//
//  Created by Matthew O'Connor on 10/9/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MOBreed.h"
#import "MOSubBreed.h"


@interface MODogController : NSObject

@property (nonatomic, copy)NSArray<MOBreed *>* dogs;

+(instancetype)sharedController;

-(void)fetchDog:(void(^)(NSArray<MOBreed *> *))completion;
-(void)fetchImage:(MOBreed *)dog completion:(void(^) (UIImage * nonnull))completion;
-(void)fetchSubDogImage:(MOSubBreed *)subDog completion:(void(^) (UIImage * nonnull))completion;

@end

