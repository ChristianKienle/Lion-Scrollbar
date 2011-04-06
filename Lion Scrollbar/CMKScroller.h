#import <Cocoa/Cocoa.h>

@interface CMKScroller : NSScroller {
    @private
    NSDate *doubleValueLastChangedDate;
}

+ (NSColor *)contentBackgroundColor;

@end
