//
//  ViewController.swift
//  FaceDetectorTest
//
//  Created by stplmacmini14 on 30/05/18.
//  Copyright © 2018 Systango. All rights reserved.
//

import UIKit
import SysFaceDetector
import ActionSheetPicker_3_0

class ViewController: UIViewController, CameraViewControllerDelegate {
    var cameraFacing: CameraFacing?
    var livenessAction: LivenessAction?
    var strictnessMode: StrictnessMode?
    
    @IBOutlet weak var strictnessButton: UIButton!
    @IBOutlet weak var cameraFaceButton: UIButton!
    @IBOutlet weak var livenessActionButton: UIButton!
    func didTakeImage(image: UIImage) {
        dismiss(animated: true) {
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
            viewController.takenImage = image
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    func didPressBack() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func cameraFaceTapped(_ sender: Any) {
        ActionSheetStringPicker.show(withTitle: "Select Camera Face", rows: ["Front", "Back"], initialSelection: 0, doneBlock: {
            picker, value, index in
            self.cameraFacing = CameraFacing(rawValue: value)!
            self.cameraFaceButton.setTitle(index as? String, for: .normal)
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
    }
    @IBAction func livenessActionTapped(_ sender: Any) {
        ActionSheetStringPicker.show(withTitle: "Select Liveness Action", rows: ["None", "Smile Only", "Blink Only", "Smile Then Blink", "Blink Then Smile"], initialSelection: 0, doneBlock: {
            picker, value, index in
            self.livenessAction = LivenessAction(rawValue: value)!
            self.livenessActionButton.setTitle(index as? String, for: .normal)
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
    }
    @IBAction func strictnessTapped(_ sender: Any) {
        ActionSheetStringPicker.show(withTitle: "Select Strictness", rows: ["Lenient", "Strict"], initialSelection: 0, doneBlock: {
            picker, value, index in
            self.strictnessMode = StrictnessMode(rawValue: value)!
            self.strictnessButton.setTitle(index as? String, for: .normal)
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
    }
    @IBAction func goButtonTapped(_ sender: Any) {
        if cameraFacing == nil {
            showAlert(message: "Please select camera face.")
        } else if livenessAction == nil {
            showAlert(message: "Please select liveness action.")
        } else if strictnessMode == nil {
            showAlert(message: "Please select strictness mode.")
        } else {
            let cam = SysFaceDetector(accessKey: "e4f0cadc2537ff789e188b8e5813dbc3f7f12b0f37f657df3cd42eb656a1f694cb648db83bafc380abb8712236ec07f19704e56b9c077ac78217557f5eca1546", withCameraDelegate: self)
            cam.presentViewController(onViewController: self, livenessAction: livenessAction!, strictnessMode: strictnessMode!, cameraFacing: cameraFacing!, showInstructions: true, cameraPreset: .photo)
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle : .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
