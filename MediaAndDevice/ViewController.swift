import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController
{
    func loadURL(_ url: URL){
        let player = AVPlayer(url: url)
        let ctrl = AVPlayerViewController()
        ctrl.player = player
        self.present(ctrl, animated: true, completion: nil)
        player.play()
    }

    @IBAction func online(_ sender: Any)
    {
        guard let url = URL(string: "http://techslides.com/demos/sample-videos/small.mp4") else {return}
    
        loadURL(url)
    }
    
    @IBAction func library(_ sender: Any)
    {
        let ctrl = UIImagePickerController()
        ctrl.sourceType = .photoLibrary
        ctrl.mediaTypes = ["public.movie"]
        ctrl.delegate = self
        
        self.present(ctrl, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        self.dismiss(animated: true, completion: nil)
        let url = info[.mediaURL]
        
        loadURL(url as! URL)
        
    }
}
