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
    @IBOutlet weak var cameraButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func takePictureButtonPressed(_ sender: UIButton) {
        showActionSheet()
    }
    func showActionSheet() {
        let actionSheet = UIAlertController(title: "Photos", message: "Select", preferredStyle: UIAlertControllerStyle.actionSheet)
        actionSheet.addAction(UIAlertAction(title: "photoLibrary", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("================1")
        let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        print("================2")
        imageViewer.contentMode = .scaleToFill
        print("================3")
        imageViewer.image = chosenImage
        print("================imageViewer.image")
        let saveImage = info[UIImagePickerControllerOriginalImage] as? UIImage
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
        print("The user cancelled the selection")
    }
    @IBAction func cameraButtonTapped(_ sender: UIBarButtonItem) {
        showActionSheet()
    }
    func photoLibrary()
    {
        let myPickerControllerImage = UIImagePickerController()
        myPickerControllerImage.delegate = self
        myPickerControllerImage.allowsEditing = true // Abner lo metió, probarlo.
        myPickerControllerImage.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerControllerImage, animated: true, completion: nil)
    }
    func camera()
    {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
            print("there's a camera ... but you will never got into this piece of code because simulator does not have camera")
        } else {
            print("there's no camera, pick photoLibrary")
        }
    }

}
