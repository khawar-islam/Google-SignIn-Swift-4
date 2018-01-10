//
//  ViewController.swift
//  Google SignIn Swift 4
//
//  Created by MacBook Pro on 10/01/2018.
//  Copyright © 2018 MacBook Pro. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google

class ViewController: UIViewController,GIDSignInUIDelegate, GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            print(user.userID)                // For client-side use only!
            print(user.authentication.idToken) // Safe to send to the server
            print(user.profile.name)
            print(user.profile.givenName)
            print(user.profile.familyName)
            print(user.profile.email)
            print(user.authentication.accessToken)
            print(user.profile)
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user:GIDGoogleUser!,
              withError error: Error!) {
    }
    @IBAction func onBtnTapGmailLogin(sender: GIDSignInButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        var configureError:NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

