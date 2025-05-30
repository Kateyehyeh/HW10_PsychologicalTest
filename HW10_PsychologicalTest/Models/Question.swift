//
//  Question.swift
//  HW10_PsychologicalTest
//
//  Created by Kate Yeh on 2025/5/25.
//

enum RoleType{
    case hedgehog
    case seal
    case turtle
    case fox
}


struct Questions{
    var questions:String
    var options:[String]
    var roleType:[RoleType]  //每個選項對應一個角色
}

let questions:[Questions] = [
    Questions(questions: "週一早上你看到主管傳訊息說“有空聊一下嗎？”你會？",
              options: [" 馬上回「當然！請問有什麼我可以協助的？」 ",
                        " 裝沒看到，等他打電話來 ",
                        " 開始腦內模擬八種死亡劇本 ",
                        " 回「沒空」 "],
              roleType:[.hedgehog,
                        .seal,
                        .turtle,
                        .fox]),
    Questions(questions: "你在會議裡最常扮演的角色是？",
              options: [" 熱情發言，嘴裡一直冒出關鍵字 ",
                        " 微笑點頭，靈魂已飄出體外 ",
                        " 拍照記錄，還要快速幫大家整理結論 ",
                        " 假裝筆記，其實在想等下晚餐要吃什麼 "],
              roleType:[.hedgehog,
                        .seal,
                        .turtle,
                        .fox]),
    Questions(questions: "遇到緊急案子時你會怎麼辦？",
              options: [" 立刻打開檔案資料開戰 ",
                        " 默默做完，然後消失 ",
                        " 去找主管說：「這真的緊急嗎？」 ",
                        " 拖到Deadline最後一天，用肝換成果 "],
              roleType:[.hedgehog,
                        .seal,
                        .turtle,
                        .fox]),
    Questions(questions: "你對 KPI 的看法是？",
              options: [" KPI 是我人生的命脈 ",
                        " KPI 是別人的事，我只來上班 ",
                        " KPI 是我受虐的理由，但我還是做 ",
                        " KPI 是詛咒術語，壓榨我們的工具 "],
              roleType:[.hedgehog,
                        .seal,
                        .turtle,
                        .fox]),
    Questions(questions: "下班後你最常做什麼？",
              options: [" 自學第二專長，希望早日升職跳槽 ",
                        " 躺著滑手機，原地發霉 ",
                        " 傳訊息問誰還沒下班，一起抱團哭一波 ",
                        " 跟朋友吐槽公司笑到哭 "],
              roleType:[.hedgehog,
                        .seal,
                        .turtle,
                        .fox]),
]
