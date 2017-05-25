//
//  AppController.m


#import "AppController.h"
#import "SBJsonParser.h"

static AppController *_appController;

@implementation AppController

+ (AppController *)sharedInstance {
    static dispatch_once_t predicate;
    if (_appController == nil) {
        dispatch_once(&predicate, ^{
            _appController = [[AppController alloc] init];
        });
    }
    return _appController;
}

- (id)init {
    self = [super init];
    if (self) {
        
        // Utility Data
        
        _currentUser = [[NSMutableDictionary alloc] init];
        
    }
    return self;
}


+ (NSDictionary*) requestApi:(NSMutableDictionary *)params withFormat:(NSString *)url {
    return [AppController jsonHttpRequest:url jsonParam:params];
}

+ (id) jsonHttpRequest:(NSString*) urlStr jsonParam:(NSMutableDictionary *)params {
    NSString *paramStr = [commonUtils getParamStr:params];
    //NSLog(@"\n\nparameter string : \n\n%@", paramStr);
    NSData *requestData = [paramStr dataUsingEncoding:NSUTF8StringEncoding];

    NSData *data = nil;
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSHTTPURLResponse *response = nil;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody: requestData];
    data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
//    NSLog(@"\n\nresponse string : \n\n%@", responseString);
    return [[SBJsonParser new] objectWithString:responseString];
}

@end
