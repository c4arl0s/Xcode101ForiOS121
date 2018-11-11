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
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var saveImage: UIImage?
        let imageChosen = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageViewer.image = imageChosen
        print("imageViewer.image")
        saveImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        print("photo dictionary: \(String(describing: saveImage))")
        UIImageWriteToSavedPhotosAlbum(saveImage!, nil, nil, nil)
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        print("el usuario canceló la seleccion de fotos")
    }
    
}
