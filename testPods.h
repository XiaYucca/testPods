//
//  DownImageViewController.m
//  googleBlock2.0
//
//  Created by RainPoll on 16/4/14.
//  Copyright © 2016年 RainPoll. All rights reserved.
//

#import <Foundation/Foundation.h>
@class classB;

@interface classA : NSObject<NSCoding>
@property(nonatomic ,copy)NSString *str;
@property (nonatomic ,strong)classB *sun;
@property (nonatomic ,strong)NSMutableArray *sunArr;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end



@interface CodeArr : NSArray<NSCoding>


@end
