import UIKit
import AVFoundation

class ViewController: UIViewController

{
    var recorder: AVAudioRecorder!
    var player: AVAudioPlayer!
    var file: URL!
    
    @IBAction func recordAct(_ sender: Any)
    {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docsDir = urls[0] as URL
        
        file = docsDir.appendingPathComponent("myRecording.m4a")
        
        
        let settings =
        [
            AVSampleRateKey: 1200,
            AVFormatIDKey: Int (kAudioFormatMPEG4AAC),
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        
        
        do
        {
            recorder = try AVAudioRecorder(url: file, settings: settings)
            
            recorder.record()
            
        }catch{}
    }
    
    @IBAction func stopAct(_ sender: Any)
    {
        if let mRecorder = recorder
        {
            mRecorder.stop()
            recorder = nil
        }
    }
    
    @IBAction func playBackAct(_ sender: Any)
    {
        do
        {
           player = try AVAudioPlayer(contentsOf: file)
            player.prepareToPlay()
            player.play()
        }catch{}
    }
}

