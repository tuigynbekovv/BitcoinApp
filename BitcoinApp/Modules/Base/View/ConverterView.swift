//
//  ConverterView.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 21.04.2021.
//

import UIKit

class ConverterView: UIView {

    var typeArray = ["Доллор США", "Каз ТЕНГЕ", "ЕВРО"]
        
        
    //  MARK: - Properties
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self; picker.dataSource = self;
        return picker
    }()
    
    lazy var inputTextField: DefaultTextField = {
        let field = DefaultTextField(); field.text = "1";
        return field
    }()
    lazy var outputTextField = DefaultTextField()
    lazy var typeTextField: DefaultTextField = {
        let field = DefaultTextField()
        field.inputView = pickerView; field.text = "Доллор США";
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15)); image.image = #imageLiteral(resourceName: "down-arrow");
        field.rightView = image; field.rightViewMode = .always;
        return field
    }()
    
    
    //  MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        
        addSubviews([inputTextField, outputTextField,typeTextField])
        
        inputTextField.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(15)
            make.width.equalToSuperview().multipliedBy(0.33)
            make.height.equalTo(40)
        }
        outputTextField.snp.makeConstraints { (make) in
            make.top.equalTo(inputTextField.snp.bottom).offset(5)
            make.left.equalTo(inputTextField.snp.left)
            make.width.equalTo(inputTextField.snp.width)
            make.height.equalTo(inputTextField.snp.height)
            make.bottom.equalToSuperview().offset(-15)
        }
        typeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(inputTextField.snp.top)
            make.left.equalTo(inputTextField.snp.right).offset(10)
            make.width.equalToSuperview().multipliedBy(0.45)
            make.height.equalTo(40)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }
}
