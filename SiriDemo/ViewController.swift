//
//  ViewController.swift
//  SiriDemo
//
//  Created by Aswini Ramesh on 9/5/17.
//  Copyright © 2017 Aswini Ramesh. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        INPreferences.requestSiriAuthorization { (status) in
            
        }
        
        INVocabulary.shared().setVocabularyStrings(["push up", "sit up", "pull up"], of: .paymentsOrganizationName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

