//
//  DataSource.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import UIKit

final class DataSource: NSObject, UITableViewDataSource {
    
    var allCharacters: [Characters]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell else { fatalError("Cell nil") }
        
        let character = allCharacters[indexPath.row]
        
        cell.setName(character.name)
        cell.setImage(url: character.image)
        
        return cell
    }
}
