//
//  ViewController.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/29.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, HorizontalChooseProtocol {
    @IBOutlet weak var listPicker: HorizontalChooseView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listPicker.textColor = .black
        listPicker.backgroundColor = .clear
        listPicker.pickerDelegate = self
        listPicker.components = dataList
    }
    
    var dataList: [String] = ["aaaaaaa", "bbbbbbb", "ccccccc", "ddddddd", "eeeeeee", "ff", "hh"]

    func pickerView(_ pickerView: HorizontalChooseView, didSelectRow row: Int, inComponent component: Int) {
        Swift.debugPrint("picker view selected row: \(row), data: \(dataList[row])")
    }
    

}
