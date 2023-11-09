//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct StoryBrain {
    
    //MARK: - Properties
    
    var choiceNumber = 0 // Переменная выбора дальнейшего хода
    let story = [ Story(
        title: "Одним солнечным, осенним утром, Энн решила оставить все домашние дела, взяла любимый роман и вышла в лес для уединения. Пройдя немного вглубь леса идилия Энн была нарушена, вглубине леса сидела громкая компания подростков которая устроила пикник с барбекю.",
        cho1: "Энн не смогла пройти мимо, и сделала замечание шумной компании.", cho2: "Энн прошла мимо не сказав ни слова, но ее настроение было испорчено.", c1d: 2, c2d: 1
    ),
                  Story(
                    title: "В голове Энн крутились сомнения, правильно ли она поступила, просто пройдя мимо и промолчав.",
                    cho1: "Поразмыслив об исходе событий, Энн пришла к выводу что промолчав поступила неверно, и развернулась направившись к компании.", cho2: "Поразмыслив об исходе событий, Энн пришла к выводу что промолчав поступила верно.", c1d: 2, c2d: 3
                  ),
                  Story(
                    title: "Её замечание было достаточно тактичным, а тон был вежливым.",
                    cho1: "Просьба заключалась в том, чтобы компания вела себя тише и убрала за собой.", cho2: "Энн поделилась своими ожиданиями от этой прогулки, и попросила дать ей насладиться атмосферой осеннего леса.", c1d: 5, c2d: 4
                  ),
                  Story(
                    title: "Энн решила уйти в лес глубже, где шумная компания не мешала ей наслаждаться солнечным, осенним утром.",
                    cho1: "Ко", cho2: "нец", c1d: 0, c2d: 0
                  ),
                  Story(
                    title: "Замечание было принято в штыки, Энн развернулась и ушла.",
                    cho1: "Ко", cho2: "нец", c1d: 0, c2d: 0
                  ),
                  Story(
                    title: "Компания услышала просьбу Энн и прислушалась.",
                    cho1: "Ко", cho2: "нец", c1d: 0, c2d: 0
                  )
    ]
    
    //MARK: - Logic methods
    
    mutating func nextStory(userChoice: String) {
        if userChoice == story[choiceNumber].choice1 {
            choiceNumber = story[self.choiceNumber].choice1Destination
            
        } else {
            choiceNumber = story[self.choiceNumber].choice2Destination
        }
    }
    
   mutating func setTitles() -> [String] {
       var butTitles = [String]()
       butTitles.append(story[self.choiceNumber].choice1)
       butTitles.append(story[self.choiceNumber].choice2)
       return butTitles
    }
    
    mutating func setLabel() -> String {
        let label = story[choiceNumber].title
        return label
    }
    
    
}
