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
    }
}

extension ColorViewController: SettingsViewControllerDelegate {
    func setNewColors(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
}
