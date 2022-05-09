//
//  ViewController.swift
//  cloudkitkey
//
//  Created by Nisala on 5/9/22.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func click(_ sender: Any) {
        let operation = CKFetchWebAuthTokenOperation(apiToken: "d43e4a0f0eac5ab776190238b97c415e847d045760d3608d75994379dd02a565")
        operation.fetchWebAuthTokenResultBlock = { res in
            // CKError Service Unavailable on private cloud database
            print(res)
        }
        
        // This gets a key, but the key doesn't work with private db operations
        //  (ACCESS_DENIED, private db access disabled for this account)
        //CKContainer(identifier: "iCloud.baseline.getbaseline.app").publicCloudDatabase.add(operation);
        
        CKContainer(identifier: "iCloud.baseline.getbaseline.app").privateCloudDatabase.add(operation);
    }
}

