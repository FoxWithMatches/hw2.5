//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var emojiAnimal: UILabel!
    @IBOutlet var descriptionAnimal: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        getAnimal()
        
    }
    
        private func getAnimal() {
            var getCountAnimal: [AnimalType: Int] = [:]
            let animals = answers.map { $0.type }
            
            animals.forEach{
                if let animalCount = getCountAnimal[$0] {
                    getCountAnimal.updateValue(animalCount + 1, forKey: $0)
                } else {
                    getCountAnimal[$0] = 1
                }
            }
            
            let sortedAnimal = getCountAnimal.sorted {$0.value > $1.value }
            guard let myAnimal = sortedAnimal.first?.key else { return }

            updateUI(with: myAnimal)
        }

    private func updateUI (with animal: AnimalType) {
             emojiAnimal.text = "Вы - \(animal.rawValue)!"
             descriptionAnimal.text = animal.definition
         }
}
   
