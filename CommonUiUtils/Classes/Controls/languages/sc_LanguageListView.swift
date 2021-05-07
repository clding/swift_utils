//
//  sc_LanguageListView.swift
//  CommonUiUtils
//
//  Created by clding on 2021/5/7.
//

import UIKit

public class sc_LanguageListView: BaseCustomView {
    @IBOutlet private weak var listTableView: UITableView!
    private var didInit = false
    
    fileprivate let identifier = "LangCell"
    private var displayData: [(code: String, language: String, localized: String?)] = []
    
    public var localizeLocal: Locale = Locale.current {
        didSet {
            if !dataList.isEmpty {
                rebuildDisplayData()
            }
        }
    }
    
    public var dataList: [String] = [] {
        didSet {
            rebuildDisplayData()
        }
    }
    
    private func rebuildDisplayData() {
        displayData = dataList.compactMap({ (code) -> (code: String, language: String, localized: String?)? in
            let tmpLocal = Locale(identifier: code)
            if let oriText = tmpLocal.localizedString(forIdentifier: code) {
                let localizedText = (localizeLocal.languageCode != tmpLocal.languageCode) ? localizeLocal.localizedString(forIdentifier: code) : nil
                return (code, oriText, localizedText)
            }
            return nil
        })
        listTableView.reloadData()
    }
    
    public override func baseInit() {
        super.baseInit()
        
        let bundle = Bundle(for: sc_LanguageTableViewCell.self)
        let nib = UINib(nibName: "sc_LanguageTableViewCell", bundle: bundle)

        listTableView.register(nib, forCellReuseIdentifier: identifier)
        didInit = true
    }
    
    public func setSelectedLanguage(text: String) {
        if let index = displayData.firstIndex(where: { $0.code == text }) {
            listTableView.selectRow(at: IndexPath(row: index, section: 0), animated: false, scrollPosition: .middle)
        }
    }
    
    public var selectedLanguage: String? {
        get {
            if let selectedRow = listTableView.indexPathForSelectedRow?.row {
                return displayData[selectedRow].code
            }
            return nil
        }
    }
}

extension sc_LanguageListView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let langCell = cell as? sc_LanguageTableViewCell {
            let cellData = displayData[indexPath.row]
            langCell.loadNames(oriText: cellData.language, localizedText: cellData.localized)
        }
        return cell
    }
    
    
}
