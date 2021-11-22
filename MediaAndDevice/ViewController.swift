import UIKit
import AVFoundation

class ViewController: UIViewController
{

    @IBOutlet weak var progLabel: UILabel!
    @IBOutlet weak var progBar: UIProgressView!
    
    var myPlayer: AVAudioPlayer?
    var pausedTime = 0.0
    var timer: Timer!
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        progBar.progress = 0.0
        
        if let file = Bundle.main.url(forResource: "song", withExtension: "mp3")
        {
            do
            {
                myPlayer = try AVAudioPlayer(contentsOf: file)
                myPlayer?.prepareToPlay()
            }
            catch let error as NSError
            {
                print(error.description)
            }
        }

    }

    
    
    @IBAction func playAct(_ sender: Any)
    {
        if let player = myPlayer
        {
            player.currentTime = pausedTime
            player.play()
            
            timer = Timer.scheduledTimer(timeInterval: 0.05,
                                         target: self,
                                         selector: #selector(progFunc),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    @objc func progFunc ()
    {
        guard let player = myPlayer else {return}
        
        let progRate = player.currentTime / player.duration
        progBar.progress = Float(progRate)
        progLabel.text =
        String(format: "%0.1f", player.currentTime)
        + " / " +
        String(format: "%0.1f", player.duration)
    }
    
    @IBAction func pauseAct(_ sender: Any)
    {
        if let player = myPlayer
        {
            player.pause()
            pausedTime = player.currentTime
        }
        
        if let mTimer = timer
        {
            mTimer.invalidate()
        }
   
    }
}

