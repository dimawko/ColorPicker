
import UIKit

//MARK: - Protocols
protocol SettingsViewControllerDelegate {
    func setNewColors(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueTextField: UITextField! {
        didSet {
            redValueTextField.addDoneCancelToolbar()
        }
    }
    
    @IBOutlet var greenValueTextField: UITextField! {
        didSet {
            greenValueTextField.addDoneCancelToolbar()
        }
    }
    
    @IBOutlet var blueValueTextField: UITextField! {
        didSet {
            blueValueTextField.addDoneCancelToolbar()
        }
    }
    
    //MARK: - Public Properties
    var delegate: SettingsViewControllerDelegate!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redValueTextField.delegate = self
        greenValueTextField.delegate = self
        blueValueTextField.delegate = self
        
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        
        setColor()
        setValueLabel(for: redLabel, greenLabel, blueLabel)
    }
    
    //MARK: - IBActions
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColors(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value)
        )
        
        dismiss(animated: true)
    }
}

//MARK: - Private Methods
extension SettingsViewController {
    private func setColor() {
        colorView.backgroundColor = .init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValueLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
}

//MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        
        if textField == redValueTextField {
            redSlider.setValue(numberValue, animated: true)
        } else if textField == greenValueTextField {
            greenSlider.setValue(numberValue, animated: true)
        } else {
            blueSlider.setValue(numberValue, animated: true)
        }
        
        setColor()
    }
}
