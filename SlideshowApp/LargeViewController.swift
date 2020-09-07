//
//  LargeViewController.swift
//  SlideshowApp
//
//  Created by 伊藤光次郎 on 2020/09/02.
//  Copyright © 2020 kojiro.ito. All rights reserved.
//

import UIKit

class LargeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var picture2: UIImageView!
   
    var imageName = "memory0"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        picture2.image = UIImage(named:imageName)
        

        // Do any additional setup after loading the view.
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
