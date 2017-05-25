//
//  SearchWantLibraryCell.m
//  GameSlam
//
//  Created by Jose on 3/22/16.
//  Copyright © 2016 zoltan. All rights reserved.
//

#import "SearchWantLibraryCell.h"

@implementation SearchWantLibraryCell


-(void)setWantInfo:(NSDictionary *)wantInfo{
    
    if (!wantInfo) {     
      
        _imageView.image =wantInfo[@""];
        _gameIntroLabel.text = wantInfo[@""];
        _platformLabel.text =  wantInfo[@""];
        
    }
    
}

@end
