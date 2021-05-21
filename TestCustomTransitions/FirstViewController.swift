//
//  FirstViewController.swift
//  TestCustomTransitions
//
//  Created by Игорь on 20.05.2021.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: Lifecycle diagnostic
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        print("FirstVC.viewDidLoad()")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let button = UIButton(
            frame: CGRect(x: view.center.x, y: view.center.y, width: 100, height: 50)
        )
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
        view.addSubview(button)
        print("FirstVC.viewWillAppear()")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FirstVC.viewDidAppear()")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("FirstVC.viewWillDisappear()")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("FirstVC.viewDidDisappear()")
    }

    deinit {
        print("FirstVC.deinit()")
    }

    @objc private func tapDismissButton() {
        dismiss(animated: true, completion: nil)
    }
}
