//
//  ViewController.swift
//  VirtualFictionExperience
//
//  Created by FumikoIshizawa on 2015/08/30.
//  Copyright (c) 2015年 FumikoIshiawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startButtonTouchUpInside(sender: UIButton) {
        print("pressed")
        let storyBoard = UIStoryboard(name: "CameraViewController", bundle: nil)
        if let cameraViewController = storyBoard.instantiateInitialViewController() as? CameraViewController {
            self.presentViewController(cameraViewController, animated: true, completion: nil)
        } else {
            print("Something Happend")
        }
    }

}

