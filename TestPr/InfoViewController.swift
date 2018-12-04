//
//  InfoViewController.swift
//  TestPr
//
//  Created by Денис Белоцерковец on 12/4/18.
//  Copyright © 2018 grep. All rights reserved.
//

import UIKit
import WebKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: path)
            webView.load(URLRequest(url: url))
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
}
