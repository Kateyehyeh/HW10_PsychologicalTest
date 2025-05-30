//
//  ResultViewController.swift
//  HW10_PsychologicalTest
//
//  Created by Kate Yeh on 2025/5/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var introduceButton: UIButton!
    
    var finalScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImageView = UIImageView(frame: view.bounds)
        bgImageView.image = UIImage(named: "background2")
        bgImageView.contentMode = .scaleToFill
        //把bgImageView插入到最底層
        view.insertSubview(bgImageView, at: 0)

        setresultTitleLabelStyle(resultTitleLabel)
        setroleLabel(roleLabel)
        setresultImage()
        setintroduceButtonStyle(introduceButton)
        
    }
    
    func setresultTitleLabelStyle(_ resultTitleLabel: UILabel){
        
        if let finalScore = finalScore{
            resultTitleLabel.text = "你的總分數是：\(finalScore)分"
        }else {
            resultTitleLabel.text = "你的總分數是：0分"
        }
        
        resultTitleLabel.font = UIFont(name: "Helvetica Bold", size: 25)
        resultTitleLabel.textColor = .black
        resultTitleLabel.textAlignment = .center
        resultTitleLabel.backgroundColor = .clear
        resultTitleLabel.layer.cornerRadius = 10
        resultTitleLabel.layer.masksToBounds = true
    }
    
    func setroleLabel(_ roleLabel: UILabel){
        
        if let score = finalScore{
            switch score{
            case 5...8:
                roleLabel.text = "你的角色是 KPI至上·狂熱刺蝟"
            case 9...12:
                roleLabel.text = "你的角色是 準時下班·社恐海豹"
            case 13...16:
                roleLabel.text = "你的角色是 完美主義·焦慮烏龜"
            case 17...20:
                roleLabel.text = "你的角色是 整頓職場·反骨狐狸"
            default:
                roleLabel.text = "你的角色是???"
            }
        }else{
                roleLabel.text = "你的角色是???"
        }
        
        roleLabel.font = UIFont(name: "Helvetica Bold", size: 25)
        roleLabel.textColor = .black
        roleLabel.textAlignment = .center
        roleLabel.backgroundColor = .clear
        roleLabel.layer.cornerRadius = 10
        roleLabel.layer.masksToBounds = true
        roleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setresultImage(){
        guard let score = finalScore else {
            resultImageView.image = nil
            return
        }
        
       switch score{
            case 5...8:
                resultImageView.image = UIImage(named: "hedgehog")
            case 9...12:
                resultImageView.image = UIImage(named: "seal")
            case 13...16:
                resultImageView.image = UIImage(named: "turtle")
            case 17...20:
                resultImageView.image = UIImage(named: "fox")
            default:
                resultImageView.image = nil
            
        }
        
        resultImageView.contentMode = .scaleToFill
        
    }
    
    func setintroduceButtonStyle(_ nextButton: UIButton){
        introduceButton.configuration = nil
        introduceButton.setTitle("解析", for: .normal)
        introduceButton.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        introduceButton.setTitleColor(.black, for: .normal)
        introduceButton.backgroundColor = UIColor(red: 110/255, green: 121/255, blue: 104/255, alpha: 0.85)
        introduceButton.layer.cornerRadius = 20
        //外框線條寬度
        introduceButton.layer.borderWidth = 3
        //外框線條顏色
        introduceButton.layer.borderColor = UIColor(red: 228/255, green: 213/255, blue: 187/255, alpha: 0.8).cgColor
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        if resultImageView.image != nil {
            performSegue(withIdentifier: "showIntroduction", sender: sender)
            
        }
    }
    
    @IBSegueAction func showIntroductionVC(_ coder: NSCoder) -> IntroductionViewController? {
        let controller = IntroductionViewController(coder: coder)
        controller?.finalScore = finalScore
        return controller
    }
    
    
    
    
    
    
    

}
