//
//  MainController.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/29.
//

import UIKit
import SnapKit
import PKHUD

class MainController: BaseViewController {
    
    // MARK: - Views
    lazy var mainView: MainView = {
        let v = MainView()
        
        return v
    }()
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.setupStyle()
        self.setupViewHierachy()
        self.eventHandler()
        
        HUD.flash(.labeledSuccess(title: "Done", subtitle: "Successfull"), delay: 2.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: - Custom Methods
    
    private func setupView() {
        self.view.addSubview(self.mainView)
    }
    
    private func setupViewHierachy() {
        self.mainView.snp.makeConstraints { (make) in
            make.bottom.left.right.top.equalToSuperview()
        }
    }
    
    private func setupStyle() {
        self.title = "Choose One"
        
        guard let navController = self.navigationController else { return }
        
        navController.navigationBar.isTranslucent = true
        
        let rightButtonItem = UIBarButtonItem(
            title: "Settings",
            style: .plain,
            target: self,
            action: #selector(rightButtonAction)
        )
        
        navController.navigationBar.topItem?.setRightBarButton(rightButtonItem, animated: true)
    }
    
    // MARK: - Event Handle Methods
    
    @objc private func rightButtonAction() {
        let vc = SettingsController()
        
        if #available(iOS 13.0, *) {
            vc.modalPresentationStyle = .automatic
        } else {
            // Fallback on earlier versions
        }
        
        self.present(UINavigationController(rootViewController: vc), animated: true, completion: {})
    }
    
    private func eventHandler() {
        
        /**
         Handler of collection cell tapped event
         */
        self.mainView.onCellTapped = { model in
            self.navigationController?.pushViewController(DataConverterController(), animated: true)
        }
    }
}
