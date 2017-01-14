//
//  ViewController.swift
//  manny-social
//
//  Created by Emmanuel Erilibe on 1/11/17.
//  Copyright © 2017 Emmanuel Erilibe. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    @IBOutlet weak var emailTextField: FancyField!
    @IBOutlet weak var passwordTextField: FancyField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            if error != nil {
                print("MANNY: Unable ro authenticate with Facebook: \(error)")
            } else if result?.isCancelled == true {
                print("MANNY: User cancelled Facebook authentication")
            } else {
                print("MANNY: Succcessfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
            
        }
    }

    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("MANNY: Unable to authenticate with Firebase: \(error)")
            } else {
                print("MANNY: Successfully authenticated with Firebase")
            }
        })
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("MANNY: Email user authenticated with Firebase \(error)")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("MANNY: Unable to authenticate with firebase using email \(error)")
                        } else {
                            print("MANNY: Successfully authenticated with Firebase")
                        }
                    })
                }
            })
        }
    }
}

