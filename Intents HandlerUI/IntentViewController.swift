//
//  IntentViewController.swift
//  Intents HandlerUI
//
//  Created by Aswini Ramesh on 9/5/17.
//  Copyright © 2017 Aswini Ramesh. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet weak var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    
    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
        
        if let paymentIntent = interaction.intent as? INSendPaymentIntent {
            // If any of this properties is not set, use the default UI.
            guard let amount = paymentIntent.currencyAmount?.amount, let currency = paymentIntent.currencyAmount?.currencyCode, let name = paymentIntent.payee?.displayName else {
                return completion(CGSize.zero)
            }
           // let paymentDescription = "\(amount)\(currency) to \(name)"
            displayLabel.text = ""
            print(interaction.description)}
        if let completion = completion {
            completion(self.desiredSize)
        }
    }
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
