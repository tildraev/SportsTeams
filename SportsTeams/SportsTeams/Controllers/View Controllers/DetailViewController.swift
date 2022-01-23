//
//  DetailViewController.swift
//  SportsTeams
//
//  Created by Arian Mohajer on 1/22/22.
//

import UIKit

class DetailViewController: UIViewController {

    var team: Team? = nil
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var rankingTextField: UITextField!
    @IBOutlet weak var playerCountTextField: UITextField!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        nameTextField.text = ""
        rankingTextField.text = ""
        playerCountTextField.text = ""
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
}
