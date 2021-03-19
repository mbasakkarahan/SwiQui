//
//  NasilOynarimViewCon.swift
//  SwiQui
//
//  Created by derin on 3.01.2021.
//

import UIKit

class NasilOynarimViewCon: UIViewController {

    @IBOutlet weak var anladimButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        anladimButton.layer.cornerRadius = 25.0
    }
    
    @IBAction func anladimAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
