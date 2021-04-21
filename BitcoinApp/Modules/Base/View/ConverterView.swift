//
//  ConverterView.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 21.04.2021.
//

import UIKit

class ConverterView: UIView {

    //  MARK: - Properties
    var typeArray = Currency.types
    var type: Type = .dollor
    var bitcoinPrice: Float = 0.0
        
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self; picker.dataSource = self;
        return picker
    }()
    lazy var inputTextField: DefaultTextField = {
        let field = DefaultTextField(); field.placeholder = "Введите сумму"; field.delegate = self
        return field
    }()
    lazy var outputTextField: DefaultTextField = {
        let field = DefaultTextField(); field.isUserInteractionEnabled = false; field.text = DefaultTitle.notEnough
        return field
    }()
    lazy var typeTextField: DefaultTextField = {
        let field = DefaultTextField()
        field.inputView = pickerView; field.text = Currency.types[0];
        let image = UIImageView(frame: CGRect(x: -8.0, y: 0.0, width: 15, height: 15)); image.image = #imageLiteral(resourceName: "down-arrow-2");
        field.rightView = image; field.rightViewMode = .always;
        return field
    }()
    
    
    //  MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        layer.cornerRadius = 6
        
        addSubviews([inputTextField, outputTextField,typeTextField])
        
        inputTextField.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(15)
            make.width.equalToSuperview().multipliedBy(0.38)
            make.height.equalTo(40)
        }
        outputTextField.snp.makeConstraints { (make) in
            make.top.equalTo(inputTextField.snp.bottom).offset(5)
            make.left.equalTo(inputTextField.snp.left)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(inputTextField.snp.height)
            make.bottom.equalToSuperview().offset(-15)
        }
        typeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(inputTextField.snp.top)
            make.left.equalTo(inputTextField.snp.right).offset(10)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Simple functions
    func calculate(text: String) {
        if text != "" {
            if type == .dollor {
                let ans = Float(text)! / bitcoinPrice
                ans >= 1 ? (outputTextField.text = "\(Int(ans)) шт") : (outputTextField.text = DefaultTitle.notEnough)
            }
            if type == .tenge {
                let ans = Float(text)! / 430 / bitcoinPrice
                ans >= 1 ? (outputTextField.text = "\(Int(ans)) шт") : (outputTextField.text = DefaultTitle.notEnough)
            }
            if type == .euro {
                let ans = Float(text)! * 1.2 / bitcoinPrice
                ans >= 1 ? (outputTextField.text = "\(Int(ans)) шт") : (outputTextField.text = DefaultTitle.notEnough)
            }
        }
    }
}


//  MARK: - UIPickerVoiew Protocols
extension ConverterView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {return 1}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeTextField.text = typeArray[row]
        if row == 0 {type = .dollor}; if row == 1 {type = .tenge}; if row == 2 {type = .euro}
        calculate(text: inputTextField.text ?? "")
    }
}


// MARK: - UITextfield Protocols
extension ConverterView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        DispatchQueue.main.asyncDeduped(target: self, after: 1) { [weak self] in
            self!.calculate(text: textField.text ?? "")
        }
        return true
    }
}
