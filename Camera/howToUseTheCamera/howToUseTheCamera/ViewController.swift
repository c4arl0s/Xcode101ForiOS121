//
//  ViewController.swift
//  howToUseTheCamera
//
//  Created by Carlos Santiago Cruz on 03/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate { // protocols
    @IBOutlet weak var imageViewer: UIImageView!
    var myControllerImage: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func takePictureButtonPressed(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            print("there's a camera")
        myControllerImage = UIImagePickerController()
        myControllerImage.delegate = self
        myControllerImage.sourceType = .camera
        present(myControllerImage, animated: true, completion: nil) // view updated.
        } else {
            print("there's no camera, pick photoLibrary")
            myControllerImage = UIImagePickerController()
            myControllerImage.delegate = self
            myControllerImage.allowsEditing = true // Abner lo metió, probarlo.
            myControllerImage.sourceType = .photoLibrary
            print("1")
            self.present(myControllerImage, animated: true, completion: nil) // view updated.
            print("2")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        var saveImage: UIImage?
        let imageChosen = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        imageViewer.image = imageChosen
        print("imageViewer.image")
        saveImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        print("photo dictionary: \(String(describing: saveImage))")
        UIImageWriteToSavedPhotosAlbum(saveImage!, nil, nil, nil)
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        print("el usuario canceló la seleccion de fotos")
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
