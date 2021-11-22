import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier != "seg"{return}
        
        let url = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")!
        
        let player = AVPlayer(url: url)
        
        let ctrl = segue.destination as! AVPlayerViewController
        
        ctrl.player = player
        player.play()
    }

}

