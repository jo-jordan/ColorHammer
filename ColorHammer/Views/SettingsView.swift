//
//  SettingsView.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/30.
//

import UIKit

class SettingsView: UIView {
    // MARK: - Static Variables
    
    static let id = "SettingsView"
    
    // MARK: - Variables
    
    /**
     The datasource of UITableView
     */
    var list:[SettingGroup] =
        [
            .init(items: [.init(name: "Change Theme", icon: "", desc: "Click to choose your theme", type: "")], title: "Normal"),
            .init(items: [.init(name: "Change Font", icon: "", desc: "Click to choose your font", type: "")], title: "Advanced"),
        ]
    
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
        
        self.setupView()
        self.setupHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Custom Methods
    
    private func setupView() {
        self.addSubview(self.tableView)
    }
    
    private func setupHierarchy() {
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Event Closure
    
    var onCellTapped = { (model: SettingItem) in}
}

// MARK: - Delegate of UITableView

extension SettingsView:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        list[section].title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsView.id)
        
        let group = list[indexPath.section]
        let model = group.items[indexPath.row]
        
        func setupCell(_ cell: UITableViewCell) {
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = model.name
            cell.detailTextLabel?.text = model.desc
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
        onCellTapped(self.list[indexPath.section].items[indexPath.row])
    }
    
    
}
