//
//  Destino.swift
//  Curso-ios-Demo-viajes
//
//  Created by Equipo 2 on 29/1/26.
//

import SwiftUI

struct Destino: Identifiable {
    let id = UUID()
    let nombre: String
    let icono: String
    let descripcion: String
    let color: Color
    var esFavorito: Bool = false
    var puntuacion: Int = 0
}
