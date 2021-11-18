//
//  SignUpWithEmailTableViewCell.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2020/12/28.
//

import UIKit

protocol SignUpWithEmailTableViewCellProtocal {
    //
    func signUpwithEmailVerifyFormat(textField: String)
    func passwordVerify(textField: String)
}

class SignUpWithEmailTableViewCell: UITableViewCell, UITextFieldDelegate {


    @IBOutlet var tableViewLabel: UILabel!
    @IBOutlet var tableViewTextField: UITextField!
    @IBOutlet var showButton: UIButton!
    
    var delegate: SignUpWithEmailTableViewCellProtocal?
    var isEmail = true
    let signUpwithEmail = ["Email Address","PassWord"]
    var clickButton: Bool = true
    var messageLabelShowtext: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableViewTextField.delegate = self
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //select tableview row
    
    func populate(signUpwithEmailTitleName: String, isSelect: Bool ) {      //isError: Bool
        tableViewLabel.text = signUpwithEmailTitleName
        if isSelect {
            tableViewTextField.isHidden = false
            tableViewLabel.attributedText = NSAttributedString(string: signUpwithEmailTitleName, attributes: [NSAttributedString.Key.font : UIFont(name: "Nexa-XBold", size: 12)!])
        }
        isEmail = signUpwithEmailTitleName == "Email Address"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if isEmail {
            tableViewLabel.textColor = UIColor(named: "SignUpWithEmailYellow")
            messageLabelShowtext = "You will need to verify this email address shortly"
            showButton.isHidden = true
        } else {
            tableViewLabel.textColor = UIColor(named: "SignUpWithEmailYellow")
            messageLabelShowtext = "Password at least 8 characters \n At least 1 number \n At least 1 letter"
            showButton.isHidden = false
            tableViewTextField.isSecureTextEntry = true
        }
        tableViewLabel.textColor = .white
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if isEmail {
            delegate?.signUpwithEmailVerifyFormat(textField: tableViewTextField.text ?? "")
        } else {
            delegate?.passwordVerify(textField: tableViewTextField.text ?? "")
        }
        
    }

    @IBAction func showButtonClick(_ sender: Any) {
        if clickButton == true{
            showButton.setTitle("Hide", for: .normal)
            tableViewTextField.isSecureTextEntry = false

        }else{
            showButton.setTitle("Show", for: .normal)
            tableViewTextField.isSecureTextEntry = true
        }
        clickButton = !clickButton
    }
    
}
