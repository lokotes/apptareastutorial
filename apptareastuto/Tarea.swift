//
//  Tarea.swift
//  apptareastuto
//
//  Created by MacAMP on 26/01/18.
//  Copyright © 2018 MacAMP. All rights reserved.
//

import Foundation

class Tarea{
    //var idusuario: Int
    var idtarea: Int
    var descripcion: String
    var estado: String
    
    init(_ idtarea: Int,_ descripcion: String,_ estado: String) {
        self.idtarea=idtarea
        self.descripcion=descripcion
        self.estado=estado
    }
}
