// 

import UIKit
import AVFoundation
import Foundation


class ViewController: UIViewController {
    
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var textOutput: UITextView!
    @IBOutlet weak var textToSpeech: UIButton!
    @IBOutlet weak var ttsRate: UISlider!
    
    
    let korean = koreanCharacter()
    let ttsSetting = setting()
   
    let exceptions:Dictionary = [
        "등용문" : "등용문",
        "눈인사" : "누닌사",
        "몰인정" : "모린정",
        "역이용" : "여기용",
        "망망" : "미미"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - 예외발음 목록(ㄴ첨가)
    
   
    
    
    
    var replacedString = ""
    func replace(string: String) {
        replacedString = string
        for (key, value) in exceptions {
            
            replacedString = replacedString.replacingOccurrences(of: key, with: value)
        }
      
        print(replacedString)
        
    }
        
    
    
    
    
    
    @IBAction func convertButtonClicked(_ sender: UIButton) {
        //이전 글자 지우기
        textOutput.text = ""
        
        korean.syllableArr = []
        korean.characterToIntArr = []
        korean.resultString = ""
        korean.romanizedString = ""
        
        korean.nieunArr = []
        korean.nieunCurrentIndex = 0
        
        korean.gugeArr = []
        korean.gugeCurrentIndex = 0
        
        korean.jaeumChukyakArr = []
        korean.jaeumChukyakIndex = 0
        
        korean.jaeumDonghwaArr = []
        korean.jaeumDonghwaIndex = 0
        
        korean.gyeongeumhwaArr = []
        korean.gyeongeumhwaIndex = 0
        
        korean.maleumRuleArr = []
        korean.maleumRuleIndex = 0
        
        korean.yeuneumRullArr = []
        korean.yeuneumRuleIndex = 0
        
        korean.romanizedString = ""
        
       
        print(korean.firstCharacterToIntArr)
        
        //문자 입력
        replace(string: textInput.text!)
        
        print("문자입력1")
        print(replacedString)
        
        //입력된 문자를 한음절씩 분리해서 배열을 만든다, syllabeArr 에 값이 저장된다  ex) [[], [], []]
        korean.convertToSyllabes(inputText: replacedString)
        print("글자배열2")
        
        //문자형태의 음절을 분리해서 초성,중성,종성 인덱스로 표시한다. characterToIntArr에 저장
        korean.seperateSyllables(inputSyllable: korean.syllableArr)
        print("숫자분리배열3")
        
        //각각의 발음 규칙 적용//
        
        //ㄴ 첨가
        korean.nieunPlus(numberArr: korean.characterToIntArr)
        print("ㄴ첨가4-1")
        // ㄴ첨가 취소해야 하나?  물이
        
        
        //구개음화 적용 nieunArr 사용
        korean.guge(numberArr: korean.nieunArr)
        print("구개음화4-2")
        
        //끝소리법칙 gugeArr 사용
        korean.maleumRule(numberArr: korean.gugeArr)
        print("끝소리법칙5")
        
        //자음축약 maleumRuleArr 사용
        korean.jaeumChukyak(numberArr: korean.maleumRuleArr)
        print("자음축약6")
        
        //연음규칙
        korean.yeuneumRule(numberArr: korean.jaeumChukyakArr)
        print("연음7")
        
        //자음동화 yeuneumRullArr 사용
        korean.jaeumDonghwa(numberArr: korean.yeuneumRullArr)
        print("자음동화8")
        
        //경음화 jaeumDonghwaArr 사용
        korean.gyeongeumhwa(numberArr: korean.jaeumDonghwaArr)
        print("경음화9")
        
        
        
        //숫자형태의 배열을 확인용으로 문자로 변환 resultString에 저장
        korean.numberToString(numberArr: korean.gyeongeumhwaArr)
        print("문자로다시변환")
        
        
        //숫자형태의 로마자를 문자형태로 변환 romanizedNumberArr 사용
        korean.romanizer(input: korean.gyeongeumhwaArr)
        
        //텍스트 필드에 결과 표시
        textOutput.text = " \(korean.resultString)  \(korean.gyeongeumhwaArr).... \(korean.romanizedString)"
        print("화면표시")
        
        
        print(korean.firstCharacterToIntArr)
        
    }
    
  
    
    @IBAction func textToSpeechClicked(_ sender: UIButton) {
        
      let koreanString = textInput.text ?? "text"
        ttsSetting.speak(text: koreanString)
        
    }
    
    

    
    //세팅창으로 이동
    @IBAction func settingBtnClicked(_ sender: UIButton) {
        //원하는 뷰컨트롤러(세팅)찾기
        if let settingController = self.storyboard?.instantiateViewController(identifier: "setting") {
        //찾은 컨트롤러를 push
            self.navigationController?.pushViewController(settingController, animated: true)
        }
    }
    
   
}
