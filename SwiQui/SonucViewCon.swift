//
//  SonucViewCon.swift
//  SwiQui
//
//  Created by derin on 4.01.2021.
//

import UIKit

class SonucViewCon: UIViewController {

    @IBOutlet weak var sonucImage: UIImageView!
    @IBOutlet weak var tekrarOynaButton: UIButton!
    @IBOutlet weak var sonucLabel: UILabel!
    var dogruSayisi:Int?
    var puan=0
    override func viewDidLoad() {
        super.viewDidLoad()
        tekrarOynaButton.layer.cornerRadius = 25.0
        navigationItem.hidesBackButton = true
        if let d = dogruSayisi {
            puan = 0
            puan = d * 10
            sonucLabel.text = "\(puan) PUAN"
        }
        sonucImageOynat()
        
    }
    

    func sonucImageOynat(){
        sonucImage.alpha = 0
        if puan < 60{
            sonucImage.image = UIImage(named: "sad")
            navigationItem.title = "Kaybettiniz"
        }else{
            sonucImage.image = UIImage(named: "kupa")
            navigationItem.title = "Kazandınız"
        }
    
        UIView.animate(withDuration: 5, animations: {
            self.sonucImage.alpha = 1
            self.sonucImage.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        },completion: nil)
    }

    @IBAction func tekrarOyna(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
