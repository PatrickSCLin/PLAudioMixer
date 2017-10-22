# PLAudioMixer
Simple audio mixer based on AVAudioEngine offline rendering

#### Requirement
XCode 9.0+
Swift 3.2+

#### Support
Multiple audio sources
CMSampleBuffer to AVAudioPCMBuffer (only support PCM to PCM format currently)

#### Delegate

```swift
public protocol PLAudioMixerDelegate: NSObjectProtocol {
    
    func mixer(_ mixer: PLAudioMixer, didRender pcmBuffer: AVAudioPCMBuffer, userInfo: [String: Any]?)
    
}
```

#### Usage

```swift
//setup
let audioMixer = PLAudioMixer(sampleRate: 44100, channels: 1)
audioMixer.attach(identifier: "Audio")
audioMixer.attach(identifier: "Mic")
audioMixer.setVolume(identifier: "Audio", volume: 0.25)
audioMixer.setVolume(identifier: "Mic", volume: 1)
audioMixer.delegate  = self
audioMixer.start()

//append pcm buffer
audioMixer.appendBuffer(identifier: "Audio", pcmBuffer: pcmBuffer)

// render buffer
// you can put your own custom data into userInfo ex: timestamp
audioMixer.render(userInfo: userInfo)
```
