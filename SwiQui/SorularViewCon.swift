//
//  SorularViewCon.swift
//  SwiQui
//
//  Created by derin on 3.01.2021.
//

import UIKit

class SorularViewCon: UIViewController {

    @IBOutlet weak var soru1: UILabel!
    @IBOutlet weak var soru2: UILabel!
    @IBOutlet weak var soru3: UILabel!
    @IBOutlet weak var soru4: UILabel!
    @IBOutlet weak var soru5: UILabel!
    @IBOutlet weak var soru6: UILabel!
    @IBOutlet weak var soru7: UILabel!
    @IBOutlet weak var soru8: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var secenek1: UIButton!
    @IBOutlet weak var secenek2: UIButton!
    @IBOutlet weak var secenek3: UIButton!
    @IBOutlet weak var secenek4: UIButton!
    let progress = Progress(totalUnitCount: 50)
    
    @IBOutlet weak var soruLabel: UILabel!
    var sorularListe = [Sorular]()
    var soruSayac = 0
    var secenekKaristirmaListesi = Set <String>()
    var secenekler = [String]()
    
    var dogruSayac = 0
    var yanlisSayac = 0
    var seviye = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        soruSayisiCerceve()
        secenekCornerAyarla()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        soruSayisiCerceve()
        soruSayac = 0
        dogruSayac = 0
        seviye = 1
        sorularListe = SorularDao().rastgele8SoruGetir(seviye: 1)
        navigationItem.title = "Seviye 1"
        
       
       soruYukle()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidilecekVC = segue.destination as! SonucViewCon
        gidilecekVC.dogruSayisi = dogruSayac
    }
    func soruYukle(){
      
        let soru = soruSayac
        print("Soru Sayaç : \(soruSayac)")
        print("Soru : \(soru)")
        soruLabel.text = sorularListe[soruSayac].soru
        
        secenekKaristirmaListesi.removeAll()
        secenekKaristirmaListesi.insert((sorularListe[soruSayac].cevap?.dogru_cevap)!)
        secenekKaristirmaListesi.insert((sorularListe[soruSayac].cevap?.secenek1)!)
        secenekKaristirmaListesi.insert((sorularListe[soruSayac].cevap?.secenek2)!)
        secenekKaristirmaListesi.insert((sorularListe[soruSayac].cevap?.secenek3)!)
    
        secenekler.removeAll()
        
        for s in secenekKaristirmaListesi {
            secenekler.append(s)
        }
        secenek1.setTitle(secenekler[0], for: .normal)
        secenek2.setTitle(secenekler[1], for: .normal)
        secenek3.setTitle(secenekler[2], for: .normal)
        secenek4.setTitle(secenekler[3], for: .normal)
        
        
        
        progressView.backgroundColor = UIColor.green
        progressView.progress = 0.0
        progress.completedUnitCount = 0
        self.sureyiBaslat()
    }
    func dogruKontrol(button:UIButton){
        let buttonYazi = button.titleLabel?.text
        let dogruCevap = sorularListe[soruSayac].cevap?.dogru_cevap
    
        if soruSayac == 0{
            if dogruCevap == buttonYazi {
                dogruSayac += 1
                soru1.backgroundColor = UIColor(named: "correctAnswer")
                soru1.textColor = UIColor.white
                soru1.layer.borderWidth = 1
                soru1.layer.borderColor = UIColor(named: "correctAnswer")?.cgColor
                
            }else{
                yanlisSayac += 1
                soru1.backgroundColor = UIColor(named: "wrongAnswer")
                soru1.textColor = UIColor.white
                soru1.layer.borderWidth = 1
                soru1.layer.borderColor = UIColor(named: "wrongAnswer")?.cgColor
            }
        }else if soruSayac == 1{
            if dogruCevap == buttonYazi {
                dogruSayac += 1
                soru2.backgroundColor = UIColor(named: "correctAnswer")
                soru2.textColor = UIColor.white
                soru2.layer.borderWidth = 1
                soru2.layer.borderColor = UIColor(named: "correctAnswer")?.cgColor
                
            }else{
                yanlisSayac += 1
                soru2.backgroundColor = UIColor(named: "wrongAnswer")
                soru2.textColor = UIColor.white
                soru2.layer.borderWidth = 1
                soru2.layer.borderColor = UIColor(named: "wrongAnswer")?.cgColor
            }
            
            
        }else if soruSayac == 2{
            if dogruCevap == buttonYazi {
                dogruSayac += 1
                soru3.backgroundColor = UIColor(named: "correctAnswer")
                soru3.textColor = UIColor.white
                soru3.layer.borderWidth = 1
                soru3.layer.borderColor = UIColor(named: "correctAnswer")?.cgColor
                
            }else{
                yanlisSayac += 1
                soru3.backgroundColor = UIColor(named: "wrongAnswer")
                soru3.textColor = UIColor.white
                soru3.layer.borderWidth = 1
                soru3.layer.borderColor = UIColor(named: "wrongAnswer")?.cgColor
            }
            
        }else if soruSayac == 3{
            if dogruCevap == buttonYazi {
                dogruSayac += 1
                soru4.backgroundColor = UIColor(named: "correctAnswer")
                soru4.textColor = UIColor.white
                soru4.layer.borderWidth = 1
                soru4.layer.borderColor = UIColor(named: "correctAnswer")?.cgColor
                
            }else{
                yanlisSayac += 1
                soru4.backgroundColor = UIColor(named: "wrongAnswer")
                soru4.textColor = UIColor.white
                soru4.layer.borderWidth = 1
                soru4.layer.borderColor = UIColor(named: "wrongAnswer")?.cgColor
            }
            
        }
        else if soruSayac == 4{
            if dogruCevap == buttonYazi {
                dogruSayac += 1
                soru5.backgroundColor = UIColor(named: "correctAnswer")
                soru5.textColor = UIColor.white
                soru5.layer.borderWidth = 1
                soru5.layer.borderColor = UIColor(named: "correctAnswer")?.cgColor
                
            }else{
                yanlisSayac += 1
                soru5.backgroundColor = UIColor(named: "wrongAnswer")
                soru5.textColor = UIColor.white
                soru5.layer.borderWidth = 1
                soru5.layer.borderColor = UIColor(named: "wrongAnswer")?.cgColor
            }
            
        }
        else if soruSayac == 5{
            if dogruCevap == buttonYazi {
                dogruSayac += 1
                soru6.backgroundColor = UIColor(named: "correctAnswer")
                soru6.textColor = UIColor.white
                soru6.layer.borderWidth = 1
                soru6.layer.borderColor = UIColor(named: "correctAnswer")?.cgColor
                
            }else{
                yanlisSayac += 1
                soru6.backgroundColor = UIColor(named: "wrongAnswer")
                soru6.textColor = UIColor.white
                soru6.layer.borderWidth = 1
                soru6.layer.borderColor = UIColor(named: "wrongAnswer")?.cgColor
            }
            
        }
        else if soruSayac == 6{
            if dogruCevap == buttonYazi {
                dogruSayac += 1
                soru7.backgroundColor = UIColor(named: "correctAnswer")
                soru7.textColor = UIColor.white
                soru7.layer.borderWidth = 1
                soru7.layer.borderColor = UIColor(named: "correctAnswer")?.cgColor
                
            }else{
                yanlisSayac += 1
                soru7.backgroundColor = UIColor(named: "wrongAnswer")
                soru7.textColor = UIColor.white
                soru7.layer.borderWidth = 1
                soru7.layer.borderColor = UIColor(named: "wrongAnswer")?.cgColor
            }
            
        }
        else if soruSayac == 7{
            if dogruCevap == buttonYazi {
                dogruSayac += 1
                soru8.backgroundColor = UIColor(named: "correctAnswer")
                soru8.textColor = UIColor.white
                soru8.layer.borderWidth = 1
                soru8.layer.borderColor = UIColor(named: "correctAnswer")?.cgColor
                
                
            }else{
                yanlisSayac += 1
                soru8.backgroundColor = UIColor(named: "wrongAnswer")
                soru8.textColor = UIColor.white
                soru8.layer.borderWidth = 1
                soru8.layer.borderColor = UIColor(named: "wrongAnswer")?.cgColor
                
            }
            
        }
    
        
    }
    func soruSayacKontrol(){
        soruSayac += 1
        if soruSayac < 8 {
        
            soruYukle()
            if soruSayac == 1{
                self.soru2.backgroundColor = UIColor(named: "Color")
                self.soru2.textColor = UIColor.white
            }
            else if soruSayac == 2{
                self.soru3.backgroundColor = UIColor(named: "Color")
                self.soru3.textColor = UIColor.white
            }
            else if soruSayac == 3{
                self.soru4.backgroundColor = UIColor(named: "Color")
                self.soru4.textColor = UIColor.white
            }
            else if soruSayac == 4{
                self.soru5.backgroundColor = UIColor(named: "Color")
                self.soru5.textColor = UIColor.white
            }
            else if soruSayac == 5{
                self.soru6.backgroundColor = UIColor(named: "Color")
                self.soru6.textColor = UIColor.white
            }
            else if soruSayac == 6{
                self.soru7.backgroundColor = UIColor(named: "Color")
                self.soru7.textColor = UIColor.white
            }
            else if soruSayac == 7{
                self.soru8.backgroundColor = UIColor(named: "Color")
                self.soru8.textColor = UIColor.white
            }
            
        }else if soruSayac == 8 && seviye == 1 {
            seviye += 1
            soruSayac = 0
            print("SEVİYE: \(seviye) - buraya girdi")
            sorularListe.removeAll()
            sorularListe = SorularDao().rastgele8SoruGetir(seviye: 2)
            soruYukle()
            soruSayisiCerceve()
            //sureyiBaslat()
            navigationItem.title = "Seviye 2"
            
            UIView.animate(withDuration: 4) {
                self.navigationController?.navigationBar.barTintColor = UIColor(named: "Color")
                self.navigationController?.navigationBar.layoutIfNeeded()
                
                
            }
            UIView.animate(withDuration: 6) {
                self.navigationController?.navigationBar.barTintColor = UIColor.white
                self.navigationController?.navigationBar.layoutIfNeeded()
                
                
            }
            
        }else if soruSayac == 8 && seviye == 2{
            seviye += 1
            soruSayac = 0
            sorularListe.removeAll()
            sorularListe = SorularDao().rastgele8SoruGetir(seviye: 3)
            soruYukle()
            soruSayisiCerceve()
            navigationItem.title = "Seviye 3"
            UIView.animate(withDuration: 4) {
                self.navigationController?.navigationBar.barTintColor = UIColor(named: "Color")
                self.navigationController?.navigationBar.layoutIfNeeded()
            }
                UIView.animate(withDuration: 6) {
                self.navigationController?.navigationBar.barTintColor = UIColor.white
                self.navigationController?.navigationBar.layoutIfNeeded()
                
            }
        }else if soruSayac == 8 && seviye == 3{
            performSegue(withIdentifier: "sorularToSonuc", sender: nil)
        }
        else{
            //Hiçbir şey yapma
        }
    }
    
    func soruSayisiCerceve() {
        soru1.layer.cornerRadius = soru1.frame.height / 2
        soru1.clipsToBounds = true
        soru1.layer.borderWidth = 1
        soru1.layer.borderColor = UIColor(named: "Color")?.cgColor
        soru1.backgroundColor = UIColor(named: "Color")
        soru1.textColor = UIColor.white
        
        soru2.layer.cornerRadius = soru2.frame.height / 2
        soru2.clipsToBounds = true
        soru2.layer.borderWidth = 1
        soru2.layer.borderColor = UIColor(named: "Color")?.cgColor
        soru2.backgroundColor = UIColor(named: "background")
        soru2.textColor = UIColor(named: "Color")
        
        soru3.layer.cornerRadius = soru3.frame.height / 2
        soru3.clipsToBounds = true
        soru3.layer.borderWidth = 1
        soru3.layer.borderColor = UIColor(named: "Color")?.cgColor
        soru3.backgroundColor = UIColor(named: "background")
        soru3.textColor = UIColor(named: "Color")
        
        soru4.layer.cornerRadius = soru4.frame.height / 2
        soru4.clipsToBounds = true
        soru4.layer.borderWidth = 1
        soru4.layer.borderColor = UIColor(named: "Color")?.cgColor
        soru4.backgroundColor = UIColor(named: "background")
        soru4.textColor = UIColor(named: "Color")
        
        soru5.layer.cornerRadius = soru5.frame.height / 2
        soru5.clipsToBounds = true
        soru5.layer.borderWidth = 1
        soru5.layer.borderColor = UIColor(named: "Color")?.cgColor
        soru5.backgroundColor = UIColor(named: "background")
        soru5.textColor = UIColor(named: "Color")
        
        
        soru6.layer.cornerRadius = soru6.frame.height / 2
        soru6.clipsToBounds = true
        soru6.layer.borderWidth = 1
        soru6.layer.borderColor = UIColor(named: "Color")?.cgColor
        soru6.backgroundColor = UIColor(named: "background")
        soru6.textColor = UIColor(named: "Color")
        
        soru7.layer.cornerRadius = soru7.frame.height / 2
        soru7.clipsToBounds = true
        soru7.layer.borderWidth = 1
        soru7.layer.borderColor = UIColor(named: "Color")?.cgColor
        soru7.backgroundColor = UIColor(named: "background")
        soru7.textColor = UIColor(named: "Color")
        
        soru8.layer.cornerRadius = soru8.frame.height / 2
        soru8.clipsToBounds = true
        soru8.layer.borderWidth = 1
        soru8.layer.borderColor = UIColor(named: "Color")?.cgColor
        soru8.backgroundColor = UIColor(named: "background")
        soru8.textColor = UIColor(named: "Color")
        
        
    }
    
    func secenekCornerAyarla(){
        secenek1.layer.cornerRadius = 25.0
        secenek2.layer.cornerRadius = 25.0
        secenek3.layer.cornerRadius = 25.0
        secenek4.layer.cornerRadius = 25.0
    }
    func sureyiBaslat(){
     let soru = soruSayac
     
     progressView.backgroundColor = UIColor.green
     progressView.progress = 0.0
     progress.completedUnitCount = 0
     
     Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
         (timer) in
         
         guard self.progress.isFinished == false else {
             timer.invalidate()
             self.soruSayacKontrol()
             return
         }
     
        if soru == self.soruSayac{
             if self.progress.completedUnitCount > 35 {
             self.progress.completedUnitCount += 1
                 self.progressView.backgroundColor = UIColor.red
             self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
             
             }else{
                 self.progress.completedUnitCount += 1
                 self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
             }
        }
         else{
         timer.invalidate()
         print("Süre bitti 2 nin içindeyiz")
         
     }
 }
     print("SAYAÇ : \(soru) - SORU SAYAÇ : \(soruSayac)")
}

    @IBAction func secenek1Action(_ sender: Any) {
        dogruKontrol(button: secenek1)
        soruSayacKontrol()
    }
    @IBAction func secenek2Action(_ sender: Any) {
        dogruKontrol(button: secenek2)
        soruSayacKontrol()    }
    @IBAction func secenek3Action(_ sender: Any) {
        dogruKontrol(button: secenek3)
        soruSayacKontrol()    }
    @IBAction func secenek4Action(_ sender: Any) {
        dogruKontrol(button: secenek4)
        soruSayacKontrol()    }
}

