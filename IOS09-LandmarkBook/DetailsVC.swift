//
//  DetailsVC.swift
//  IOS09-LandmarkBook
//
//  Created by Alper Uyar on 25.09.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var TextLabel: UILabel!
    
    
    @IBOutlet weak var landmarkImage: UIImageView!
    
    var selectedText=""
    var selectedImage=UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextLabel.text=selectedText
        landmarkImage.image=selectedImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
