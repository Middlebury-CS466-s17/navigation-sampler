//
//  CreatureViewController.swift
//  Navigation Styles
//
//  Created by Christopher Andrews on 3/23/17.
//  Copyright © 2017 Christopher Andrews. All rights reserved.
//

import UIKit

class CreatureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationvc = segue.destination as? DetailViewController else{
            fatalError("Connecting to the wrong type of view controller")
        }
        
        guard let identifier = segue.identifier else{
            fatalError("Segue had no identifier")
        }
        
        destinationvc.creature = getCreature(type: identifier)
        
    }
 

}
