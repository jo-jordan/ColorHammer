//
//  SettingsController.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/30.
//

import UIKit

class SettingsController:BaseViewController {
    
    // MARK: - Views
    
    lazy var settingsView: SettingsView = {
        let v = SettingsView()
        return v
    }()
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.setupStyle()
        self.setupViewHierachy()
        self.handleSettingsViewCellTapped()
    }
    
    // MARK: - Custom Methods
    
    private func setupView() {
        self.view.addSubview(self.settingsView)
    }
    
    private func setupViewHierachy() {
        self.settingsView.snp.makeConstraints { (make) in
            make.bottom.left.right.top.equalToSuperview()
        }
    }
    
    private func setupStyle() {
        guard let navController = self.navigationController else { return }
        navController.navigationBar.isTranslucent = true
        
        let leftButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftButtonAction))
        let rightButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightButtonAction))
        
        navController.navigationBar.topItem?.setLeftBarButton(leftButtonItem, animated: true)
        navController.navigationBar.topItem?.setRightBarButton(rightButtonItem, animated: true)
    }
    
    // MARK: - Event Handle Methods
    
    @objc private func rightButtonAction() {
        self.dismiss(animated: true, completion: {})
    }
    
    @objc private func leftButtonAction() {
        self.dismiss(animated: true, completion: {})
    }
    
    private func handleSettingsViewCellTapped() {
        self.settingsView.onCellTapped = { model in
            self.navigationController?.pushViewController(FontSelectorController(), animated: true)
//            self.present(UINavigationController(rootViewController: FontSelectorController()), animated: true, completion: {})
        }
    }
    
    
}
