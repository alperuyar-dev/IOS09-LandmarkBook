//
//  ViewController.swift
//  IOS09-LandmarkBook
//
//  Created by Alper Uyar on 25.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var landmarkNames=[String]()
    var landMarkImages=[UIImage]()
    
    var chosenImage=UIImage()
    var chosenText=""
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Istanbul, Turkey")
        landmarkNames.append("London, England")
        landmarkNames.append("Viana, Spain")
        landmarkNames.append("New York, USA")
        
        landMarkImages.append(UIImage(named: "istanbul")!)
        landMarkImages.append(UIImage(named: "london")!)
        landMarkImages.append(UIImage(named: "viana")!)
        landMarkImages.append(UIImage(named: "newyork")!)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = UITableViewCell()
        var content = cel.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cel.contentConfiguration = content
        return cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         chosenImage = landMarkImages[indexPath.row]
         chosenText = landmarkNames[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toDetailsVC"{
            let destinationVC = segue.destination as? DetailsVC
            destinationVC?.selectedText=chosenText
            destinationVC?.selectedImage=chosenImage
            
        }
    }
    
}

