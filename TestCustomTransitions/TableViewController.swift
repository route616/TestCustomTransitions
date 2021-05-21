//
//  TableViewController.swift
//  TestCustomTransitions
//
//  Created by Игорь on 20.05.2021.
//

import UIKit

class TableViewController: UITableViewController {
    private let presentAnimator = AnimationController(animationType: .present)
    private let dismissAnimator = AnimationController(animationType: .dismiss)

    private let viewControllers: [(String, UIViewController)] = [
        ("FirstVC", FirstViewController()),
        ("SecondVC", SecondViewController()),
        ("ThirdVC", ThirdViewController())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool, completion: (() -> Void)? = nil
    ) {
        viewControllerToPresent.transitioningDelegate = self
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }

    override func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewControllers[indexPath.row].0
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerToPresent = viewControllers[indexPath.row].1
        viewControllerToPresent.modalPresentationStyle = .custom
        present(
            viewControllerToPresent, animated: true
        )
    }
}

extension TableViewController: UIViewControllerTransitioningDelegate {
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimator
    }

    func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimator
    }
}
