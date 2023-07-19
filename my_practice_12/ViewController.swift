//
//  ViewController.swift
//  my_practice_12
//
//  Created by 이태윤 on 2023/07/19.
//

//
//  ViewController.swift
//  my_practice_7
//
//  Created by 이태윤 on 2023/07/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    @IBOutlet var page_control: UIPageControl!
    
    var texts = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        page_control.numberOfPages = 10
        page_control.currentPage = 0
        page_control.pageIndicatorTintColor = UIColor.black
        page_control.currentPageIndicatorTintColor = UIColor.red
        label.text = "1"
        
        let swipe_left = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respond_to_swipe(_:)))
        swipe_left.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipe_left)
        
        let swipe_right = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respond_to_swipe(_:)))
        swipe_right.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipe_right)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func page_controller(_ sender: UIPageControl) {
        label.text = texts[page_control.currentPage]
    }
    
    @objc func respond_to_swipe (_ gesture : UIGestureRecognizer) {
        if let swipe = gesture as? UISwipeGestureRecognizer {
        switch swipe.direction {
        case UISwipeGestureRecognizer.Direction.right:
            if page_control.currentPage > 0 {
                page_control.currentPage -= 1
                label.text = texts[page_control.currentPage]
            } else {
                page_control.currentPage = 9
                label.text = texts[page_control.currentPage]
            }
        case UISwipeGestureRecognizer.Direction.left:
            if page_control.currentPage < 9 {
                page_control.currentPage += 1
                label.text = texts[page_control.currentPage]
            } else {
                page_control.currentPage = 0
                label.text = texts[page_control.currentPage]
            }
        default:
            break
        }
        }
    }
}

