//
//  BaseCustomView.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/30.
//

import UIKit
import SnapKit

public class BaseCustomView: UIView {
    var __Cust_Container_View: UIView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.baseInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.baseInit()
    }

    public func baseInit() {
        self.__Cust_Container_View = self.loadXib()
        self.addSubview(self.__Cust_Container_View)
        self.__Cust_Container_View.translatesAutoresizingMaskIntoConstraints = false
        self.__Cust_Container_View.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
    
    private func loadXib() -> UIView {
        let className = type(of: self)
        let bundle = Bundle(for: className)
        let name = NSStringFromClass(className).components(separatedBy: ".").last
        let nib = UINib(nibName: name!, bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            return view
        }
        return UIView(frame: .zero)
    }

}
