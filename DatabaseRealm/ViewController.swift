//
//  ViewController.swift
//  DatabaseRealm
//
//  Created by SeinaKonishi on 2022/02/14.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITextFieldDelegate {
    
    let realm = try! Realm()
    
    @IBOutlet var titleTextFireld: UITextField!
    @IBOutlet var contentTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleTextFireld.delegate = self
        contentTextField.delegate = self
        
        let memo: Memo? = read()
        
        if let memo = memo{
            titleTextFireld.text = memo.title
            contentTextField.text = memo.content
        }
    }
    
    func read() -> Memo?{
        return realm.objects(Memo.self).first
    }
    
    @IBAction func save(){
        let title: String = titleTextFireld.text!
        let content: String = contentTextField.text!
        
        let memo: Memo? = read()
        
        if memo != nil{
            try! realm.write{
                memo!.title = title
                memo!.content = content
            }
            }else{
                let newMemo = Memo()
                newMemo.title = title
                newMemo.content = content
                
                try! realm.write{
                    realm.add(newMemo)
            }
        }
        
        let alert: UIAlertController = UIAlertController(title: "成功", message:"保存しました",preferredStyle:.alert)
        alert.addAction(UIAlertAction(title:"OK",style: .default,handler: nil))
        present(alert,animated: true,completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

}

