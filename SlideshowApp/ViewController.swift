//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 伊藤光次郎 on 2020/09/01.
//  Copyright © 2020 kojiro.ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var slideshowButton: UIButton!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var forward: UIButton!
    @IBOutlet weak var back: UIButton!
    var int = 0
    var imagefolder = ["memory1","memory2","memory3"]
    var flag = false
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picture.image = UIImage(named:imagefolder[int])
        slideshowButton.setTitle("再生", for: .normal)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if flag == true{
            flag = false
            forward.isEnabled = true
            back.isEnabled = true
            timer.invalidate()
            slideshowButton.setTitle("再生", for: .normal)
            
            
        }
        //UIViewControllerはResultViewControllerの上位クラス
        let largeViewController:LargeViewController =  segue.destination as! LargeViewController
        
        largeViewController.imageName = imagefolder[int]
        
    }
    @objc func slideshow() {
        int += 1
        if int == imagefolder.count{
            int = 0
        }
        
        picture.image = UIImage(named: imagefolder[int])
        
    }
    
    @IBAction func forward(_ sender: Any) {
        if int < imagefolder.count-1{
            int += 1
            picture.image = UIImage(named:imagefolder[int])
        }else if int == imagefolder.count-1  {
            picture.image = UIImage(named: imagefolder.first!)
            int = 0
            
        }
    }
    
    @IBAction func back(_ sender: Any) {
        if int > 0{
            int -= 1
            picture.image = UIImage(named:imagefolder[int])
        }else if int == 0{
            picture.image = UIImage(named: imagefolder.last!)
            int = imagefolder.count-1
        }
    }
    @IBAction func slideshowButton(_ sender: Any) {
        if flag == false{
            flag = true
            forward.isEnabled = false
            back.isEnabled = false
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideshow), userInfo: nil, repeats: true)
            slideshowButton.setTitle("停止", for: .normal)
        }else {
            flag = false
            forward.isEnabled = true
            back.isEnabled = true
            timer.invalidate()
            slideshowButton.setTitle("再生", for: .normal)
        }
        
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        
    }
    
    
    
}

