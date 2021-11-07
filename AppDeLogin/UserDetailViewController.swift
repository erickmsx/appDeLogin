//
//  UserDetailViewController.swift
//  AppDeLogin
//
//  Created by Erick Martins on 06/11/21.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    let user: User
    init(selectedUser: User) {
        user = selectedUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = user.name
        imageView.image = user.image
    }
}
