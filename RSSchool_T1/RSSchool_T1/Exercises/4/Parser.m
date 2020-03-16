#import "Parser.h"

@interface Parser ()

@property (nonatomic, strong) NSMutableDictionary *answers;

@end

@implementation Parser

- (instancetype)init
{
    self = [super init];
    if (self) {
        _answers = [NSMutableDictionary dictionary];
    }
    return self;
}

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSMutableArray<NSNumber *> *array1 = [NSMutableArray array];
    NSMutableArray<NSNumber *> *array2 = [NSMutableArray array];
    NSMutableArray<NSNumber *> *array3 = [NSMutableArray array];

    for (int i = 0; i < string.length; i++) {
        char character = [string characterAtIndex:i];
        if (character == '(') {
            [array1 addObject:@(i)];
        } else if (character == '<') {
            [array2 addObject:@(i)];
        } else if (character == '[') {
            [array3 addObject:@(i)];
        } else if (character  == ')') {
            [self handleClosedBracketWithArray:array1 index:i string:string];
        } else if (character == '>') {
            [self handleClosedBracketWithArray:array2 index:i string:string];
        } else if (character == ']') {
            [self handleClosedBracketWithArray:array3 index:i string:string];
        }
    }
    
    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray<NSNumber *> *sortedKeys = [self.answers.allKeys sortedArrayUsingDescriptors:@[lowestToHighest]];
    
    NSMutableArray<NSString *> *sortedAnswers = [NSMutableArray array];
    for (NSNumber *key in sortedKeys) [sortedAnswers addObject:self.answers[key]];
    return sortedAnswers;
}

- (void)handleClosedBracketWithArray:(NSMutableArray<NSNumber *> *)array
                              index:(int)i
                             string:(NSString *)string
{
    if (array.lastObject != nil) {
        NSInteger previousOpenBracket = array.lastObject.integerValue;
        [array removeLastObject];
        NSRange matchedSubstringRange = NSMakeRange(previousOpenBracket + 1, i - previousOpenBracket - 1);
        self.answers[@(previousOpenBracket)] = [string substringWithRange:matchedSubstringRange];
    }
}

@end
