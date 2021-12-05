//
//  ViewController.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/29.
//

import UIKit
import Vision
import SimpleControls

class ViewController: UIViewController, UIPickerViewDelegate, HorizontalChooseProtocol {
    @IBOutlet weak var listPicker: HorizontalChooseView!
    @IBOutlet weak var languagesView: sc_LanguageListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listPicker.textColor = .black
        listPicker.backgroundColor = .clear
        listPicker.pickerDelegate = self
        listPicker.components = dataList
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let supportedList = try? VNRecognizeTextRequest.supportedRecognitionLanguages(for: .accurate, revision: VNTrackObjectRequestRevision2)
        languagesView.dataList = supportedList ?? []
        languagesView.setSelectedLanguage(text: supportedList?.last ?? "")
        
    }
    
    var dataList: [String] = ["aaaaaaa", "bbbbbbb", "cccccccccccccc", "ddddddd", "eeeeeee", "ff", "hh"]

    func pickerView(_ pickerView: HorizontalChooseView, didSelectRow row: Int, inComponent component: Int) {
        Swift.debugPrint("picker view selected row: \(row), data: \(dataList[row])")
    }
    

}
