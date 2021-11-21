//
//  ViewController.swift
//  MediaAndDevice
//
//  Created by Bilal on 22.11.2021.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var imgView: UIImageView!
    var imgPicker: UIImagePickerController!
    
    @IBAction func getImg(_ sender: Any)
    {
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        
        let butAlert = UIAlertController(title: "Pick An Image", message: "Gallery or Camera", preferredStyle: UIAlertController.Style.alert)
        
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) //check camera available
        {
            let butCamera = UIAlertAction(title: "Camera",
                                          style: UIAlertAction.Style.default)
            { (act) in
                self.imgPicker.sourceType = .camera
                self.present(self.imgPicker, animated: true, completion: nil)
            }
            butAlert.addAction(butCamera)
        }
        
        
        let butGalery = UIAlertAction(title: "Galery", style: UIAlertAction.Style.default)
        { (act) in
            self.imgPicker.sourceType = .photoLibrary
            self.present(self.imgPicker, animated: true, completion: nil)
            
        }
        
        
        butAlert.addAction(butGalery)
        self.present(butAlert, animated: true, completion: nil)

    }
    
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        
        if let img = info[.originalImage] as? UIImage
        {
            imgView.image = img
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
}

