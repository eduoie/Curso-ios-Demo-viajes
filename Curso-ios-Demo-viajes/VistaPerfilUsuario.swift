//
//  VistaPerfilUsuario.swift
//  Curso-ios-Demo-viajes
//
//  Created by Equipo 2 on 29/1/26.
//

import SwiftUI

struct VistaPerfilUsuario: View {
    @Binding var nombreUsuario: String
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        Form {
            Section("Datos personales") {
                Text("Edita tu nombre aquí")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                TextField("Tu nombre", text: $nombreUsuario)
                    .font(.headline)
                    .foregroundStyle(.blue)
            }
            
            Section("Estadísticas") {
                Label("Viajando desde 2024", systemImage: "calendar")
                Label("Nivel: Explorador", systemImage: "medal.fill")
            }
        }
        .navigationTitle("Editar Perfil")
        // Si el alto es 'Regular' (iPhone en vertical) -> Scroll desactivado
        // Si el alto es 'Compact' (iPhone en horizontal) -> Scroll activado
        .scrollDisabled(verticalSizeClass == .regular)

    }
}

#Preview {
    VistaPerfilUsuario(nombreUsuario: .constant("Pepe"))
    
    // Para hacer que el Canvas de previsualización sea interactivo con variables de estado
//    @Previewable @State var nombreUsuario = "Paco"
//    VistaPerfilUsuario(nombreUsuario: $nombreUsuario)
    
}
