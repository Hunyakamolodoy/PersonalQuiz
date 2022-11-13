//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        definitionLabel.text = "nice"
        calculateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
// MARK: - Private Methods
    private func calculateResult() {
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        
        for chosen in answersChosen {
            switch chosen.animal {
            case .dog:
                dog += 1
            case .cat:
                cat += 1
            case .rabbit:
                rabbit += 1
            case .turtle:
                turtle += 1
            }
        }
        
        if dog >= cat && dog >= rabbit && dog >= turtle {
            showResultsInLabels(animal: Animal.dog.rawValue, definition: Animal.dog.definition)
        } else if cat >= dog && cat >= rabbit && cat >= turtle {
            showResultsInLabels(animal: Animal.cat.rawValue, definition: Animal.cat.definition)
        } else if rabbit >= dog && rabbit >= cat && rabbit >= turtle {
            showResultsInLabels(animal: Animal.rabbit.rawValue, definition: Animal.rabbit.definition)
        } else if turtle >= cat && turtle >= rabbit && turtle >= dog {
            showResultsInLabels(animal: Animal.turtle.rawValue, definition: Animal.turtle.definition)
        }
//        else {
//            showResultsInLabels(animal: "🙁", definition: "Что-то пошло не так, тест не смог определить ваше животное")
//        }
    }
    
    
    private func showResultsInLabels(animal: Character, definition: String) {
        mainLabel.text = "Вы - \(animal)"
        definitionLabel.text = definition
    }
}
