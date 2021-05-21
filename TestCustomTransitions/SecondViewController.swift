//
//  SecondViewController.swift
//  TestCustomTransitions
//
//  Created by Игорь on 20.05.2021.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK: Lifecycle diagnostic
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        print("SecondVC.viewDidLoad()")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondVC.viewWillAppear()")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondVC.viewDidAppear()")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondVC.viewWillDisappear()")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondVC.viewDidDisappear()")
    }

    deinit {
        print("SecondVC.deinit()")
    }
}
