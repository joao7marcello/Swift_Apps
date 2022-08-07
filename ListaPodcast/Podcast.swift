//
//  Podcast.swift
//  ListaPodcast
//
//  Created by Student on 04/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation

class Podcast {
    
    let nomePodcast: String
    let descricaoPodcast: String
    let nomeFotoPodcast: String
    
    init(nomePodcast: String, descricaoPodcast: String, nomeFotoPodcast: String){
        self.nomePodcast = nomePodcast
        self.descricaoPodcast = descricaoPodcast
        self.nomeFotoPodcast = nomeFotoPodcast
    }
    
}

class PodcastDAO {
    
    static func getList() -> [Podcast] {
        return [
            Podcast(nomePodcast: "99 Vidas", descricaoPodcast: "No unplayed episodes", nomeFotoPodcast: "99vidas"),
            Podcast(nomePodcast: "Canal 42", descricaoPodcast: "No unplayed episodes", nomeFotoPodcast: "canal42"),
            Podcast(nomePodcast: "MM", descricaoPodcast: "No unplayed episodes", nomeFotoPodcast: "mm"),
            Podcast(nomePodcast: "Não Ouvo", descricaoPodcast: "No unplayed episodes", nomeFotoPodcast: "naoouvo"),
            Podcast(nomePodcast: "Nerdcast", descricaoPodcast: "No unplayed episodes", nomeFotoPodcast: "nerdcast"),
            Podcast(nomePodcast: "O Melhor Podcast do Brasil", descricaoPodcast: "No unplayed episodes", nomeFotoPodcast: "ompdb"),
            Podcast(nomePodcast: "RapaduraCast", descricaoPodcast: "No unplayed episodes", nomeFotoPodcast: "rapaduracast"),
            Podcast(nomePodcast: "Reloading", descricaoPodcast: "No unplayed episodes", nomeFotoPodcast: "reloading"),
            Podcast(nomePodcast: "SciCast", descricaoPodcast: "No unplayed episodes", nomeFotoPodcast: "scicast")

        ]
    }
}
