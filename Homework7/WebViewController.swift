//
//  WebViewController.swift
//  Homework7
//
//  Created by Austin Gmuer on 4/21/20.
//  Copyright © 2020 Austin Gmuer. All rights reserved.
//

import UIKit
import WebKit
import MessageUI

class WebViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    }
    


    @IBOutlet weak var webView: WKWebView!
    
    
    @IBAction func openSite(_ sender: Any) {
        if let url = URL(string: "https://www.chincoteague.com"){
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    @IBAction func sendText(_ sender: Any) {
        let composeVC = MFMessageComposeViewController()
               composeVC.messageComposeDelegate = self
               
               composeVC.recipients = ["7246912111"]
               composeVC.body = "Hello. I'd like some more information about the island!"
               
               if MFMessageComposeViewController.canSendText() {
                   self.present(composeVC, animated: true, completion: nil)
                   
               }else {
                   print("Can't send message.")
               }
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
