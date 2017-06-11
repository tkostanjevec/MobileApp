//
//  ViewControllerGallery.swift
//  MobileMedic
//
//  Created by Tadej Kostanjevec on 08/06/2017.
//  Copyright © 2017 Tadej Kostanjevec. All rights reserved.
//

import UIKit
import PhotoEditorSDK

class ViewControllerGallery: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    //MARK: Properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    var CIFilterNames = [
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CISepiaTone"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var xCoord: CGFloat = 5
        let yCoord: CGFloat = 5
        let buttonWidth:CGFloat = 70
        let buttonHeight: CGFloat = 70
        let gapBetweenButtons: CGFloat = 5
        
        var itemCount = 0
        
        for i in 0..<CIFilterNames.count {
            itemCount = i
            
            // Button properties
            let filterButton = UIButton(type: .Custom)
            filterButton.frame = CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)
            filterButton.tag = itemCount
            filterButton.addTarget(self, action: #selector(ViewController.filterButtonTapped(_:)), forControlEvents: .TouchUpInside)
            filterButton.layer.cornerRadius = 6
            filterButton.clipsToBounds = true
            
            // Create filters for each button
            let ciContext = CIContext(options: nil)
            let coreImage = CIImage(image: originalImage.image!)
            let filter = CIFilter(name: "\(CIFilterNames[i])" )
            filter!.setDefaults()
            filter!.setValue(coreImage, forKey: kCIInputImageKey)
            let filteredImageData = filter!.valueForKey(kCIOutputImageKey) as! CIImage
            let filteredImageRef = ciContext.createCGImage(filteredImageData, fromRect: filteredImageData.extent)
            let imageForButton = UIImage(CGImage: filteredImageRef);
            // Assign filtered image to the button
            filterButton.setBackgroundImage(imageForButton, forState: .Normal)
            
            // Add Buttons in the Scroll View
            xCoord +=  buttonWidth + gapBetweenButtons
            filtersScrollView.addSubview(filterButton)
        } // END FOR LOOP
        
        
        // Resize Scroll View
        filtersScrollView.contentSize = CGSizeMake(buttonWidth * CGFloat(itemCount+2), yCoord)
        
            
    }
    
    func filterButtonTapped(sender: UIButton) {
        let button = sender as UIButton
        
        imageToFilter.image = button.backgroundImageForState(UIControlState.Normal)
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        labelText.text = "Kliknil si na sliko"
        photoLibrary()
    }
    func photoLibrary()
    {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editPicture1(_ sender: UIButton) {
        
    }
    
    


}
