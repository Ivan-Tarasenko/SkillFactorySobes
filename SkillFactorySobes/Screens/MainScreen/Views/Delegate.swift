//
//  Delegate.swift
//  SkillFactorySobes
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import UIKit

final class Delegate: NSObject, UITableViewDelegate {
    
    var onTapCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        onTapCell?(indexPath.row)
    }
}
