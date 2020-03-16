#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int actualSum = 0;
    for (int i = 0; i < bill.count; i++) {
        actualSum += bill[i].integerValue;
    }
    actualSum -= bill[index].integerValue;
    actualSum /= 2;
    if (actualSum == sum.integerValue)
        return @"Bon Appetit";
    else {
        return @(sum.integerValue - actualSum).stringValue;
    }
}

@end
