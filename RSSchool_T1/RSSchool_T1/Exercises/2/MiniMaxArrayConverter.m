#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSInteger indexOfMin = 0, indexOfMax = 0, sum = array[0].integerValue;
    for (NSInteger i = 1; i < array.count; i++) {
        if (array[i].integerValue < array[indexOfMin].integerValue)
            indexOfMin = i;
        if (array[i].integerValue > array[indexOfMax].integerValue)
            indexOfMax = i;
        sum += array[i].integerValue;
    }
    return @[@(sum - array[indexOfMax].integerValue), @(sum - array[indexOfMin].integerValue)];
}

@end
