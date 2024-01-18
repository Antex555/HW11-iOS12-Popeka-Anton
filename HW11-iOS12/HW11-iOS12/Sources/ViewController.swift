//
//  ViewController.swift
//  HW11-iOS12
//
//  Created by Anton Popeka on 17/01/24.
//

import UIKit

class MyView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constants {
        
    }
    
    // MARK: - UI
    
    
    
    // MARK: - Inits
    
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let myView = MyView()
        view = myView
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    deinit {
        
    }

    // MARK: - Setups
    
    private func setupView() {
        
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
    
    
    // MARK: - Actions
    
    

}

