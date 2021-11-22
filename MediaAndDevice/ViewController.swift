import UIKit
import CoreMotion

class ViewController: UIViewController
{
    @IBOutlet weak var box: UIView!
    let motionManager = CMMotionManager()
    
    override func viewDidAppear(_ animated: Bool)
    {
        if !motionManager.isAccelerometerAvailable || //check available
            !motionManager.isGyroAvailable {return}
        
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!)
        { data, Error in
            guard let mData = data else {return}
            
            var cen = self.box.center
            
            cen.x += mData.acceleration.x
            cen.y += mData.acceleration.y
            
            self.box.center = cen
            
        }
        
    }
}

