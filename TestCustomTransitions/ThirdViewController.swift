//
//  ThirdViewController.swift
//  TestCustomTransitions
//
//  Created by Игорь on 20.05.2021.
//

import UIKit

class ThirdViewController: UIViewController {
    // MARK: Lifecycle diagnostic
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        print("ThirdVC.viewDidLoad()")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ThirdVC.viewWillAppear()")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ThirdVC.viewDidAppear()")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ThirdVC.viewWillDisappear()")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ThirdVC.viewDidDisappear()")
    }

    deinit {
        print("ThirdVC.deinit()")
    }
}
