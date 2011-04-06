#import <Cocoa/Cocoa.h>

@interface Lion_ScrollbarAppDelegate : NSObject <NSApplicationDelegate> {
@private
   NSWindow *window;
   IBOutlet NSArrayController *arrayController;
}

@property (assign) IBOutlet NSWindow *window;

@end
