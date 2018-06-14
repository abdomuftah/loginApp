//
//  loggedInVC.swift
//  loginApp
//
//  Created by Naruto on 6/14/18.
//  Copyright © 2018 Naruto. All rights reserved.
//

import UIKit
import FirebaseAuth
import WebKit
import GoogleMobileAds


class loggedInVC: UIViewController, UIWebViewDelegate, GADBannerViewDelegate {
    @IBOutlet weak var website: UIWebView!
    @IBOutlet weak var adBanner: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Website Setting
        
        // replace Google website with your domain down here
        let url = URL(string: "https://google.com")
        website.delegate = self
        website.loadRequest(URLRequest(url: url!))
        
        
        // Ad Banner Setting
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        // put your ad Unit ID down here
        adBanner.adUnitID = "#####"
        adBanner.rootViewController = self
        adBanner.delegate = self
        adBanner.load(request)
        
        
        
    }
    
    
    // Logout Fun
    @IBAction func logoutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        }catch{
            print("There was a Error Logging Out")
        }
    }
    
    @IBAction func reload(_ sender: Any) {
        website.reload()
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func webViewDidStartLoad(_ webView: UIWebView){
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        activityIndicator.stopAnimating()
    }
}
