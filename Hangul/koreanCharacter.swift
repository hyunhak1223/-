// 

import Foundation


class koreanCharacter {
    
    let jamo = [
        //단모음 monophthongs
        "ㅏ" : "a",
        "ㅓ" : "eo",
        "ㅗ" : "o",
        "ㅜ" : "u",
        "ㅡ" : "eu",
        "ㅣ" : "i",
        "ㅐ" : "ae",
        "ㅔ" : "e",
        "ㅚ" : "oe",
        "ㅟ" : "wi",
        
        // 이중모음 diphthongs
        "ㅑ" : "ya",
        "ㅕ" : "yeo",
        "ㅛ" : "yo",
        "ㅠ" : "yu",
        "ㅒ" : "yae",
        "ㅖ" : "ye",
        "ㅘ" : "wa",
        "ㅙ" : "wae",
        "ㅝ" : "wo",
        "ㅞ" : "we",
        "ㅢ" : "ui", // [붙임 1] ‘ㅢ’는 ‘ㅣ’로 소리 나더라도 ‘ui’로 적는다.
    
        //파열음 stops/plosives
        "ㄱ" : "g",
        "ㄲ" : "kk",
        "ㅋ" : "k",
        "ㄷ" : "d",
        "ㄸ" : "tt",
        "ㅌ" : "t",
        "ㅂ" : "b",
        "ㅃ" : "pp",
        "ㅍ" : "p",
        // 파찰음 affricates
        "ㅈ" : "j",
        "ㅉ" : "jj",
        "ㅊ" : "ch",
        // 마찰음 fricatives
        "ㅅ" : "s",
        "ㅆ" : "ss",
        "ㅎ" : "h",
        // 비음 nasals
        "ㄴ" : "n",
        "ㅁ" : "m",
        // 유음 liquids
        "ㄹ" : "r",
        // Null sound
        "ㅇ" : ""
    ]
    
    //중성
    let middle :[UInt32 : String] = [
        
        0 : "a", //ㅏ-0
        4 : "eo", //ㅓ-4
        8 : "o", //ㅗ-8
        13 : "u", // ㅜ-13
        18 : "eu", //ㅡ-18
        20 : "i", //ㅣ-20
        1 : "ae", //ㅐ-1
        5 : "e", //ㅔ-5
        11 : "oe", //ㅚ-11
        16 : "wi", //ㅟ-16
        
        // 이중모음 diphthongs
        2 : "ya", //-2
        6 : "yeo", //ㅕ-6
        12 : "yo", //ㅛ-12
        17 : "yu", //ㅠ-17
        3 : "yae", //ㅒ-3
        7 : "ye", //ㅖ-7
        9 : "wa", //ㅘ-9
        10 : "wae", //ㅙ-10
        14 : "wo", //ㅝ-14
        15 : "we", //ㅞ-15
        19 : "ui" // ㅢ-19  [붙임 1] ‘ㅢ’는 ‘ㅣ’로 소리 나더라도 ‘ui’로 적는다.
        
    ]
    
    
    
    //초성  (Syllable Onset)
    let first :[UInt32 : String] = [
        //파열음 stops/plosives
        0 : "g", //ㄱ-0
        1 : "kk", //ㄲ-1
        15 : "k", //ㅋ-15
        3 : "d", //ㄷ-3
        4 : "tt", //ㄸ-4
        16 : "t", //ㅌ-16
        7 : "b", //ㅂ-7
        8 : "pp", //ㅃ-8
        17 : "p", //ㅍ-17
        // 파찰음 affricates
        12 : "j", //ㅈ-12
        13 : "jj", //ㅉ-13
        14 : "ch", //ㅊ-14
        // 마찰음 fricatives
        9 : "s", //ㅅ-9
        10 : "ss", //ㅆ-10
        18 : "h", //ㅎ-18
        // 비음 nasals
        2 : "n", //ㄴ-2
        6 : "m", //ㅁ-6
        // 유음 liquids
        5 : "r", //ㄹ-5
        // Null sound
        11 : "" //ㅇ-11
    ]
    
    
    //    종성  (Syllable Coda)
    let final :[UInt32 : String] = [
        // 파열음 stops/plosives
        1 : "k", //ㄱ-1
        7 : "t", //ㄷ-7
        17: "p", //ㅂ-17
        // 비음 nasals
        4 : "n", //ㄴ-4
        21 : "ng", //ㅇ-21
        16 : "m", //ㅁ-16
        // 유음 liquids
        8 : "l" //ㄹ-8
        
        //None: "",
    ]
    
    
    //MARK: - Romanize
    
