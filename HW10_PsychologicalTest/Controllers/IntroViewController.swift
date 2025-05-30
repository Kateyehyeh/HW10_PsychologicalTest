//
//  IntroViewController.swift
//  HW10_PsychologicalTest
//
//  Created by Kate Yeh on 2025/5/25.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImageView = UIImageView(frame: view.bounds)
        bgImageView.image = UIImage(named: "background")
        bgImageView.contentMode = .scaleToFill
        //把bgImageView插入到最底層
        view.insertSubview(bgImageView, at: 0)
        
        
        titleLabel.text = "你是哪一種職場邪教生物？"
        titleLabel.font = UIFont(name: "Helvetica Bold", size: 50)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.backgroundColor = UIColor(red: 228/255, green: 213/255, blue: 187/255, alpha: 0.5)
        titleLabel.layer.cornerRadius = 10
        //裁切超出邊界(圓角外)的內容
        titleLabel.clipsToBounds = true
        
        
        subtitleLabel.text = "加班是日常修煉、拖延到最後一刻才是真正的教義、準時下班被視為叛徒？五道荒謬又真實的心理測驗，揭露你是哪一派職場邪教生物！"
        subtitleLabel.font = UIFont(name: "Helvetica", size: 60)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.backgroundColor = UIColor(red: 228/255, green: 213/255, blue: 187/255, alpha: 0.5)
        subtitleLabel.layer.cornerRadius = 10
        //裁切超出邊界(圓角外)的內容
        subtitleLabel.clipsToBounds = true
        
        startButton.configuration = nil
        startButton.setTitle("START", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 35)
        startButton.setTitleColor(.black, for: .normal)
        startButton.backgroundColor = UIColor(red: 254/255, green: 249/255, blue: 231/255, alpha: 1)
        startButton.layer.cornerRadius = 20
        //外框線條寬度
        startButton.layer.borderWidth = 2
        //外框線條顏色
        startButton.layer.borderColor = UIColor(red: 192/255, green: 182/255, blue: 160/255, alpha: 1).cgColor
       
    }
    
    
    @IBAction func tappedButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let testVC = storyboard.instantiateViewController(withIdentifier: "TestViewController")
        present(testVC, animated: true)
    }
    
}
