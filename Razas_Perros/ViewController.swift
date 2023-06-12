//
//  ViewController.swift
//  Razas_Perros
//
//  Created by Laura Gutiérrez Ceballos on 9/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    var controllerObjeto = Controller()
    func obtenerDatosView() {
        controllerObjeto.obtenerDatosController()
    }
    
    var arrayPerros: [String] = []
    
    @IBOutlet weak var perros_General: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtenerDatosView()
        
        controllerObjeto.delegate=self 
        
        perros_General.delegate = self
        perros_General.dataSource = self
        
    }
    
    
    /*guard let informacionPerros = informacionPerros else { return }
     self.arrayPerros = Array(informacionPerros.message.keys)
     
     DispatchQueue.main.async {
     print(self.arrayPerros)
     self.perros_General.reloadData()
     }
     
     }.resume() */
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPerros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard var celda: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "celdaPerros") else { return UITableViewCell() }
        
        var content = celda.defaultContentConfiguration()
        content.text = arrayPerros[indexPath.row]
        celda.contentConfiguration = content
        
        return celda
    }
    
}

extension ViewController:ControllerProtocol {
    func devolverDatosVista(datosPerros: PerroAPIResponse?) {
        guard let datos=datosPerros else {return}
        arrayPerros=Array(datos.message.keys)
        DispatchQueue.main.async {
            self.perros_General.reloadData()
        }
        
    }
    
}
