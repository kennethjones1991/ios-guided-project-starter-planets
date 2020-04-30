//
//  SettingsViewController.swift
//  Planets
//
//  Created by Kenneth Jones on 4/29/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

protocol SettingsDelegate: class {
    func didTogglePluto()
}

class SettingsViewController: UIViewController {
    
    weak var delegate: SettingsDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var plutoSwitch: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateViews()
    }
    
    @IBAction func toggledPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        
        // Faster way if you don't ever need to use the constant value again
//        UserDefaults.standard.set(sender.isOn, forKey: .shouldShowPlutoKey)
        
        delegate?.didTogglePluto()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func updateViews() {
        // Get a default
        let userDefaults = UserDefaults.standard
        plutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
}
