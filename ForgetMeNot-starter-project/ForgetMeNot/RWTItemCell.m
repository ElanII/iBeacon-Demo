//
//  RWTItemCell.m
//  ForgetMeNot
//
//  Created by Henry Dinhofer on 6/29/16.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

#import "RWTItemCell.h"
#import "RWTItem.h"

@implementation RWTItemCell

- (void)prepareForReuse {
    [super prepareForReuse];
    self.item = nil;
}

//Now it’s time to use that property to display the perceived proximity of the ranged iBeacon.
- (void)setItem:(RWTItem *)item {
    if (_item) {
        [_item removeObserver:self forKeyPath:@"lastSeenBeacon"];
    }
    
    _item = item;
    [_item addObserver:self
            forKeyPath:@"lastSeenBeacon"
               options:NSKeyValueObservingOptionNew
               context:NULL];
    
    self.textLabel.text = _item.name;
}

- (void)dealloc {
    [_item removeObserver:self forKeyPath:@"lastSeenBeacon"];
}
- (NSString *)nameForProximity:(CLProximity)proximity {
    switch (proximity) {
        case CLProximityUnknown:
            return @"Unknown";
            break;
        case CLProximityImmediate:
            return @"Immediate";
            break;
        case CLProximityNear:
            return @"Near";
            break;
        case CLProximityFar:
            return @"Far";
            break;
    }
}

// will call this method each time the lastSeenBeacon value changes
//  sets the cells detailTextLabel.text property to the percieved proximity value
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([object isEqual:self.item] && [keyPath isEqualToString:@"lastSeenBeacon"]) {
        NSString *proximity = [self nameForProximity:self.item.lastSeenBeacon.proximity];
        self.detailTextLabel.text = [NSString stringWithFormat:@"Location: %@", proximity];
    }
}


@end
