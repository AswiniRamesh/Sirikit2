//
//  IntentHandler.swift
//  Intents Handler
//
//  Created by Aswini Ramesh on 9/5/17.
//  Copyright © 2017 Aswini Ramesh. All rights reserved.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"


class IntentHandler: INExtension, INSendPaymentIntentHandling {
    
    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        // Check that we have valid values for payee and currencyAmount
        guard let payee = intent.payee, let amount = intent.currencyAmount else {
            return completion(INSendPaymentIntentResponse(code: .unspecified, userActivity: nil))
        }
        // Make your payment!
        print("Sending \(amount) payment to \(payee)!")
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
    }
}
    
