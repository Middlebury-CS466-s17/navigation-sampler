//
//  ContainerViewController.swift
//  Navigation Styles
//
//  Created by Christopher Andrews on 3/19/17.
//  Copyright © 2017 Andrews, Christopher P. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, UIPageViewControllerDataSource , UIPageViewControllerDelegate{

    @IBOutlet weak var pageControl: UIPageControl!
    
    var pageViewController: UIPageViewController?
    var currentIndex = 0
    var pendingIndex: Int?
    
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
        pageViewController = self.childViewControllers[0] as? UIPageViewController
        pageViewController!.dataSource = self
        pageViewController!.delegate = self

        pageViewController!.setViewControllers([viewControllerCollection[currentIndex]],
                                               direction: .forward,
                                               animated: true,
                                               completion: nil)
        pageControl.numberOfPages = viewControllerCollection.count

        
    }

    

    @IBAction func pageChanged(_ sender: UIPageControl) {
        if sender.currentPage > currentIndex {
            pageViewController!.setViewControllers([viewControllerCollection[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        } else {
            pageViewController!.setViewControllers([viewControllerCollection[sender.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
        currentIndex = sender.currentPage

    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard var index = viewControllerCollection.index(of: viewController) else {
            return nil
        }
        index = index - 1
        return index >= 0 ? viewControllerCollection[index] : nil
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard var index = viewControllerCollection.index(of: viewController) else {
            return nil
        }
        index = index + 1
        return index < viewControllerCollection.count ? viewControllerCollection[index] : nil
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = viewControllerCollection.index(of: pendingViewControllers.first!)
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let pendingIndex = pendingIndex {
                currentIndex = pendingIndex
                pageControl.currentPage = currentIndex
            }
        }
    }
}
