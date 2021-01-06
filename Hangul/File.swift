//// 
//
//import Foundation
//switch arr[0] {
//
////겹받침 ㄳ · ㄵ · ㄶ · ㄺ · ㄻ · ㄼ · ㄽ · ㄾ · ㄿ · ㅀ · ㅄ 생략? 존재하지않음
//
//
////자음 ㄱ · ㄴ · ㄷ · ㄹ · ㅁ · ㅂ · ㅅ · ㅇ · ㅈ · ㅊ · ㅋ · ㅌ · ㅍ · ㅎ
//case 12593:  //ㄱ -12593  a-97
//    input[romanizeIndex][0] = 97
//case 12596:  //ㄴ -12596  n-110
//    input[romanizeIndex][0] = 110
//case 12599:  //ㄷ -12599  d-100
//    input[romanizeIndex][0] = 100
//case 12601:  //ㄹ -12601  r-114
//    input[romanizeIndex][0] = 114
//case 12609:  //ㅁ -12609  m-109
//    input[romanizeIndex][0] = 109
//case 12610:  //ㅂ -12610  b-98
//    input[romanizeIndex][0] = 98
//case 12613:  //ㅅ -12613  s-115
//    input[romanizeIndex][0] = 115
//case 12615:  //ㅇ -12615  없음-
//    input[romanizeIndex][0] = 12615
//case 12616:  //ㅈ -12616  j-106
//    input[romanizeIndex][0] = 106
//case 12618:  //ㅊ -12618  ch-99,104
//    input[romanizeIndex] = [99, 104]
//case 12619:  //ㅋ -12619  k-107
//    input[romanizeIndex][0] = 107
//case 12620:  //ㅌ -12620  t-116
//    input[romanizeIndex][0] = 116
//case 12621:  //ㅍ -12621  p-112
//    input[romanizeIndex][0] = 112
//case 12622:  //ㅎ -12622  h-104
//    input[romanizeIndex][0] = 104
//    
////쌍자음 ㄲ · ㄸ · ㅃ · ㅆ · ㅉ
//case 12594:  //ㄲ-12594 kk-107,107
//    input[romanizeIndex] = [107, 107]
//case 12600:  //ㄸ-12600 tt-116, 116
//    input[romanizeIndex] = [116, 116]
//case 12611:  //ㅃ-12611 pp-112,112
//    input[romanizeIndex] = [112, 112]
//case 12614:  //ㅆ-12614 ss-115,115
//    input[romanizeIndex] = [115, 115]
//case 12617:  //ㅉ-12617 jj-106,106
//    input[romanizeIndex] = [106, 106]
//
//    
////모음 ㅏ · ㅑ · ㅓ · ㅕ · ㅗ · ㅛ · ㅜ · ㅠ · ㅡ · ㅣ
//case 12623:  //ㅏ -12623 a-97
//    input[romanizeIndex][0] = 97
//case 12625:  //ㅑ -12625 ya-121,97
//    input[romanizeIndex] = [121, 97]
//case 12627:  //ㅓ -12627 eo-101,111
//    input[romanizeIndex] = [101, 111]
//case 12629:  //ㅕ -12629 yeo- 121,101,111
//    input[romanizeIndex] = [121, 101, 111]
//case 12631:  //ㅗ -12631 o-111
//    input[romanizeIndex][0] = 111
//case 12635:  //ㅛ -12635 yo-121,111
//    input[romanizeIndex] = [121, 111]
//case 12636:  //ㅜ -12636 u-117
//    input[romanizeIndex][0] = 117
//case 12640:  //ㅠ -12640 yu- 121, 117
//    input[romanizeIndex] = [121, 117]
//case 12641:  //ㅡ -12641 eu- 101 117
//    input[romanizeIndex] = [101, 117]
//case 12643:  //ㅣ -12643 i-105
//    input[romanizeIndex][0] = 105
//    
////모음 ㅐ · ㅒ · ㅔ · ㅖ · ㅘ · ㅙ · ㅚ · ㅝ · ㅞ · ㅟ · ㅢ
//case 12624:  //ㅐ-12624 ae-97,101
//    input[romanizeIndex] = [97, 101]
//case 12626:  //ㅒ-12626 yae-121,97,101
//    input[romanizeIndex] = [121, 97, 101]
//case 12628:  //ㅔ-12628 e-101
//    input[romanizeIndex] = [101]
//case 12630:  //ㅖ-12630 ye-121,101
//    input[romanizeIndex] = [121, 101]
//case 12632:  //ㅘ-12632 wa-119,97
//    input[romanizeIndex] = [119, 97]
//case 12633:  //ㅙ-12633 wae-119,97,101
//    input[romanizeIndex] = [119, 97, 101]
//case 12634:  //ㅚ-12634 oe-111,101
//    input[romanizeIndex] = [111, 101]
//case 12637:  //ㅝ-12637 wo-119,111
//    input[romanizeIndex] = [119,111]
//case 12638:  //ㅞ-12638 we-119,101
//    input[romanizeIndex] = [119, 101]
//case 12639:  //ㅟ-12639 wi-119,105
//    input[romanizeIndex] = [119, 105]
//case 12642:  //ㅢ-12642 ui-117,105
//    input[romanizeIndex] = [117, 105]
//    
//    
//default:
//    break
//}
//}
////한글 음절 숫자값을 로마자 숫자값으로 변환
//else if arr.count == 3 {
//
////초성 숫자값 로마자 숫자값로 변환
//switch input[romanizeIndex][0] {
//
//case 0: //ㄱ-0 이 g-103
//    input[romanizeIndex][0] = 103
//case 1: //ㄲ-1 이 kk-107,107
//    input[romanizeIndex][0] = choseong["ㄱ"]
//    
//    
//case 2: //ㄴ-2 이 k-
//    input[romanizeIndex][0] =
//case 3: //ㄷ-3 이 d-
//    input[romanizeIndex][0] =
//case 4: //ㄸ-4 이 tt-
//    input[romanizeIndex][0] =
//case 5: //ㄹ-5 이 r-
//    input[romanizeIndex][0] =
//case 6: //ㅁ-6 이 m-
//    input[romanizeIndex][0] =
//case 7: //ㅂ-7 이 b-
//    input[romanizeIndex][0] =
//case 8: //ㅃ-8 이 pp-
//    input[romanizeIndex][0] =
//case 9: //ㅅ-9 이 s-
//    input[romanizeIndex][0] =
//case 10: //ㅆ-10 이 ss-
//    input[romanizeIndex][0] =
//case 11: //ㅇ-11 이 없음
//    input[romanizeIndex][0] =
//case 12: //ㅈ-12 이 j-
//    input[romanizeIndex][0] =
//case 13: //ㅉ-13 이 jj-
//    input[romanizeIndex][0] =
//case 14: //ㅊ-14 이 ch-
//    input[romanizeIndex][0] =
//case 15: //ㅋ-15 이 k-
//    input[romanizeIndex][0] =
//case 16: //ㅌ-16 이 t-
//    input[romanizeIndex][0] =
//case 17: //ㅍ-17 이 p
//    input[romanizeIndex][0] =
//case 18: //ㅎ-18 이 h
//    input[romanizeIndex][0] =
//default:
//    break
//}
//
////중성 숫자값 로마자 숫자값로 변환
//switch input[romanizeIndex][1] {
//case pattern:
//    <#code#>
//default:
//    break
//}
//
////종성 숫자값 로마자 숫자값로 변환
//switch input[romanizeIndex][2] {
//case <#pattern#>:
//    <#code#>
//default:
//    break
//}
//}
//romanizeIndex += 1




//var romanizedString: String = ""
//
//func romanizedNumberToString(numberArr: [[UInt32]])  {
//    for eachNumberArr in numberArr {
//        
//        if eachNumberArr.count == 1 {
//            let i = UnicodeScalar(eachNumberArr[0])
//            let compositeString = "\(i!)"
//            romanizedString += compositeString
//            
//        }
//        else if eachNumberArr.count == 3
//        {
//            if eachNumberArr[2] == 0 {
//                let i = UnicodeScalar(eachNumberArr[0])
//                let j = UnicodeScalar(eachNumberArr[1])
//                let compositeString = "\(i!)\(j!)"
//                romanizedString += compositeString
//                
//            } else {
//                let i = UnicodeScalar(eachNumberArr[0])
//                let j = UnicodeScalar(eachNumberArr[1])
//                let k = UnicodeScalar(eachNumberArr[2])
//                let compositeString = "\(i!)\(j!)\(k!)"
//                romanizedString += compositeString
//            }
//        }
//        
//    }
//}
