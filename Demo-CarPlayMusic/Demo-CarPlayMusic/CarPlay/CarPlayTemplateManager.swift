//
//  CarPlayTemplateManager.swift
//  Demo-CarPlayMusic
//
//  Created by Kumar Saurav on 11/08/23.
//

import Foundation
import CarPlay

class CarPlayTemplateManager {
    var interfaceController: CPInterfaceController?
    var songs: [Song]?
    var tabBarTemplate: CPTabBarTemplate?
    
    public func connect(_ interfaceController: CPInterfaceController) {
        self.interfaceController = interfaceController

        interfaceController.setRootTemplate(
            self.rootTemplate(),
            animated: true,
            completion: nil)
    }

    public func disconnect() {
        self.interfaceController = nil
    }
    
    // MARK: - Private helpers
    
    private func rootTemplate() -> CPTemplate {
        let tabBarTemplate = CPTabBarTemplate(templates: self.tabBars())
        self.tabBarTemplate = tabBarTemplate
        
        return tabBarTemplate
    }
    
    // Generate array of CPTemplate objects for different Tabs.
    private func tabBars() -> [CPTemplate] {
        return [
           self.songsListTemplate(),
           self.artistsListTemplate(),
           self.genresGridTemplate(),
       ]
    }
        
    // Generate a CPListTemplate for displaying a list of songs.
    private func songsListTemplate() -> CPListTemplate {
        var listItems = [CPListItem]()
        
        // Use default list of songs data and create a list
        // of CPListItems from the default songs.
        var defaultListItems: [CPListItem] = []
        for song in MusicStructureHelpers.defaultSongs() {
            defaultListItems.append(
                CPListItem(
                    text: song.title,
                    detailText: song.artist.name
                )
            )
        }
        listItems.append(contentsOf: defaultListItems)
        
        // Set a handler to handle selection.
        for listItem in listItems {
            listItem.handler = { item, completion in
                print("\(String(describing: item.text)) - selected.")
            }
        }
        
        // Create a CPListSection using the list items array
        // created above.
        let listSection = CPListSection(items: listItems)
        
        // Create the list template and set tab image icon.
        let songsListTemplate = CPListTemplate(
            title: "Songs",
            sections: [ listSection ]
        )
        songsListTemplate.tabImage = UIImage(
            systemName: "music.house"
        )
        
        return songsListTemplate
    }

    private func artistsListTemplate() -> CPListTemplate {
        // Create CPListItem objects for each artist
        let listItem1 = CPListItem(text: "Bruno Mars", detailText: "")
        let listItem2 = CPListItem(text: "Calvin Harris", detailText: "")
        let listItem3 = CPListItem(text: "Coldplay", detailText: "")
        let listItem4 = CPListItem(text: "Eminem", detailText: "")

        let listItems = [ listItem1, listItem2, listItem3, listItem4, ]
        
        // Configure a handler for each CPListItem to be executed
        // when the item is selected
        for listItem in listItems {
            listItem.handler = { item, completion in
                // Extract the artist's name from the selected item
                guard let artistName = item.text else { return }
                print("\(artistName) - Fetch started.")
            }
        }
        
        // Create a CPListSection using the list of CPListItem objects
        let listSection = CPListSection(items: listItems)
        // Create a CPListTemplate with a title and the list section
        let artistsListTemplate = CPListTemplate(title: "Artists", sections: [ listSection ])
        // Set an image for the tab associated with this template
        artistsListTemplate.tabImage = UIImage(systemName: "music.mic")

        return artistsListTemplate
    }


    // Generate a grid template for displaying a grid of genres.
    private func genresGridTemplate() -> CPGridTemplate {
        // Set up a handler, will be used for every grid button.
        let handler: (CPGridButton) -> Void = { (button) in
            print(
                """
                \(String(describing: button.titleVariants.first))
                grid button tapped.
                """
            )
        }
        
        // Create grid button for each genre, providing
        // title, image and handler.
        let popGridItem = CPGridButton(
            titleVariants: ["Pop"],
            image: #imageLiteral(resourceName: "Pop_Genre"),
            handler: handler
        )
        let rockGridItem = CPGridButton(
            titleVariants: ["Rock"],
            image: #imageLiteral(resourceName: "Rock_Genre"),
            handler: handler
        )
        
        // Create the grid template using the grid buttons
        // created and set the tab image for the template.
        let genresGridTemplate = CPGridTemplate(
            title: "Genres",
            gridButtons: [
                popGridItem,
                rockGridItem,
            ]
        )
        genresGridTemplate.tabImage = UIImage(
            systemName: "tv.music.note"
        )
        
        return genresGridTemplate
    }
}

