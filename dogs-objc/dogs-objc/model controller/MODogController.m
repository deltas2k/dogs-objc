//
//  MODogController.m
//  dogs-objc
//
//  Created by Matthew O'Connor on 10/9/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MODogController.h"


static NSString * const kBaseURLString = @"https://dog.ceo/api/";
static NSString * const kBreedsNameComponent = @"breeds";
static NSString * const kListAllComponent = @"list/all";
static NSString * const kBreedComponent = @"breed";
static NSString * const kImageComponent = @"images/random";

@implementation MODogController

+ (instancetype)sharedController
{
    static MODogController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MODogController new];
    });
    return sharedInstance;
}

- (void)fetchDog:(void (^)(NSArray<MOBreed *> *))completion
{
    NSURL * url = [NSURL URLWithString:kBaseURLString];
    NSURL * breedsURL = [url URLByAppendingPathComponent:kBreedsNameComponent];
    NSURL * finalURL = [breedsURL URLByAppendingPathComponent:kListAllComponent];
    
    NSLog(@"this is the final url %@",finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"error fetching post %@", error);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (!data)
        {
            NSLog(@"error with fetch post data %@",error);
            completion(nil);
            return;
        }
        NSDictionary *topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        if (error)
        {
            NSLog(@"error parsing json data %@", [error localizedDescription]);
            completion(nil);
            return;
        }
        NSDictionary * messageDictionary = topLevelJSON[@"message"];
        
        NSMutableArray *arrayOfBreeds = [NSMutableArray new];
        for (id key in messageDictionary)
        {
            NSMutableArray * subBreeds = [NSMutableArray new];
            for (NSString *subName in messageDictionary[key])
            {
                MOSubBreed *subBreed = [[MOSubBreed alloc]
                                        initWithName:subName imageURLs:[[NSMutableArray alloc] init]];
                [subBreeds addObject:subBreed];
            }
            MOBreed *dogBreed = [[MOBreed alloc] initWithName:key subBreeds:subBreeds imageURLs:[[NSMutableArray alloc] init]];
            [arrayOfBreeds addObject: dogBreed];
            
        }
        completion(arrayOfBreeds);
    }]resume];
}



-(void)fetchImage:(MOBreed *)dog completion:(void (^)(UIImage * nullable))completion
{
    NSURL * imageURL = [NSURL URLWithString:kBaseURLString];
    NSURL * breedURL = [imageURL URLByAppendingPathComponent:kBreedComponent];
    NSURL * dogComponent = [breedURL URLByAppendingPathComponent:dog.name];
    NSURL * finalURL = [dogComponent URLByAppendingPathComponent:kImageComponent];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"No Data found");
            completion(nil);
            return;
        }
        UIImage * image = [UIImage imageWithData:data];
        completion(image);
    }]resume];
}

-(void)fetchSubDogImage:(MOSubBreed *)subDog completion:(void (^)(UIImage * nullable))completion
{
    NSURL * imageURL = [NSURL URLWithString:kBaseURLString];
    NSURL * breedURL = [imageURL URLByAppendingPathComponent:kBreedComponent];
    NSURL * dogComponent = [breedURL URLByAppendingPathComponent:subDog.subBreedName];
    NSURL * finalURL = [dogComponent URLByAppendingPathComponent:kImageComponent];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"No Data found");
            completion(nil);
            return;
        }
        UIImage * image = [UIImage imageWithData:data];
        completion(image);
    }]resume];
}
@end
