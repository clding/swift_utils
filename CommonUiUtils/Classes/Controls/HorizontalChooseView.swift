//
//  HorizontalChooseView.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/30.
//

import UIKit

public protocol HorizontalChooseProtocol: NSObjectProtocol {
    func pickerView(_ pickerView: HorizontalChooseView, didSelectRow row: Int, inComponent component: Int)
    
}

public class HorizontalChooseView: BaseCustomView {
    @IBOutlet weak var listPicker: UIPickerView!
    public weak var pickerDelegate: HorizontalChooseProtocol?
    
    private let rotationAngle: CGFloat = -90  * (.pi/180)
    private var selectedBgColor: UIColor = .clear
    private var didSetSelectedBgColor = false

    public var components: [String] = [] {
        didSet {
            resetComponentSize()
            reloadAll()
        }
    }
    
    public var componentSize: CGSize = CGSize(width: 100, height: 25) {
        didSet {
            resetComponentSize()
            reloadAll()
        }
    }
    
    private var innerComponentSize = CGSize(width: 100, height: 25)
    
    public var textColor: UIColor = .white
    public var textFont: UIFont = UIFont.systemFont(ofSize: 15, weight: .semibold)

    override public func baseInit() {
        super.baseInit()
        
        listPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)        
    }
    
    public func selectRow(_ row: Int, animated: Bool) {
        listPicker.selectRow(row, inComponent: 0, animated: animated)
    }
    
    public func selectedRow() -> Int {
        return listPicker.selectedRow(inComponent: 0)
    }
    
    //MARK: - private func
    private func reloadAll() {
        if let picker = listPicker {
            picker.reloadAllComponents()
            clearSelectedBg()
        }
    }
    
    private func resetComponentSize() {
        var maxVal: CGFloat = componentSize.width
        for str in components {
            let arrStr = NSAttributedString(string: str, attributes: [NSAttributedString.Key.font: textFont, NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.backgroundColor: UIColor.clear])
            let currWidth = arrStr.size().width
            maxVal = max(maxVal, (currWidth + 6))
        }
        innerComponentSize = CGSize(width: ceil(maxVal), height: componentSize.height)
    }
}

//MARK: - UIPickerView.DataSource/Delegate
extension HorizontalChooseView: UIPickerViewDataSource, UIPickerViewDelegate {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return components.count
    }
    
    //Here we need to display a label , you can add any custom UI here.
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //????????????????????? ??????
        let arrStr = NSAttributedString(string: components[row], attributes: [NSAttributedString.Key.font: textFont, NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.backgroundColor: UIColor.clear])
  
        let modeLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: innerComponentSize.width, height: innerComponentSize.height)))
        modeLabel.textAlignment = .center

        modeLabel.attributedText = arrStr
        
        modeLabel.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        
        clearSelectedBg()

        return modeLabel
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return innerComponentSize.width
    }
    
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return innerComponentSize.height
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //debugPrint("selected: \(row)")
        //clearSelectedBg()
        pickerDelegate?.pickerView(self, didSelectRow: row, inComponent: component)
    }
    
    private func clearSelectedBg() {
        if didSetSelectedBgColor == false {
            for subView in listPicker.subviews {
                if subView.subviews.count != 0 {
                    let contentViews = subView.subviews[0]
                    for rowView in contentViews.subviews {
                        if rowView.center.y == contentViews.center.y {
                            //??????view
                            rowView.backgroundColor = selectedBgColor
                            didSetSelectedBgColor = true
                            break
                        }
                    }
                } else if subView.bounds.size.height  > innerComponentSize.width {
                    didSetSelectedBgColor = true
                    subView.backgroundColor = selectedBgColor
                }
            }
        }
    }
}
