//  AppController.h
//  Created by BE

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppController : NSObject


+ (AppController *)sharedInstance;

@property (strong, nonatomic) NSMutableDictionary *currentUser;

@end