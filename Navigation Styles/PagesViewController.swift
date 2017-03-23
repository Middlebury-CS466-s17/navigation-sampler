//
//  PagesViewController.swift
//  Navigation Styles
//
//  Created by Christopher Andrews on 3/23/17.
//  Copyright © 2017 Christopher Andrews. All rights reserved.
//

import UIKit

class PagesViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    // Create the collection of pages
    private  var viewControllerCollection : [UIViewController] = {
        let labels = ["One fish", "Two fish", "Red fish", "Blue fish"]
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        var controllers:[UIViewController] = []
        
        for i in 0..<labels.count{
            let page = storyboard.instantiateViewController(withIdentifier: "Page")
            (page as! PageViewController).labelText = labels[i]
            (page as! PageViewController).index = i
            controllers.append(page)
        }
        
        
        return controllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        
        setViewControllers([viewControllerCollection[0]], direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vc = viewController as? PageViewController else{
            return nil
        }
        let index = vc.index! - 1
        return index >= 0 ? viewControllerCollection[index] : nil
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? PageViewController else{
            return nil
        }
        let index = vc.index! + 1
        return index < viewControllerCollection.count ? viewControllerCollection[index] : nil
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerCollection.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        return 0
    }

   
}
