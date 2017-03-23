//
//  PageViewController.swift
//  Navigation Styles
//
//  Created by Christopher Andrews on 3/23/17.
//  Copyright © 2017 Christopher Andrews. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    var index:Int? // keep track of the page number
    
    @IBOutlet weak var label: UILabel!
   
    var labelText:String = ""{
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        if label != nil{
            label!.text = labelText
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

   }
