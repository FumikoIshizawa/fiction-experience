//
//  CameraViewController.swift
//  VirtualFictionExperience
//
//  Created by FumikoIshizawa on 2015/08/30.
//  Copyright (c) 2015年 FumikoIshiawa. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    var cameraSession: AVCaptureSession!
    var usingDevice: AVCaptureDevice!
    var imageOutput: AVCaptureStillImageOutput!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        cameraSession = AVCaptureSession()
        let devices = AVCaptureDevice.devices()

        for device in devices {
            if device.position == AVCaptureDevicePosition.Back {
                usingDevice = device as! AVCaptureDevice
            }
        }

        let videoInput = (try! AVCaptureDeviceInput(device: usingDevice) as AVCaptureDeviceInput)
        cameraSession.addInput(videoInput)

        imageOutput = AVCaptureStillImageOutput()
        cameraSession.addOutput(imageOutput)
        let videoLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: cameraSession) as AVCaptureVideoPreviewLayer
        videoLayer.frame = self.view.bounds
        videoLayer.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeRight
        videoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.view.layer.addSublayer(videoLayer)

        cameraSession.startRunning()

        backButton.hidden = true
        self.view.bringSubviewToFront(backButton)
        menuButton.hidden = true
        self.view.bringSubviewToFront(menuButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tappedCameraView(sender: UITapGestureRecognizer) {
        backButton.hidden = false
        menuButton.hidden = false
    }

    @IBAction func backButtonTouchUpInside(sender: UIButton) {
        backButton.hidden = true
        menuButton.hidden = true
    }

    @IBAction func menuButtonTouchUpInside(sender: UIButton) {
        backButton.hidden = true
        menuButton.hidden = true
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
