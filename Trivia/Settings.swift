//
//  Settings.swift
//  Trivia
//
//  Created by Michael on 25/06/2024.
//

import Foundation

struct Settings {
    var category: Category
    var difficulty: Difficulty
}

enum Category: String, CaseIterable {
    case all = "All"
    case animals = "Animals"
    case art = "Art"
    case generalKnowledge = "General Knowledge"
    case geography = "Geography"
    case history = "History"
    case entertainmentBooks = "Entertainment: Books"
    case entertainmentMusic = "Entertainment: Music"
    case entertainmentJapanesAnimeAndManaga = "Entertainment: Japanese Anime & Manga"
    case entertainmentFilm = "Entertainment: Film"
    case entertainmentComics = "Entertainment: Comics"
    case entertainmentMusicalsAndTheatres = "Entertainment: Musicals & Theatres"
    case entertainmentVideoGames = "Entertainment: Video Games"
    case scienceGadgets = "Science: Gadgets"
    case scienceAndNature = "Science & Nature"
    case scienceMathematics = "Science: Mathematics"
    case politics = "Pollitics"

    var numericCode: Int {
        switch self {
        case .all:
            return 0
        case .animals:
            return 27
        case .art:
            return 25
        case .generalKnowledge:
            return 9
        case .geography:
            return 22
        case .history:
            return 23
        case .entertainmentBooks:
            return 10
        case .entertainmentMusic:
            return 12
        case .entertainmentJapanesAnimeAndManaga:
            return 31
        case .entertainmentFilm:
            return 11
        case .entertainmentComics:
            return 29
        case .entertainmentMusicalsAndTheatres:
            return 13
        case .entertainmentVideoGames:
            return 15
        case .scienceGadgets:
            return 30
        case .scienceAndNature:
            return 17
        case .scienceMathematics:
            return 19
        case .politics:
            return 24
        }

    }
}

enum Difficulty: String, CaseIterable {
    case all = "all"
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"
}
