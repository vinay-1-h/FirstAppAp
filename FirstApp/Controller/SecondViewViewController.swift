//
//  SecondViewViewController.swift
//  FirstApp
//
//  Created by Vinay on 15/12/23.
//

import UIKit

class SecondViewViewController: UIViewController {
    var result : WelcomeElement?
    
    @IBOutlet weak var bodyLBL: UITextView!
    
    @IBOutlet weak var nameLBL: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureeLable()
        // Do any additional setup after loading the view.
    }

    func configureeLable() {
        nameLBL.text = result?.name
        bodyLBL.text = result?.body
    }

}
