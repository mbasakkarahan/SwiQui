//
//  ViewController.swift
//  SwiQui
//
//  Created by derin on 3.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var baslaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        baslaButton.layer.cornerRadius = 25.0
        
    }
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "quizdb", ofType: ".db")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("quizdb.db")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten kopyalanmış")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error)
            }
        }
        
    }


}

