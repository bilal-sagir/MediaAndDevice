import UIKit


extension UIColor
{
    public static var myColor: UIColor
    {
        return UIColor (named: "myColor")!
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageView.backgroundColor = UIColor.myColor
        imageView.image = #imageLiteral(resourceName: "dog")
    }


}

