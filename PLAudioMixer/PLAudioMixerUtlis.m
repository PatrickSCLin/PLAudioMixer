//
//  PLAudioMixerUtils.m
//  PLAudioMixer
//
//  Created by Patrick Lin on 22/10/2017.
//  Copyright © 2017 Patrick Lin. All rights reserved.
//

#import "PLAudioMixerUtlis.h"

@implementation PLAudioMixerUtlis

+ (void)reorderBuffer:(AudioBufferList *)audioBufferList {
    
    AudioBuffer buffer = audioBufferList->mBuffers[0];
    
    uint8_t* p = (uint8_t *)buffer.mData;
    
    for (int i = 0; i < buffer.mDataByteSize; i += 2)
    {
        uint8_t tmp;
        
        tmp = p[i];
        
        p[i] = p[i + 1];
        
        p[i + 1] = tmp;
    }
    
}

+ (void)covert16bitsTo32bits:(AudioBufferList *)inputBufferList outputBufferList:(AudioBufferList *)outputBufferList {
    
    Float32* output_buffer = (Float32 *)outputBufferList->mBuffers[0].mData;
    
    SInt16* input_buffer = (SInt16 *)(inputBufferList->mBuffers[0].mData);
    
    UInt32 numberFrames = MIN(inputBufferList->mBuffers[0].mDataByteSize / 2, outputBufferList->mBuffers[0].mDataByteSize / 4);
    
    for (UInt32 frame = 0; frame < numberFrames; frame++)
    {
        output_buffer[frame] = ((Float32) input_buffer[frame]) / 32768.0f;
    }
    
}

+ (void)covert32bitsTo16bits:(AudioBufferList *)inputBufferList outputBufferList:(AudioBufferList *)outputBufferList {
    
    SInt16* output_buffer = (SInt16 *)outputBufferList->mBuffers[0].mData;
    
    Float32* input_buffer = (Float32 *)(inputBufferList->mBuffers[0].mData);
    
    UInt32 numberFrames = MIN(inputBufferList->mBuffers[0].mDataByteSize / 4, outputBufferList->mBuffers[0].mDataByteSize / 2);
    
    for (UInt32 frame = 0; frame < numberFrames; frame++)
    {
        output_buffer[frame] = ((Float32) input_buffer[frame]) * 32768.0f;
    }
    
}

@end


