//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var dog = AnimalType.dog
    var cat = AnimalType.cat
    var rabbit = AnimalType.rabbit
    var turtle = AnimalType.turtle
    
    // 1. Передать массив с ответами на этот экран
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки back
    
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var aboutPetLabel: UILabel!
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        let animalResult = calculatPets()
        emojiLabel.text = "Вы - " + String(animalResult.rawValue)
        aboutPetLabel.text = animalResult.definition
    }

    func calculatPets() -> AnimalType {
        var counts: [AnimalType : Int] = [:]
        for answer in answers {
            counts[answer.type] = (counts[answer.type] ?? 0) + 1
        }
        let result = counts.sorted(by: { $0.value > $1.value})
        return result.first!.key
    }
}
