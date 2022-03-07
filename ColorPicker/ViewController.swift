
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redTitleLabel: UILabel!
    @IBOutlet var greenTitleLabel: UILabel!
    @IBOutlet var blueTitleLabel: UILabel!
    
    @IBOutlet var redSliderValueLabel: UILabel!
    @IBOutlet var greenSliderValueLabel: UILabel!
    @IBOutlet var blueSliderValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        redSliderValueLabel.text = String(redSlider.value)
        greenSliderValueLabel.text = String(greenSlider.value)
        blueSliderValueLabel.text = String(blueSlider.value)
        
        redSliderValueLabel.textColor = .white
        greenSliderValueLabel.textColor = .white
        blueSliderValueLabel.textColor = .white
        
        redTitleLabel.textColor = .white
        greenTitleLabel.textColor = .white
        blueTitleLabel.textColor = .white
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    @IBAction func redSliderAction() {
        redSliderValueLabel.text = String(format: "%.2f", redSlider.value)
        changeBackgroundColor()
    }
    
    @IBAction func greenSliderAction() {
        greenSliderValueLabel.text = String(format: "%.2f", greenSlider.value)
        changeBackgroundColor()
    }
    
    @IBAction func blueSliderAction() {
        blueSliderValueLabel.text = String(format: "%.2f",blueSlider.value)
        changeBackgroundColor()
    }
    
    func changeBackgroundColor() {
        
        colorView.backgroundColor = .init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

