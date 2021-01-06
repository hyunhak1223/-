import UIKit
import AVFoundation

class setting : UIViewController {
    
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if  let speed = UserDefaults.standard.float(forKey: "speedChaged") as? Float,
                      let pitch = UserDefaults.standard.float(forKey: "pitchChaged") as? Float,
                      let volume = UserDefaults.standard.float(forKey: "volumeChaged") as? Float {
              
              speedSlider.value = speed
              pitchSlider.value = pitch
          volumeSlider.value = volume
          
        }
    }
    
    
    @IBAction func speedSlider(_ sender: UISlider) {
        
        let currentValue = Float(sender.value)
        speedLabel.text = "Speed : \(String(format: "%.2f", currentValue))"
        
        self.speedSlider.minimumValue = AVSpeechUtteranceMinimumSpeechRate
        self.speedSlider.maximumValue = AVSpeechUtteranceMaximumSpeechRate
      
        //self.speed = sender.value
        
        UserDefaults.standard.set(sender.value, forKey: "speedChanged")
    }
    
    
    @IBAction func pitchSlider(_ sender: UISlider) {
        //self.pitch = sender.value
        
        let currentValue = Float(sender.value)
        pitchLabel.text = "Pitch : \(String(format: "%.2f", currentValue))"
        
        UserDefaults.standard.set(sender.value, forKey: "pitchChanged")
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        //self.volume = sender.value
        
        
        let currentValue = Float(sender.value)
        volumeLabel.text = "Volume : \(String(format: "%.2f", currentValue))"
        
        UserDefaults.standard.set(sender.value, forKey: "volumeChanged")

    }
    
    
    
    //슬라이더 값 출력
    func setState(){
       
       
      if  let speed = UserDefaults.standard.value(forKey: "speedChaged") as? Float,
                    let pitch = UserDefaults.standard.value(forKey: "pitchChaged") as? Float,
                    let volume = UserDefaults.standard.value(forKey: "volumeChaged") as? Float {
            
            speedSlider.value = speed
            pitchSlider.value = pitch
        volumeSlider.value = volume
        
      }
        
      }
    
    
//   var pitch: Float = 0.5
//    var speed: Float = 0.5
//    var volume: Float = 0.5
    

    
    
    
 
    

    
    
    
  
    
    
    func speak(text: String) {
        
        let speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
//        utterance.pitchMultiplier = self.pitch
//        utterance.rate = self.speed
//        utterance.volume = self.volume
        
        speechSynthesizer.speak(utterance)
        
        //speechSynthesizer.pauseSpeaking(at: .word)

    }
    
}
