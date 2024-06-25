//
//  SettingsViewController.swift
//  Trivia
//
//  Created by Michael on 24/06/2024.
//

import UIKit

protocol SettingsViewControllerDelegate: NSObject {
    func didChangeSettings(with settings: Settings)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var diffcultyButton: UIButton!
    @IBOutlet weak var categoryButton: UIButton!

    weak var delegate: SettingsViewControllerDelegate?
    var didChangeSettings = false

    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(didTapBackButton))

        addCategoryMenu()
        addDifficultyMenu()

    }

    private func addDifficultyMenu() {
        let currentDiffculty: Difficulty = SettingsManager.shared.settings.difficulty
        var diffcultyActions = [UIAction]()
        for diffculty in Difficulty.allCases {
            let action = UIAction(
                title: diffculty.rawValue,
                state: diffculty == currentDiffculty ? .on : .off,
                handler: { [unowned self] action in
                    self.didTabDiffculty(withDifficulty: action.title)
                })
            diffcultyActions.append(action)
        }
        diffcultyButton.menu = UIMenu(children: diffcultyActions)
        diffcultyButton.showsMenuAsPrimaryAction = true
        diffcultyButton.setTitle(currentDiffculty.rawValue, for: .normal)
    }

    private func addCategoryMenu() {
        let currentCategory: Category = SettingsManager.shared.settings.category
        var categoryActions = [UIAction]()
        for category in Category.allCases {
            let action = UIAction(
                title: category.rawValue,
                state: category == currentCategory ? .on : .off,
                handler: { [unowned self] action in
                    self.didTabCategory(withCategory: action.title)
                })
            categoryActions.append(action)
        }
        categoryButton.menu = UIMenu(children: categoryActions)
        categoryButton.showsMenuAsPrimaryAction = true
        categoryButton.setTitle(currentCategory.rawValue, for: .normal)
    }

    private func updateCategorySelection() {
        let currentCategory: Category = SettingsManager.shared.settings.category
        var updatedActions = [UIAction]()

        for category in Category.allCases {
            let action = UIAction(
                title: category.rawValue,
                state: category == currentCategory ? .on : .off,
                handler: { [unowned self] action in
                    self.didTabCategory(withCategory: category.rawValue)
                })
            updatedActions.append(action)
        }

        categoryButton.menu = UIMenu(children: updatedActions)
        categoryButton.setTitle(currentCategory.rawValue, for: .normal)
        categoryButton.titleLabel?.numberOfLines = 0
    }

    private func updateDiffcultySelection() {
        let currentDiffculty: Difficulty = SettingsManager.shared.settings.difficulty
        var updatedActions = [UIAction]()

        for diffculty in Difficulty.allCases {
            let action = UIAction(
                title: diffculty.rawValue,
                state: diffculty == currentDiffculty ? .on : .off,
                handler: { [unowned self] action in
                    self.didTabDiffculty(withDifficulty: diffculty.rawValue)
                })
            updatedActions.append(action)
        }

        diffcultyButton.menu = UIMenu(children: updatedActions)
        diffcultyButton.setTitle(currentDiffculty.rawValue, for: .normal)
    }

    @objc func didTabDiffculty(withDifficulty diffculty: String) {
        SettingsManager.shared.settings.difficulty = Difficulty(rawValue: diffculty)!
        updateDiffcultySelection()
        didChangeSettings = true
    }

    @objc func didTabCategory(withCategory category: String) {
        SettingsManager.shared.settings.category = Category(rawValue: category)!
        updateCategorySelection()
        didChangeSettings = true
    }

    @objc private func didTapBackButton() {
        if didChangeSettings {
            delegate?.didChangeSettings(with: SettingsManager.shared.settings)
        }
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
