//
//  RWTItem.h
//  ForgetMeNot
//
//  Created by Henry Dinhofer on 6/28/16.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

#import <Foundation/Foundation.h>


@import CoreLocation;

@interface RWTItem : NSObject <NSCoding>

@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSUUID *uuid;
@property (assign, nonatomic, readonly) CLBeaconMajorValue majorValue;
@property (assign, nonatomic, readonly) CLBeaconMinorValue minorValue;
@property (strong, nonatomic) CLBeacon *lastSeenBeacon;


- (instancetype)initWithName:(NSString *)name
                        uuid:(NSUUID *)uuid
                       major:(CLBeaconMajorValue)major
                       minor:(CLBeaconMinorValue)minor;

- (BOOL)isEqualToCLBeacon:(CLBeacon *)beacon;



//@interface RWTItem : NSObject <NSCoding>
//
//@property (strong, nonatomic, readonly) NSString *name;
//@property (strong, nonatomic, readonly) NSUUID *uuid;
//@property (assign, nonatomic, readonly) uint16_t majorValue;  changed type to CLBeaconMajorValue
//@property (assign, nonatomic, readonly) uint16_t minorValue; changed type from uint16_t to CLBeaconMinorValue
//
//- (instancetype)initWithName:(NSString *)name
//                        uuid:(NSUUID *)uuid
//                       major:(uint16_t)major
//                       minor:(uint16_t)minor;
//
//
@end
