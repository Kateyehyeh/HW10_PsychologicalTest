//
//  IntroductionViewController.swift
//  HW10_PsychologicalTest
//
//  Created by Kate Yeh on 2025/5/27.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var introduceTitleLabel: UILabel!
    @IBOutlet weak var introduceTextView: UITextView!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var finalScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgImageView = UIImageView(frame: view.bounds)
        bgImageView.image = UIImage(named: "background2")
        bgImageView.contentMode = .scaleToFill
        //把bgImageView插入到最底層
        view.insertSubview(bgImageView, at: 0)
        
        setintroduceTitleLabel(introduceTitleLabel)
        showTextView(introduceTextView)
        setAgainButtonStyle(playAgainButton)
    }
    
    func setintroduceTitleLabel(_ introduceTitleLabel: UILabel){
        
        if let score = finalScore{
            switch score{
            case 5...8:
                introduceTitleLabel.text = "KPI至上·狂熱刺蝟"
            case 9...12:
                introduceTitleLabel.text = "準時下班·社恐海豹"
            case 13...16:
                introduceTitleLabel.text = "完美主義·焦慮烏龜"
            case 17...20:
                introduceTitleLabel.text = "整頓職場·反骨狐狸"
            default:
                introduceTitleLabel.text = "你的角色是???"
            }
        }else{
                introduceTitleLabel.text = "你的角色是???"
        }
        
        introduceTitleLabel.font = UIFont(name: "Helvetica Bold", size: 30)
        introduceTitleLabel.textColor = UIColor(red: 38/255, green: 84/255, blue: 159/255, alpha: 1)
        introduceTitleLabel.textAlignment = .center
        introduceTitleLabel.backgroundColor = .clear
        introduceTitleLabel.layer.cornerRadius = 10
        introduceTitleLabel.layer.masksToBounds = true
        introduceTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func showTextView(_ introduceTextView: UITextView){
        
        if let score = finalScore{
            switch score{
            case 5...8:
                introduceTextView.text = "「別問我夢想是什麼，先問KPI破了沒。」\n你是任務導向的極致實踐者，最擅長用報表說話，眼裡只有KPI、數據、績效圖表。你對自己的高標準從不妥協，會主動追進度、訂目標，甚至在深夜設下自動提醒。你不怕挑戰、不怕加班，只怕無法超標完成任務。團隊仰賴你的戰力，也敬畏你的效率。雖然常被說太拚命，但你知道，數字不會背叛你。職場於你，是戰場；每個專案，都是一場漂亮的攻防戰。"
            case 9...12:
                introduceTextView.text = "「工作只是謀生，下班才是人生。」\n你是靜悄悄完成所有事的人，存在感極低，卻是團隊中最穩定的後盾。你不爭功，不搶話，只求穩定、和平、準時下班。會議不想多講，訊息不想秒回，工作之外就是自由時光。你擅長掌握「剛剛好」的分寸，把職場當成生活的一小塊，而不是整個人生。你深知「不爭不搶不出頭、不惹麻煩」才是真正的職場生存術。有人覺得你佛系，但其實你只是不想讓職場壓垮你珍貴的生活。"
            case 13...16:
                introduceTextView.text = "「再確認一下好了…不然睡不著。」\n你對每個細節都斤斤計較，總想做到最好，卻常常因為擔心不夠好而反覆修正。即使已經準備得萬無一失，還是會因一個小錯字焦慮一整晚。你有高標準也有高產出，但壓力與日俱增。別人看你冷靜又可靠，其實你早在腦中模擬了所有最壞劇本。你不是不夠好，只是總覺得還不夠好。你的焦慮是源於責任感，但偶爾，請記得放自己一馬，完美並不是唯一解。"
            case 17...20:
                introduceTextView.text = "「我從不抱怨制度，我直接拆了它。」\n你是那種在開會時會突然冒出「我們為什麼要這樣做？」的人，永遠在打破常規的邊緣徘徊。你挑戰體制，但不為反對而反對，而是因為你真的看到更好的可能性。你的語氣可能犀利，但出發點是善意；你能一針見血指出問題，也能帶動團隊思考更多創新的可能。雖然主管有時會被你氣到失眠，但同事們知道，沒有你，團隊就少了一個靈魂。你不只是員工，你是改革的種子，是打破舒適圈的先鋒。"
            default:
                introduceTextView.text = "??"
            }
        }else{
            introduceTextView.text = "???"
        }
        
        introduceTextView.font = UIFont(name: "Helvetica Bold", size: 25)!
    }
    
    func setAgainButtonStyle(_ playAgainButton: UIButton){
        playAgainButton.configuration = nil
        playAgainButton.setTitle("再測一次", for: .normal)
        playAgainButton.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        playAgainButton.setTitleColor(.white, for: .normal)
        playAgainButton.backgroundColor = UIColor(red: 38/255, green: 84/255, blue: 159/255, alpha: 0.85)
        playAgainButton.layer.cornerRadius = 20
        //外框線條寬度
        playAgainButton.layer.borderWidth = 3
        //外框線條顏色
        playAgainButton.layer.borderColor = UIColor(red: 228/255, green: 213/255, blue: 187/255, alpha: 0.8).cgColor
    }
    
    @IBAction func  tapAgainButton(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

}
