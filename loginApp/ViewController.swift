//
//  ViewController.swift
//  loginApp
//
//  Created by Naruto on 6/14/18.
//  Copyright © 2018 Naruto. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.presentLoggedInScreen()
        }
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let firbaseError = error {
                    print(firbaseError.localizedDescription)
                    return
                }
                self.presentLoggedInScreen()
            }
        }
        
    }
    func presentLoggedInScreen()  {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInVC:loggedInVC = storyboard.instantiateViewController(withIdentifier: "loggedInVC") as! loggedInVC
        self.present(loggedInVC, animated: true, completion: nil)
    }

}