    // 숫자로 표현된 배열을 글자로 바꾼다. 한글 아니면 배열값 하나, 음절단위면 3개로 나누어 저장 - 확인용
    
    
    
    
    var romanizedNumberArr = [[UInt32]]()
    var romanizeIndex = 0
    var romanizedString = ""
    
    func romanizer(input: [[UInt32]])  {
        for arr in input {
            
            if arr.count == 1 && (arr[0] < 12593 || arr[0] > 12643) {
                let uintToString = UnicodeScalar(arr[0])
                romanizedString += "\(uintToString!)"
                
            } else if arr.count == 1 && arr[0] >= 12593 && arr[0] <= 12643 {
                
                let uintToString = jamo["\(UnicodeScalar(arr[0])!)"]
                
                romanizedString += "\(uintToString!)"
            } else if arr.count == 3 && arr[2] != 0 {
                
                let firstToString = first[arr[0]]
                let middleToString = middle[arr[1]]
                let finalToString = final[arr[2]]
              
                romanizedString += "\(firstToString!)\(middleToString!)\(finalToString!)"
                
            } else if arr.count == 3 && arr[2] == 0 {
                let firstToString = first[arr[0]]
                let middleToString = middle[arr[1]]
                let finalToString = ""
                romanizedString += "\(firstToString!)\(middleToString!)\(finalToString)"
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Proununciation
    
    
    
    
    
    //MARK: - Syllable
    
    //입력 텍스트를 음절 단위로 분할
    var syllableArr: [Character]  = []
    
    func convertToSyllabes (inputText : String)  {
        for character in inputText {
            syllableArr.append(character)
        }
    }
    
    //입력텍스트 유니코드 변환
    func stringToUnicode(input: Character) -> UInt32 {
        let result = input.unicodeScalars[input.unicodeScalars.startIndex].value
        return result
    }
    
    
    //유니코드가 한글인지 확인
    func isKorean(char: UInt32) -> Bool {
        if char >= 0xAC00 && char <= 0xD7A3 {
            return true
        } else {
            return false
        }
    }
    
    
    // 한 음절을 초성, 중성, 종성으로 분리  또는 한글 음절이 아닐 때는 하나의 값으로 배열에 넣기
    var oneSyllable : [UInt32] = []
    var characterToIntArr = [[UInt32]]()
    var firstCharacterToIntArr = [[UInt32]]()
    
    func seperateSyllables(inputSyllable : [Character]) {
        for eachSyllable in inputSyllable {
            let c =  stringToUnicode(input: eachSyllable)
            if isKorean(char: c) {
                let x = (c - 44032) / (28 * 21)
                let y = (c - 44032)  % (21 * 28) / 28
                let z = (c - 44032) % 28
                oneSyllable = [x, y, z]
            } else {
                oneSyllable = [c]
            }
            characterToIntArr += [oneSyllable]
        }
        firstCharacterToIntArr = characterToIntArr
    }
    
    
    //음운규칙//
    
    
    //ㄴ 첨가
    var nieunCurrentIndex = 0
    var nieunArr = [[UInt32]]()
    
    func nieunPlus(numberArr: [[UInt32]]) {
        
        var numberArr = numberArr
        //앞음절에 종성이 존재하고 뒷음절의 초중성이 [이-11,20 야-11,2 여-11,6 요-11,12 유-11,17] 인 경우 ㅇ-11을 ㄴ-2 으로 바꾼다. 합성어, 복합어에만 해당  ex)물이 맑다 에서 물이는 합성어 아님 따라서 적용안됨
        for nieun in numberArr {
            if nieunCurrentIndex > 0 && numberArr[nieunCurrentIndex - 1].count == 3 && numberArr[nieunCurrentIndex - 1][2] != 0 && nieun.count == 3 && nieun[0] == 11 {
                print("sssss")
                //[이]-11,20 는 따로 빼서 처리, [이]뒤에 공백이 있으면 형식형태소로 보고 적용하지 않기?
                //[용]에 적용하지 않기
                if [2, 6, 12, 17].contains(nieun[1]) && nieun[2] != 21 {
                    print("ㄴ첨가됨")
                    numberArr[nieunCurrentIndex][0] = 2
                } else if nieun[1] == 20 && nieun[2] != 0 {
                    numberArr[nieunCurrentIndex][0] = 2
                }
                else if numberArr.count > nieunCurrentIndex + 1 && nieun[2] == 0 && nieun[1] == 20 && numberArr[nieunCurrentIndex + 1].count != 1 {
                    numberArr[nieunCurrentIndex][0] = 2
                }
                
            }
            nieunCurrentIndex += 1
        }
        nieunArr = numberArr
    }
    
    
    
    
    // 구개음화. 모음 ㅣ-20 와 자음 받침 ㄷ-7, ㅌ-25 만났을 때 초성이 ㅈ-12 ㅊ-14 로 발음  ex) 굳이[구지] 예외)한 단어이면 적용 안함 밭이랑[밭이랑]
    // characterToIntArr에 적용
    
    var gugeCurrentIndex = 0
    var gugeArr = [[UInt32]]()
    
    func guge(numberArr: [[UInt32]]) {
        
        var numberArr = numberArr
        
        for arr in numberArr {
            
            // ㄷ-7,ㅌ-25 이 /이/,/여/,/였/ 와 만나서 ㅈ-12,ㅊ-14 로 변환 ??
            if gugeCurrentIndex > 0 && arr.count == 3 && numberArr[gugeCurrentIndex - 1].count == 3 {
                if (arr == [11, 20, 0]  || arr == [11, 6, 0] || arr == [11, 6, 20]) && [7, 25].contains(numberArr[gugeCurrentIndex - 1][2]) {
                    if numberArr[gugeCurrentIndex - 1][2] == 7 {numberArr[gugeCurrentIndex][0] = 12} else {numberArr[gugeCurrentIndex][0] = 14}
                    numberArr[gugeCurrentIndex - 1][2] = UInt32(0)
                    
                }
                // ㄷ-7 이 /히/,/혀/,/혔/ 와 만나서 ㅊ-14 으로 변환??
                else if (arr == [18, 20, 0]  || arr == [18, 6, 0] || arr == [18, 6, 20]) && [7].contains(numberArr[gugeCurrentIndex - 1][2]) {
                    numberArr[gugeCurrentIndex][0] = 14
                    numberArr[gugeCurrentIndex - 1][2] = UInt32(0)
                }
            }
            gugeCurrentIndex += 1
        }
        gugeArr = numberArr
        
        print("guge \(gugeCurrentIndex)")
        
    }
    
    
    
    //자음 축약
    //연음조건이 있으면 실행하지 않는다(뒷음절이 모음 형식형태소일때)
    
    
    
    var jaeumChukyakArr = [[UInt32]]()
    var jaeumChukyakIndex = 0
    
    func jaeumChukyak(numberArr:[[UInt32]]) {
        
        var numberArr = numberArr
        
        for jaeumArr in numberArr {
            if jaeumChukyakIndex > 0 && jaeumArr.count == 3 && numberArr[jaeumChukyakIndex - 1].count == 3 {
                //앞음절 종성[ㄱ-1, ㄺ-9, ㄷ-7, ㅂ-17, ㄼ-12, ㅈ-22] 가 뒷음절 초성 [ㅎ-18] 만나서 앞음절 종성은 사라지고 뒷 음절 초성이 [ㅋ-15, ㅌ-16, ㅍ-17, ㅊ-14]로 변환. 종성[ㄼ,ㄺ은 ㄹ-8]은 남는다
                if jaeumArr[0] == 18 && [1, 7, 9, 12, 17, 22].contains(numberArr[jaeumChukyakIndex - 1][2]) {
                    switch numberArr[jaeumChukyakIndex - 1][2] {
                    case 1:
                        numberArr[jaeumChukyakIndex - 1][2] = 0
                        numberArr[jaeumChukyakIndex][0] = 15
                    case 7:
                        numberArr[jaeumChukyakIndex - 1][2] = 0
                        numberArr[jaeumChukyakIndex][0] = 16
                    case 17:
                        numberArr[jaeumChukyakIndex - 1][2] = 0
                        numberArr[jaeumChukyakIndex][0] = 17
                    case 22:
                        numberArr[jaeumChukyakIndex - 1][2] = 0
                        numberArr[jaeumChukyakIndex][0] = 14
                    case 9:
                        numberArr[jaeumChukyakIndex - 1][2] = 8
                        numberArr[jaeumChukyakIndex][0] = 15
                    case 12:
                        numberArr[jaeumChukyakIndex - 1][2] = 8
                        numberArr[jaeumChukyakIndex][0] = 17
                    default:
                        break
                    }
                }
                //앞음절 종성[ㄶ-6, ㅀ-15, ㅎ-27] 가 뒷음절 초성 [ㄱ-0, ㄷ-3, ㅂ-7, ㅈ-12] 와 만나서 뒷음절 초성이  [ㅋ-15, ㅌ-16, ㅍ-17, ㅊ-14]로 변환  [ㄶ, ㅀ 에서 ㄴ-4, ㄹ-8] 은 남는다
                // ㅎ받침 규칙도 여기에 추가함
                
                else if [0, 3, 7, 12, 9, 2].contains(jaeumArr[0]) && [6, 15, 27].contains(numberArr[jaeumChukyakIndex - 1][2]) {
                    
                    switch numberArr[jaeumChukyakIndex - 1][2] {
                    
                    case 6 where numberArr[jaeumChukyakIndex][0] == 0 :
                        numberArr[jaeumChukyakIndex - 1][2] = 4
                        numberArr[jaeumChukyakIndex][0] = 15
                        
                    case 6 where numberArr[jaeumChukyakIndex][0] == 3 :
                        numberArr[jaeumChukyakIndex - 1][2] = 4
                        numberArr[jaeumChukyakIndex][0] = 16
                        
                    case 6 where numberArr[jaeumChukyakIndex][0] == 7 :
                        numberArr[jaeumChukyakIndex - 1][2] = 4
                        numberArr[jaeumChukyakIndex][0] = 17
                        
                    case 6 where numberArr[jaeumChukyakIndex][0] == 12 :
                        numberArr[jaeumChukyakIndex - 1][2] = 4
                        numberArr[jaeumChukyakIndex][0] = 14
                        
                    case 15 where numberArr[jaeumChukyakIndex][0] == 0 :
                        numberArr[jaeumChukyakIndex - 1][2] = 8
                        numberArr[jaeumChukyakIndex][0] = 15
                        
                    case 15 where numberArr[jaeumChukyakIndex][0] == 3 :
                        numberArr[jaeumChukyakIndex - 1][2] = 8
                        numberArr[jaeumChukyakIndex][0] = 16
                        
                    case 15 where numberArr[jaeumChukyakIndex][0] == 7 :
                        numberArr[jaeumChukyakIndex - 1][2] = 8
                        numberArr[jaeumChukyakIndex][0] = 17
                        
                    case 15 where numberArr[jaeumChukyakIndex][0] == 12 :
                        numberArr[jaeumChukyakIndex - 1][2] = 8
                        numberArr[jaeumChukyakIndex][0] = 14
                        
                    case 27 where numberArr[jaeumChukyakIndex][0] == 0 :
                        numberArr[jaeumChukyakIndex - 1][2] = 0
                        numberArr[jaeumChukyakIndex][0] = 15
                        
                    case 27 where numberArr[jaeumChukyakIndex][0] == 3 :
                        numberArr[jaeumChukyakIndex - 1][2] = 0
                        numberArr[jaeumChukyakIndex][0] = 16
                        
                    case 27 where numberArr[jaeumChukyakIndex][0] == 7 :
                        numberArr[jaeumChukyakIndex - 1][2] = 0
                        numberArr[jaeumChukyakIndex][0] = 17
                        
                    case 27 where numberArr[jaeumChukyakIndex][0] == 12 :
                        numberArr[jaeumChukyakIndex - 1][2] = 0
                        numberArr[jaeumChukyakIndex][0] = 14
                        
                    //‘ㅎ-27(ㄶ-6, ㅀ-15)’ 뒤에 ‘ㅅ-9’이 결합되는 경우에는, ‘ㅅ-9’을 [ㅆ-10]으로 발음한다.[ㄶ, ㅀ 에서 ㄴ-4, ㄹ-8] 은 남는다
                    case 27 where numberArr[jaeumChukyakIndex][0] == 9 :
                        numberArr[jaeumChukyakIndex - 1][2] = 0
                        numberArr[jaeumChukyakIndex][0] = 10
                    case 6 where numberArr[jaeumChukyakIndex][0] == 9 :
                        numberArr[jaeumChukyakIndex - 1][2] = 4
                        numberArr[jaeumChukyakIndex][0] = 10
                    case 15 where numberArr[jaeumChukyakIndex][0] == 9 :
                        numberArr[jaeumChukyakIndex - 1][2] = 8
                        numberArr[jaeumChukyakIndex][0] = 10
                        
                    //앞음절 종성 ㅎ-27’ 뒤에  뒷음절 초성‘ㄴ-2’이 결합되는 경우에는,  앞음절 종성이[ㄴ-4]으로 발음한다.
                    //‘ㄶ-6, ㅀ-15)’ 뒤에 ‘ㄴ-2’이 결합되는 경우에는, ‘ㅎ’을 발음하지 않는다. [ㄴ-4, ㄹ-8] 은 남는다
                    case 27 where numberArr[jaeumChukyakIndex][0] == 2 :
                        numberArr[jaeumChukyakIndex - 1][2] = 4
                    case 6 where numberArr[jaeumChukyakIndex][0] == 2 :
                        numberArr[jaeumChukyakIndex - 1][2] = 4
                    case 15 where numberArr[jaeumChukyakIndex][0] == 2 :
                        numberArr[jaeumChukyakIndex - 1][2] = 8
                        
                        
                    default:
                        break
                    }
                    
                    
                }
                
            }
            jaeumChukyakIndex += 1
        }
        jaeumChukyakArr = numberArr
        
    }
    
    
    
    //자음동화
    var jaeumDonghwaArr = [[UInt32]]()
    var jaeumDonghwaIndex = 0
    
    func jaeumDonghwa(numberArr:[[UInt32]]) {
        
        var numberArr = numberArr
        
        for jaeumArr in numberArr {
            
            
            //뒷음절 초성 ㄴ-2, ㅁ-6 앞에서 앞음절 종성 ㄱ-1, ㄷ-7, ㅂ-17이 각각 ㅇ-21, ㄴ-4, ㅁ-16으로 변함(비음화- 순행동화)
            if jaeumDonghwaIndex > 0 && jaeumArr.count == 3 && numberArr[jaeumDonghwaIndex - 1].count == 3 {
                if [2, 6].contains(jaeumArr[0]) && [1, 7, 17].contains(numberArr[jaeumDonghwaIndex - 1][2]) {
                    switch numberArr[jaeumDonghwaIndex - 1][2] {
                    
                    case 1:
                        numberArr[jaeumDonghwaIndex - 1][2] = 21
                    case 7:
                        numberArr[jaeumDonghwaIndex - 1][2] = 4
                    case 17:
                        numberArr[jaeumDonghwaIndex - 1][2] = 16
                    default:
                        break
                    }
                }
                //앞음절 종성 ㅁ-16 ㅇ-21 과 뒷음절 초성 ㄹ-5 이 만나면 초성 ㄹ이 ㄴ-2 으로 변환(비음화 - 역행동화)
                else if [16, 21].contains(numberArr[jaeumDonghwaIndex - 1][2]) && jaeumArr[0] == 5 {
                    numberArr[jaeumDonghwaIndex][0] = 2
                }
                
                //순행과 역행이 한번씩 일어나는 상호동화도 존재(이거는 조건문 자체를 변화가 없을 때 까지여러번 돌리는 것으로 해결?)
                //백로[(백노→)뱅노], 협력[(협녁→)혐녁]
                
                //종성 ㄹ-8의 뒤에서 초성 ㄴ-2이 ㄹ-5로 변함 (순행 동화)
                else if numberArr[jaeumDonghwaIndex - 1][2] == 8 && jaeumArr[0] == 2 {
                    numberArr[jaeumDonghwaIndex][0] = 5
                }
                //뒷음절 초성 ㄹ-5의 앞에서 앞음절 종성 ㄴ-4이 ㄹ-8로 변함 (역행 동화)
                else if numberArr[jaeumDonghwaIndex - 1][2] == 4 && jaeumArr[0] == 5 {
                    numberArr[jaeumDonghwaIndex - 1][2] = 8
                }
            }
            jaeumDonghwaIndex += 1
            
        }
        jaeumDonghwaArr = numberArr
    }
    
    
    //경음화(된소리)
    
    
    var gyeongeumhwaArr = [[UInt32]]()
    var gyeongeumhwaIndex = 0
    
    func gyeongeumhwa(numberArr:[[UInt32]]) {
        
        var numberArr = numberArr
        
        for gyeongeum in numberArr {
            //앞음절 종성 ‘ㄱ-1(ㄲ-2, ㅋ-24, ㄳ-3, ㄺ-9), ㄷ-7(ㅅ-19, ㅆ-20, ㅈ-22, ㅊ-23, ㅌ-25), ㅂ-17(ㅍ-26, ㄼ-11, ㄿ-14, ㅄ-18)’ 의 뒷음절 초성 ‘ㄱ-0, ㄷ-3, ㅂ-7, ㅅ-9, ㅈ-12’은 된소리로(ㄲ-1, ㄸ-4, ㅃ- 8,  ㅆ-10, ㅉ-13) 발음한다.
            if gyeongeumhwaIndex > 0 && gyeongeum.count == 3 && numberArr[gyeongeumhwaIndex - 1].count == 3 {
                if [1, 2, 24, 3, 9, 7, 19, 20, 22, 23, 25, 17, 26, 11, 14, 18].contains(numberArr[gyeongeumhwaIndex - 1][2]) && [0, 3, 7, 9, 12].contains(gyeongeum[0]) {
                    numberArr[gyeongeumhwaIndex][0] = gyeongeum[0] + 1
                }
                //                else if [4, 5, 16, 10].contains(numberArr[gyeongeumhwaIndex - 1][2]) && [0, 3, 9, 12].contains(gyeongeum[0]) && gyeongeum != [0, 20, 0]
                //                // 어간 받침 ‘ㄴ-4(ㄵ-5), ㅁ-16(ㄻ-10)’ 뒤에 결합되는 어미의 첫소리 ‘ㄱ-0, ㄷ-3, ㅅ-9, ㅈ-12’은 된소리로 발음한다. 형용사 동사에만 적용 ex) 신을 신고 != 경찰 신고
                //                // 접미사 ‘-기-’는 된소리로 발음하지 않는다.
                //                {
                //                    numberArr[gyeongeumhwaIndex][0] = gyeongeum[0] + 1
                //                }
            }
            gyeongeumhwaIndex += 1
        }
        gyeongeumhwaArr = numberArr
    }
    
    
    //끝소리 규칙(말음?)
    //자음이 음절의 끝에 올 때는 'ㄱ, ㄴ, ㄷ, ㄹ, ㅁ, ㅂ, ㅇ' 중 한 가지로만 발음되는 현상
    //연음조건이 있으면 실행하지 않는다(뒷음절이 모음 형식형태소일때)
    
    
    var maleumRuleArr = [[UInt32]]()
    var maleumRuleIndex = 0
    
    func maleumRule (numberArr:[[UInt32]]) {
        
        var numberArr = numberArr
        
        
        
        
        while maleumRuleIndex < numberArr.count {
            
            //뒷음절 모음이면 연음을 위해 끝소리규칙 뛰어넘기??
            if maleumRuleIndex + 1 < numberArr.count && numberArr[maleumRuleIndex].count == 3 && numberArr[maleumRuleIndex][2] != 0 && numberArr[maleumRuleIndex + 1][0] == 11 {
                print("연음으으으으")
                print(maleumRuleIndex)
                maleumRuleIndex += 1
                print(maleumRuleIndex)
            }
            
            print("끝소리")
            
            
            if numberArr[maleumRuleIndex].count == 3 && numberArr[maleumRuleIndex][2] != 0 {
                //혿받침 쌍받침
                switch numberArr[maleumRuleIndex][2] {
                //ㄱ-1, ㄲ-2, ㅋ-24: [ㄱ]-1
                case 2, 24:
                    numberArr[maleumRuleIndex][2] = 1
                // ㄷ-7, ㅌ-25, ㅅ-19, ㅆ-20, ㅈ-22, ㅊ-23, ㅎ-27: [ㄷ]-7
                case 25, 19, 20, 22, 23, 27:
                    numberArr[maleumRuleIndex][2] = 7
                // ㅂ-17, ㅍ-26: [ㅂ] - 17
                case 26:
                    numberArr[maleumRuleIndex][2] = 17
                    
                //겹받침
                //[ㄳ-3 ㄵ-5  ㅄ-18] 이 ㄱ-1 ㄴ-4 ㅂ-17
                case 3:
                    numberArr[maleumRuleIndex][2] = 1
                case 5:
                    numberArr[maleumRuleIndex][2] = 4
                case 18:
                    numberArr[maleumRuleIndex][2] = 17
                    
                    
                //[ㄼ-11 ㄽ-12 ㄾ-13] 이 ㄹ-8
                case 11:
                    //ㄼ-11 이 ㅂ-17 이 되는경우-밟이 자음 앞에 올 때
                    if maleumRuleIndex + 1 < numberArr.count && numberArr[maleumRuleIndex] == [7, 0, 11]  && numberArr[maleumRuleIndex + 1].count == 3 && [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18].contains(numberArr[maleumRuleIndex + 1][0]) {
                        numberArr[maleumRuleIndex][2] = 17
                        print("밟다 밟")
                    }
                    //예외 넓죽, 넓둥글다는 ㅂ-17 사용
                    else if maleumRuleIndex + 1 < numberArr.count && numberArr[maleumRuleIndex] == [2, 4, 11]  && (numberArr[maleumRuleIndex + 1] == [12, 13, 1] || numberArr[maleumRuleIndex + 1] == [3, 13, 21]) {
                        numberArr[maleumRuleIndex][2] = 17

                    } else {
                        numberArr[maleumRuleIndex][2] = 8
                        print("일반밟")
                    }
                case 12, 13:
                    numberArr[maleumRuleIndex][2] = 8
                    
                    
                //ㄺ-9 ㄻ-10 ㄿ-14 이 ㄹ사라지고 ㄱ-1 ㅁ-16 ㅂ-17 된다. ㄺ-9 뒤의 초성이 ㄱ-0 이면 ㄺ이 ㄹ-8로 발음
                case 9 where maleumRuleIndex > 0 && numberArr[maleumRuleIndex + 1][0] == 0 && numberArr[maleumRuleIndex + 1].count == 3:
                    numberArr[maleumRuleIndex][2] = 8
                case 9:
                    numberArr[maleumRuleIndex][2] = 1
                case 10 where maleumRuleIndex > 0:
                    numberArr[maleumRuleIndex][2] = 16
                case 14 where maleumRuleIndex > 0:
                    numberArr[maleumRuleIndex][2] = 17
                default:
                    break
                    
                }
            }
            
            maleumRuleIndex += 1
        }
        
        maleumRuleArr = numberArr
        
    }
    
    
    
    
    //연음법칙
    
    var yeuneumRullArr = [[UInt32]]()
    var yeuneumRuleIndex = 0
    
    func yeuneumRule (numberArr:[[UInt32]]) {
        
        var numberArr = numberArr
        
        for yeuneum in numberArr {
            //앞음절 종성이 존재 뒷음절 초성 모음 ??
            if yeuneumRuleIndex > 0 && yeuneum.count == 3 && yeuneum[0] == 11 && numberArr[yeuneumRuleIndex - 1].count == 3 && numberArr[yeuneumRuleIndex - 1][2] != 0 {
                
                switch numberArr[yeuneumRuleIndex - 1][2] {
                case 1: //ㄱ-1 에서 ㄱ-0
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 0
                case 2: //ㄲ-2 에서 ㄲ-1
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 1
                case 3: //ㄳ-3에서 ㄱ-1남고 ㅆ-10
                    numberArr[yeuneumRuleIndex - 1][2] = 1
                    numberArr[yeuneumRuleIndex][0] = 10
                case 4: // ㄴ-4에서 ㄴ-2
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 2
                case 5: //  ㄵ-5에서 ㄴ-4 남고 ㅈ-12
                    numberArr[yeuneumRuleIndex - 1][2] = 4
                    numberArr[yeuneumRuleIndex][0] = 12
                case 6: // ㄶ-6에서 ㄴ-2
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 2
                case 7: //ㄷ-7에서 ㄷ-3
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 3
                case 8: //ㄹ-8에서 ㄹ-5
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 5
                case 9: //ㄺ-9에서 ㄹ-8남고 ㄱ-0
                    numberArr[yeuneumRuleIndex - 1][2] = 8
                    numberArr[yeuneumRuleIndex][0] = 0
                case 10: //ㄻ-10에서 ㄹ-8남고 ㅁ-6
                    numberArr[yeuneumRuleIndex - 1][2] = 8
                    numberArr[yeuneumRuleIndex][0] = 6
                case 11: //ㄼ-11에서 ㄹ-8남고 ㅂ-7
                    numberArr[yeuneumRuleIndex - 1][2] = 8
                    numberArr[yeuneumRuleIndex][0] = 7
                case 12: //ㄽ-12에서 ㄹ-8남고 ㅅ-9
                    numberArr[yeuneumRuleIndex - 1][2] = 8
                    numberArr[yeuneumRuleIndex][0] = 9
                case 13: //ㄾ-13에서 ㄹ-8남고 ㅌ-16
                    numberArr[yeuneumRuleIndex - 1][2] = 8
                    numberArr[yeuneumRuleIndex][0] = 16
                case 14: //ㄿ-14에서 ㄹ-8남고 ㅍ-17
                    numberArr[yeuneumRuleIndex - 1][2] = 8
                    numberArr[yeuneumRuleIndex][0] = 17
                case 15: //ㅀ-15에서 ㄹ-5
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 5
                case 16: //ㅁ-16에서 ㅁ-6
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 6
                case 17: //ㅂ-17에서 ㅂ-7
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 7
                case 18: //ㅄ-18에서 ㅂ-17남고 ㅆ-10
                    numberArr[yeuneumRuleIndex - 1][2] = 17
                    numberArr[yeuneumRuleIndex][0] = 10
                case 19: //ㅅ-19에서 ㅅ-9
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 9
                case 20: //ㅆ-20에서 ㅆ-10
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 10
                //case 21: //ㅇ-21에서 변화없음
                
                case 22: //ㅈ-22에서 ㅈ-12
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 12
                case 23: //ㅊ-23에서 ㅊ-14
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 14
                case 24: //ㅋ-24에서 ㅋ-15
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 15
                case 25: //ㅌ-25에서 ㅌ-16
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 16
                case 26: //ㅍ-26에서 ㅍ-17
                    numberArr[yeuneumRuleIndex - 1][2] = 0
                    numberArr[yeuneumRuleIndex][0] = 17
                // ㅂcase 27: //ㅎ-27에서 변화없음
                
                
                default:
                    break
                }
                
            }
            yeuneumRuleIndex += 1
        }
        yeuneumRullArr = numberArr
    }
    
    
    
    // 숫자로 표현된 배열을 글자로 바꾼다. 한글 아니면 배열값 하나, 음절단위면 3개로 나누어 저장 - 확인용
    
    var resultString: String = ""
    
    func numberToString(numberArr: [[UInt32]])  {
        for eachNumberArr in numberArr {
            
            if eachNumberArr.count == 1 {
                let i = UnicodeScalar(eachNumberArr[0])
                let compositeString = "\(i!)"
                resultString += compositeString
                
            }
            else if eachNumberArr.count == 3
            {
                if eachNumberArr[2] == 0 {
                    let i = UnicodeScalar(0x1100 + eachNumberArr[0])
                    let j = UnicodeScalar(0x1161 + eachNumberArr[1])
                    let compositeString = "\(i!)\(j!)"
                    resultString += compositeString
                    
                } else {
                    let i = UnicodeScalar(0x1100 + eachNumberArr[0])
                    let j = UnicodeScalar(0x1161 + eachNumberArr[1])
                    let k = UnicodeScalar(0x11a6 + 1 + eachNumberArr[2])
                    let compositeString = "\(i!)\(j!)\(k!)"
                    resultString += compositeString
                }
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
