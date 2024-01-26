//
//  DetailViewController.swift
//  UD2_DINT_Sergio_Alvarez_Villaverde
//
//  Created by user248192 on 20/12/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    var category: Category?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let category = category {
            nameLabel.text = category.name
            imageView.image = category.image
            descriptionLabel.text = category.description
        }
    }
}
