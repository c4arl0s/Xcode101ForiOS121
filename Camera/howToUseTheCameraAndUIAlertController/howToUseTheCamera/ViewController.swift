//
//  ViewController.swift
//  howToUseTheCamera
//
//  Created by Carlos Santiago Cruz on 03/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController:   UIViewController, UINavigationControllerDelegate,
                        UIImagePickerControllerDelegate { // protocols
    @IBOutlet weak var imageViewer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func takePictureButtonPressed(_ sender: UIButton) {
        showActionSheet()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        print("================1")
        let chosenImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        print("================2")
        imageViewer.contentMode = .scaleToFill
        print("================3")
        imageViewer.image = chosenImage
        print("================imageViewer.image")
        let saveImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        print("================4")
        print("photo dictionary: \(String(describing: saveImage))")
        print("================5")
        UIImageWriteToSavedPhotosAlbum(saveImage!, nil, nil, nil)
        print("================6")
        dismiss(animated: true, completion: nil)
        print("================7")
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        print("el usuario canceló la seleccion de fotos")
    }
    func camera()
    {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            print("there's a camera ...")
            print("")
        } else {
            print("there's no camera, pick photoLibrary")
        }
    }
    func photoLibrary()
    {
        let myPickerControllerImage = UIImagePickerController()
        myPickerControllerImage.delegate = self
        myPickerControllerImage.allowsEditing = true // Abner lo metió, probarlo.
        myPickerControllerImage.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerControllerImage, animated: true, completion: nil)
    }
    func showActionSheet() {
        let actionSheet = UIAlertController(title: "Photos", message: "Select", preferredStyle: UIAlertController.Style.actionSheet)
        actionSheet.addAction(UIAlertAction(title: "photoLibrary", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
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
