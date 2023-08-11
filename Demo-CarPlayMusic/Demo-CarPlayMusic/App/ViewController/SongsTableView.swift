//
//  SongsTableView.swift
//  Demo-CarPlayMusic
//
//  Created by Kumar Saurav on 11/08/23.
//

import Foundation
import UIKit

class SongsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var songsList: [Song] = []
    
    override var numberOfSections: Int {
        return 1
    }
    
    init() {
        super.init(frame: CGRectZero,style: .plain)
        
        self.register(
            UITableViewCell.self,
            forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self)
        )
        
        self.dataSource = self  // `dataSource` is a weak var so won't create retain cycle.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateTableView(songsList: [Song]) {
        self.songsList = songsList
        self.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.songsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(
            withIdentifier: NSStringFromClass(UITableViewCell.self),
            for: indexPath
        )

        var content = cell.defaultContentConfiguration()
        let song = self.songsList[indexPath.row]
        content.text = song.title
        cell.contentConfiguration = content
        
        return cell
    }
}
