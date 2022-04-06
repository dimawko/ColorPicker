//
//  ColorViewController.swift
//  ColorPicker
//
//  Created by Dinmukhammed Sagyntkan on 06.04.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.viewColor = view.backgroundColor
    }
}

extension ColorViewController: SettingsViewControllerDelegate {
    func setNewColors(_ color: UIColor) {
        view.backgroundColor = color
    }
}
