//
//  Model.swift
//  Razas_Perros
//
//  Created by Laura Gutiérrez Ceballos on 30/5/23.
//

import UIKit

protocol ModelProtocol {
    
    func devolverDatos(datosPerros: PerroAPIResponse?)
}

struct PerroAPIResponse: Codable {
    let message: [String: [String]]
}

class Model: NSObject {
    
    var delegate: ModelProtocol?
    
    func obtenerDatosModel(){
        let urlSessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlSessionConfiguration)
        let url = URL(string: "https://dog.ceo/api/breeds/list/all")
        
        urlSession.dataTask(with: url!){data, response, error in
            print("Data \(String(describing: data))")
            print("Response \(String(describing: response))")
            print("Error \(String(describing: error))")
            
            let decoder = JSONDecoder()
            var informacionPerros: PerroAPIResponse?
            do {
                informacionPerros = try decoder.decode(PerroAPIResponse.self, from: data!)
                self.delegate?.devolverDatos(datosPerros: informacionPerros)
            } catch let e {
                print(e)
            }
        }.resume()
    }
}
