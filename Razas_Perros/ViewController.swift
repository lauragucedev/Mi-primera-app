//
//  ViewController.swift
//  Razas_Perros
//
//  Created by Laura Gutiérrez Ceballos on 9/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayPerros: [String] = []

    @IBOutlet weak var perros_General: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perros_General.delegate = self
        perros_General.dataSource = self
    }

}
extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
