//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"
@interface ImageModel()

@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSDictionary* imagesDict;

@end

@implementation ImageModel

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff",@"Erin",@"Jake",@"Cam"];
    
    return _imageNames; 
}


-(UIImage*)getImageWithName:(NSString*)name{
    
    return self.imagesDict[name];
}


-(NSDictionary*)imagesDict{
    
    if(!_imagesDict){
        _imagesDict = @{
            @"Bill": [UIImage imageNamed:@"Bill"],
            @"Eric": [UIImage imageNamed:@"Eric"],
            @"Jeff": [UIImage imageNamed:@"Jeff"],
            @"Erin": [UIImage imageNamed: @"Erin"],
            @"Jake": [UIImage imageNamed: @"Jake"],
            @"Cam": [UIImage imageNamed: @"Cam"]
        };
    }
    
    return _imagesDict;
}

-(UIImage*)getImageWithIndex:(NSInteger)index {
    if(index < [self imageNames].count) {
        NSString* name = self.imageNames[index];
        return [self getImageWithName:name];
    }
    return nil;
}

-(NSInteger)numberOfImages {
    return [self imageNames].count;
}

-(NSString*)getImageNameForIndex:(NSInteger)index {
    if(index < [self imageNames].count) {
        return self.imageNames[index];
    }
    return nil;
}


@end
