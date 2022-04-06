

import UIKit

extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil) {
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
            )
        
        let doneButton =  UIBarButtonItem(
            title: "Done",
            style: .done,
            target: onDone.target,
            action: onDone.action
        )
        
        toolbar.items = [flexibleSpace, doneButton]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        self.endEditing(true)
    }
}
