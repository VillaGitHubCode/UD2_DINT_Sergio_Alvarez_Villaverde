//
//  MainViewController.swift
//  UD2_DINT_Sergio_Alvarez_Villaverde
//
//  Created by user248192 on 19/12/23.
//

import UIKit

struct Category {
    let name: String
    let image: UIImage
    let description: String
}
extension Category {
    static func sampleData() -> [Category] {
        return [
            Category(name: "Comida española", image: UIImage(named: "ComidaEspañola")!, description: "La comida española es conocida por su diversidad y riqueza gastronómica, influenciada por la variedad geográfica y cultural del país. Entre sus platos más emblemáticos se encuentran la paella, una sabrosa mezcla de arroz, mariscos y carnes; las tapas, pequeñas porciones de diferentes platillos que se comparten entre amigos; el gazpacho, una refrescante sopa fría de tomate; y el jamón ibérico, un exquisito embutido curado. Además, el aceite de oliva, el ajo y las especias son ingredientes comunes que realzan los sabores auténticos de la comida española."),
            Category(name: "Comida italiana", image: UIImage(named: "ComidaItaliana")!, description: "La cocina italiana es apreciada a nivel mundial por su simplicidad, calidad de ingredientes y sabores intensos. Caracterizada por su enfoque en productos frescos y locales, la gastronomía italiana ha creado algunos de los platos más icónicos y amados. La pasta, en sus diversas formas y acompañada de una variedad de salsas, es un pilar fundamental de la dieta italiana. La pizza, con sus delgadas bases crujientes y variadas coberturas, también es mundialmente famosa."),
            Category(name: "Comida mexicana", image: UIImage(named: "ComidaMexicana")!, description: "La cocina mexicana es vibrante, colorida y rica en sabores, fusionando ingredientes autóctonos con técnicas culinarias tradicionales. La gastronomía mexicana ha sido reconocida como Patrimonio Cultural Inmaterial de la Humanidad por la UNESCO, destacando la importancia cultural y diversidad de sus platillos."),
            Category(name: "Comida china", image: UIImage(named: "ComidaChina")!, description: "La cocina china es una de las más antiguas y variadas del mundo, con una rica tradición que se remonta a miles de años. Caracterizada por la diversidad de sabores, ingredientes frescos y una cuidadosa preparación, la gastronomía china ha influido en muchas otras cocinas asiáticas."),
            Category(name: "Comida japonesa", image: UIImage(named: "ComidaJaponesa")!, description: "Uno de los aspectos más destacados de la cocina japonesa es la presentación artística de los platillos, que refleja la estética japonesa conocida como wabi-sabi, que valora la belleza en la simplicidad y lo natural. Además, la cocina japonesa se centra en resaltar los sabores originales de los ingredientes, utilizando técnicas de cocción como el sushi, el sashimi, el tempura y el yakitori."),
        ]
    }
}
class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var foodTable: UITableView!
    
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = Category.sampleData()

        foodTable.dataSource = self
        foodTable.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let category = categories[indexPath.row]
        cell.imageView?.image = category.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedCategory = categories[indexPath.row]
            showDetailScreen(for: selectedCategory)
        }
    
    func showDetailScreen(for category: Category) {
           if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
               detailViewController.category = category
               navigationController?.pushViewController(detailViewController, animated: true)
           }
       }
    

}

