import UIKit

class ViewController: UIViewController {

    var curValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curValue = Int(slider.value.rounded())
        restart()
        
        let sliderImage = #imageLiteral(resourceName: "SliderThumb-Normal")
        let sliderHighliteImage = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        
        slider.setThumbImage(sliderImage, for: .normal)
        slider.setThumbImage(sliderHighliteImage, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let left = #imageLiteral(resourceName: "SliderTrackLeft")
        let right = #imageLiteral(resourceName: "SliderTrackRight")
        
        let leftResize = left.resizableImage(withCapInsets: insets)
        let rightResize = right.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(leftResize, for: .normal)
        slider.setMaximumTrackImage(rightResize, for: .normal)

    }

    @IBAction func hitButton() {
        
        let differnce = abs(curValue - targetValue)
        var points = differnce
        let title: String
        
        if differnce == 0 {
            title = "Perfect!!!"
            points += 50
        } else if differnce < 5 {
            title = "You almost had it!"
            if differnce == 1 {
                points += 25
            }
        } else if differnce < 10 {
            title = "Not bad."
        } else {
            title =  "Not even close..."
            points = 0
        }

        score += points
        
        let alert = UIAlertController(title: title, message: "Your points: \(points)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.newRound()
        })

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
}
    
    @IBAction func restart(){
        round = 0
        curValue = 50
        slider.value = Float(curValue)
        score = 0
        newRound()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleSlider(_ slider: UISlider) {
        curValue = Int(slider.value.rounded() )
    }
    
    func newRound() {
        targetValue = Int.random(in: 1...100)
        curValue = 50
        slider.value = Float(curValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

