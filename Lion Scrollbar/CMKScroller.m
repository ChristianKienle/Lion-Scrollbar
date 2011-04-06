#import "CMKScroller.h"

static NSString *CMKScrollerDoubleValueLastChangedDateKey = @"doubleValueLastChangedDate";

@interface CMKScroller ()

#pragma mark Private Properties
@property (copy) NSDate *doubleValueLastChangedDate;

@end

@implementation CMKScroller

#pragma mark Private Properties
@synthesize doubleValueLastChangedDate;

#pragma mark Properties
- (void)setDoubleValue:(double)newValue {
   [super setDoubleValue:newValue];
   [self setAlphaValue:1.0];
   self.doubleValueLastChangedDate = [NSDate date];
   [self performSelector:@selector(doubleValueChangedDelayed) withObject:nil afterDelay:3.0];
}

- (void)doubleValueChangedDelayed {
   NSTimeInterval delta = -1.0 * [self.doubleValueLastChangedDate timeIntervalSinceNow];
   CGFloat epsilon = 0.1;
   CGFloat secondsVisible = 2.0;
   if(fabs(secondsVisible - delta) <= epsilon) {
      [[self animator] setAlphaValue:0.0];
   }
}

#pragma mark Nib Awaking
- (void)awakeFromNib {
   [super awakeFromNib];
   self.doubleValueLastChangedDate = [NSDate date];
   self.wantsLayer = YES;
   [self setArrowsPosition:NSScrollerArrowsNone];
}

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)encoder {
   [super encodeWithCoder:encoder];
   [encoder encodeObject:self.doubleValueLastChangedDate forKey:CMKScrollerDoubleValueLastChangedDateKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
   self = [super initWithCoder:decoder];
   if(self) { 
      self.doubleValueLastChangedDate	= [decoder decodeObjectForKey:CMKScrollerDoubleValueLastChangedDateKey]; 
   }   
   return self;
}

#pragma mark Dealloc
- (void)dealloc {
   self.doubleValueLastChangedDate = nil;
   [super dealloc];
}

#pragma mark NSScroller
+ (CGFloat)scrollerWidth {
   return 0.0;
}

+ (CGFloat)scrollerWidthForControlSize:(NSControlSize)controlSize {
   return 0;
}

+ (NSColor *)contentBackgroundColor {
   return [NSColor colorWithCalibratedWhite:0.912 alpha:1.000];
}

- (void)drawKnob {
   CGFloat radius = 3.0;
	CGFloat inset = 2.0;
	NSRect knobRect = [self rectForPart:NSScrollerKnob];
   
   if(NSIsEmptyRect(knobRect)) {
      return;
   }
   
   [NSGraphicsContext saveGraphicsState];
	NSBezierPath *knobPath = [NSBezierPath bezierPath];
	[knobPath appendBezierPathWithArcWithCenter:NSMakePoint(NSMidX(knobRect), NSMaxY(knobRect) - radius- inset) radius:radius startAngle:0 endAngle:180.0];
	[knobPath appendBezierPathWithArcWithCenter:NSMakePoint(NSMidX(knobRect), NSMinY(knobRect) + radius + inset) radius:radius startAngle:180.0 endAngle:0.0];
	[knobPath closePath];
   
   [[[NSColor blackColor] colorWithAlphaComponent:0.25] set];
	[knobPath fill];
   
   [[[NSColor darkGrayColor] colorWithAlphaComponent:0.7] set];
   [knobPath stroke];
   [NSGraphicsContext restoreGraphicsState];
}

#pragma mark NSView
- (BOOL)isOpaque {
   return NO;
}

- (void)drawRect:(NSRect)aRect {
   if([self knobProportion] > 0.0)	{
      [self drawKnob];
   }
}

@end
