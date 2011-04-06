#import "CMKScrollView.h"
#import "CMKScroller.h"

@implementation CMKScrollView

#pragma mark NSScrollView
- (void)tile {
	[super tile];
	
	NSView *contentView = [self contentView];
	NSRect contentFrame = [contentView frame];
	NSScroller *verticalScroller = [self verticalScroller];
	NSRect scrollerFrame = [verticalScroller frame];
	CGFloat scrollerWidth = [[verticalScroller class] scrollerWidth];
	contentFrame.size.width += scrollerFrame.size.width - scrollerWidth;
	[contentView setFrame:contentFrame];
}

@end
