//
//  Controller.swift
//  Razas_Perros
//
//  Created by Laura Gutiérrez Ceballos on 30/5/23.
//

import UIKit

protocol ControllerProtocol {
    func devolverDatosVista(datosPerros: PerroAPIResponse?)
}
class Controller: NSObject {
    
    var modelObjeto = Model()
    
    var delegate: ControllerProtocol?
    
    func obtenerDatosController() {
        
        modelObjeto.delegate = self 
        modelObjeto.obtenerDatosModel()
    }
}

extension Controller: ModelProtocol {
    func devolverDatos(datosPerros: PerroAPIResponse?) {
        delegate?.devolverDatosVista(datosPerros: datosPerros)
    }
}
