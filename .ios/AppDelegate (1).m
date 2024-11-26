#import <Firebase.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    return YES;
}
