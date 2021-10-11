//
//  LocalAccessbility - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    let touchMe = "Touch Me!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomLabel()
        addButton()
        
        localizeDate()
        localizeCurrency()
    }
    
    func localizeCurrency() {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = .current
        numberFormatter.numberStyle = .currency
        
        
        currencyLabel.text = numberFormatter.string(from: 3000.34)
//        numberFormatter.currencyCode = .
//        NumberFormatter.localizedString(from: 3000.34 as NSNumber, number: .currency)
    }
    
    func localizeDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        let date = Date()
        dateTimeLabel.text = dateFormatter.string(from: date)
    }
    
    private func addBottomLabel() {
        
        let bottomLabel = UILabel()
        bottomLabel.frame = CGRect(x: 20, y: view.bounds.size.height - 150, width: view.bounds.size.width - 40, height: 50)
        
        bottomLabel.text = "Touch the button below!".localized()
        
        bottomLabel.font = UIFont.systemFont(ofSize: 20)
        
        bottomLabel.textColor = .red
        
        bottomLabel.textAlignment = .center
        
        view.addSubview(bottomLabel)
        
    }
    
    private func addButton() {
        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: view.bounds.size.height - 80, width: view.bounds.size.width - 40, height: 50)
        
        button.setTitle("Touch Me!".localized(), for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        button.setTitleColor(.blue, for: .normal)
        
        view.addSubview(button)
    }
}

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Main") -> String {
        return NSLocalizedString(self, tableName: tableName, comment: "")
    }
}
