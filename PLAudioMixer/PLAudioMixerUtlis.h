//
//  PLAudioMixerUtils.h
//  PLAudioMixer
//
//  Created by Patrick Lin on 22/10/2017.
//  Copyright © 2017 Patrick Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface PLAudioMixerUtlis : NSObject

+ (void)reorderBuffer:(AudioBufferList *)audioBufferList;

+ (UInt32)covert16bitsTo32bits:(AudioBufferList *)inputBufferList outputBufferList:(AudioBufferList *)outputBufferList;

@end
