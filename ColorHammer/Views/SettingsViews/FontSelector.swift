//
//  FontSelector.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/30.
//

import UIKit

class FontSelector: UIView {
    
    // MARK: - Static Variables
    
    static let id = "FontSelector"
    
    // MARK: - Variables
    
    /**
     The datasource of UITableView
     */
    var list:[Font] = []
    
    // MARK: - Subview Variables
    
    lazy var tableView: UITableView = {
        var style:UITableView.Style
        if #available(iOS 13.0, *) {
            style = .insetGrouped
        } else {
            style = .grouped
        }
        
        let v = UITableView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize.zero), style: style)
        v.delegate = self
        v.dataSource = self
        return v
    }()
    
    // MARK: - Initial Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.fetchFontList()
        self.setupView()
        self.setupHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Custom Methods
    
    private func fetchFontList() {
        for (_, name) in UIFont.familyNames.enumerated() {
            self.list.append(.init(name: name, choosed: false))
        }
    }
    
    private func setupView() {
        self.addSubview(self.tableView)
    }
    
    private func setupHierarchy() {
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Event Closure
    
    var onCellTapped = { (model: Font) in}
}

// MARK: - Delegate of UITableView

extension FontSelector:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsView.id)
        
        let model = list[indexPath.row]
        
        func setupCell(_ cell: UITableViewCell) {
            
            cell.accessoryView = UIView()
            cell.accessoryType = .checkmark
            cell.textLabel?.text = model.name
            cell.textLabel?.font = UIFont(name: model.name, size: 16)
        }
        
        if let cell:UITableViewCell = cell {
            setupCell(cell)
            return cell
        }
        
        let newCell = UITableViewCell(style: .value1, reuseIdentifier: SettingsView.id)
        setupCell(newCell)
        
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onCellTapped(self.list[indexPath.row])
    }
}
