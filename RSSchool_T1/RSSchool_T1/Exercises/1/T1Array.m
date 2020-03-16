#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (sadArray.count <= 2) {
        return sadArray;
    }
    
    NSMutableArray<NSNumber *> *happyArray = [sadArray mutableCopy];
    for (NSInteger i = 1; i < happyArray.count - 1; i++) {
        if (happyArray[i].integerValue > happyArray[i - 1].integerValue + happyArray[i + 1].integerValue) {
            [happyArray removeObjectAtIndex:i];
            i = MAX(0, i - 2);
        }
    }
    return [happyArray copy];
}

@end
