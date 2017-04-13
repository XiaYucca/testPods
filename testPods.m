//
//  DownImageViewController.m
//  googleBlock2.0
//
//  Created by RainPoll on 16/4/14.
//  Copyright © 2016年 RainPoll. All rights reserved.
//
#import <objc/runtime.h>
#import "classA.h"
#import "classB.h"


@implementation CodeArr
//override


@end


@implementation classA


-(instancetype)initWithDict:(NSDictionary *)dict{
    self =  [super init];
    if (self) {
        self.str = [dict objectForKey:@"str"];
        self.sun = [dict objectForKey:@"sun"];
        id arr = [dict objectForKey:@"sunArr"];
        
        if ([arr isKindOfClass:[NSArray class]]) {
            if ([arr count]) {
                for (int i = 0; i< [arr count]; i++) {
                    classB *b = [[classB alloc]initWithDict:arr[i]];
                    [self.sunArr addObject:b];
                }
            }
        }
    }
    return self;
}

-(NSMutableArray *)sunArr{
    if (!_sunArr) {
        _sunArr = [@[]mutableCopy];
    }
    return _sunArr;
}



//获取对象的所有属性
- (NSArray *)getAllProperties
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}

//Model 到字典
- (NSDictionary *)properties_aps
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}



- (void)encodeWithCoder:(NSCoder *)coder
{
//  [super encodeWithCoder:coder];
    [coder encodeObject:self.str forKey:@"str"];
    [coder encodeObject:self.sun forKey:@"sun"];
    [coder encodeObject:self.sunArr forKey:@"sunArr"];

}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self =  [super init];
    if (self) {
        self.str = [aDecoder decodeObjectForKey:@"str"];
        self.sun = [aDecoder decodeObjectForKey:@"sun"];
        self.sunArr = [aDecoder decodeObjectForKey:@"sunArr"];
        
//      if ([arr isKindOfClass:[NSArray class]]) {
//          if ([arr count]) {
//                for (int i = 0; i< [arr count]; i++) {
//                     classB *b = [[classB alloc]initWithDict:arr[i]];
//                    [self.sunArr addObject:b];
//                }
//            }
//        }
    }

    return self;
}

@end



