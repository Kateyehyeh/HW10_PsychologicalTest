//
//  TestViewController.swift
//  HW10_PsychologicalTest
//
//  Created by Kate Yeh on 2025/5/25.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var optionsButtons: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    
    var index = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgImageView = UIImageView(frame: view.bounds)
        bgImageView.image = UIImage(named: "background")
        bgImageView.contentMode = .scaleToFill
        bgImageView.alpha = 0.7
        //把bgImageView插入到最底層
        view.insertSubview(bgImageView, at: 0)
        
        updateUI()
    }
    
    func updateUI(){
        setQNLabelStyle(questionNumberLabel)
        
        let questionData = questions[index]
        questionLabel.text = questionData.questions
        setQLabelStyle(questionLabel)
        
        
        for (index, option) in optionsButtons.enumerated() {
            setOptionsStyle(option)
            //設定選項文字
            option.setTitle(questionData.options[index], for: .normal)
            option.isEnabled = true
            
        }
        
        setNextButtonStyle(nextButton)
    }
    
    func setQNLabelStyle(_ questionNumberLabel: UILabel){
        questionNumberLabel.text = "第\(index+1)題"
        questionNumberLabel.font = UIFont(name: "Helvetica Bold", size: 25)
        questionNumberLabel.textColor = .black
        questionNumberLabel.textAlignment = .center
        questionNumberLabel.backgroundColor = .clear
        questionNumberLabel.layer.cornerRadius = 10
        questionNumberLabel.layer.masksToBounds = true
    }
    
    func setQLabelStyle(_ questionLabel: UILabel){
        questionLabel.numberOfLines = 0
        questionLabel.lineBreakMode = .byWordWrapping
        questionLabel.font = UIFont(name: "Helvetica Bold", size: 25)
        questionLabel.textColor = .black
        questionLabel.textAlignment = .natural
        questionLabel.backgroundColor = UIColor(red: 228/255, green: 213/255, blue: 187/255, alpha: 0.8)
        questionLabel.layer.cornerRadius = 10
        questionLabel.layer.masksToBounds = true
    }
    
    
    func setOptionsStyle(_ optionsButtons: UIButton){
        optionsButtons.configuration = nil
        optionsButtons.setTitle("開始", for: .normal)
        optionsButtons.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        optionsButtons.setTitleColor(.black, for: .normal)
        optionsButtons.backgroundColor = UIColor(red: 254/255, green: 249/255, blue: 231/255, alpha: 1)
        optionsButtons.layer.cornerRadius = 20
        //外框線條寬度
        optionsButtons.layer.borderWidth = 2
        //外框線條顏色
        optionsButtons.layer.borderColor = UIColor(red: 192/255, green: 182/255, blue: 160/255, alpha: 1).cgColor
        optionsButtons.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    

    func setNextButtonStyle(_ nextButton: UIButton){
        nextButton.configuration = nil
        nextButton.setTitle("下一題", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = UIColor(red: 210/255, green: 134/255, blue: 136/255, alpha: 0.85)
        nextButton.layer.cornerRadius = 20
        //外框線條寬度
        nextButton.layer.borderWidth = 3
        //外框線條顏色
        nextButton.layer.borderColor = UIColor(red: 228/255, green: 213/255, blue: 187/255, alpha: 0.8).cgColor
    }
    
    @IBAction func tapOptionsButton(_ sender: UIButton) {
        guard let selectedIndex = optionsButtons.firstIndex(of: sender) else { return }
        
        for (i ,option) in optionsButtons.enumerated(){
            option.isEnabled = false
            if i == selectedIndex {
                 option.backgroundColor = UIColor(red: 202/255, green: 215/255, blue: 236/255, alpha: 1)
             }
         }
       
        switch selectedIndex {
        case 0:
            score += 1
        case 1:
            score += 2
        case 2:
            score += 3
        default:
            score += 4
        }
        
       
    }
    
    @IBAction func tapNextButton(_ sender: Any) {
        //如果目前是最後一題，就跳到結果頁面
        if index == questions.count - 1 {
            showResultPage()
        //反之如果還有題目，題號+1，然後更新畫面顯示新題目
        }else{
            index += 1
            updateUI()
        }
        
        //如果是最後一題，按鈕文字改成Score，點擊後顯示成績
        if index == questions.count - 1 {
            nextButton.setTitle("看結果", for: .normal)
        //反之如果還沒最後一題，維持按鈕文字Next
        }else{
            nextButton.setTitle("下一題", for: .normal)
        }
        
    }
    
    //performSegue搭配prepare
    func showResultPage(){
        performSegue(withIdentifier: "toResultVC", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            if let resultVC = segue.destination as? ResultViewController {
                resultVC.finalScore = score
            }
        }
    }
}
                                  
