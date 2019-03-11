//
//  ViewController.swift
//  iOS_animations
//
//  Created by Irvin Leon on 3/11/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var labelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonBottonConstraint: NSLayoutConstraint!
    
  
    @IBOutlet weak var passwordLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordFieldTopContraint: NSLayoutConstraint!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    
    var feedbackGenerator : UINotificationFeedbackGenerator? =  nil
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 20
    }

    @IBAction func loginAction(_ sender: Any) {
        self.feedbackGenerator = UINotificationFeedbackGenerator()
        self.feedbackGenerator?.prepare()
        self.feedbackGenerator?.notificationOccurred(.success)
        self.feedbackGenerator = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelTopConstraint.constant -= view.bounds.height
        buttonBottonConstraint.constant -= view.bounds.height
        
        passwordLabelTopConstraint.constant -= view.bounds.height
        passwordFieldTopContraint.constant -= view.bounds.height

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.labelTopConstraint.constant += self.view.bounds.height
            self.buttonBottonConstraint.constant += self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: {(completed) in
            UIView.animate(withDuration: 1, animations: {
                self.passwordLabelTopConstraint.constant += self.view.bounds.height
                self.passwordFieldTopContraint.constant += self.view.bounds.height
                self.view.layoutIfNeeded()
            }, completion: {(completed) in
                self.passwordField.backgroundColor = UIColor(named: "white")
                self.sendFeedback()
            })
            
        })
    }
    func sendFeedback() -> Void {
        self.feedbackGenerator = UINotificationFeedbackGenerator()
        self.feedbackGenerator?.prepare()
        self.feedbackGenerator?.notificationOccurred(.success)
        self.feedbackGenerator = nil
    }
    
}

