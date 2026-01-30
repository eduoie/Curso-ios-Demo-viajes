//
//  VistaDetalleDestino.swift
//  Curso-ios-Demo-viajes
//
//  Created by Equipo 2 on 29/1/26.
//

import SwiftUI

struct VistaDetalleDestino: View {
    @Binding var destino: Destino
    
    @State private var escalaCorazon: CGFloat = 1.0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ZStack(alignment: .bottomTrailing) {
                    Rectangle()
                        .fill(destino.color.gradient)
                        .frame(height: 200)
                    
                    // MARK: Botón corazón
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            destino.esFavorito.toggle()
                        }
                        
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0)) {
                            escalaCorazon = 1.4
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)) {
                                escalaCorazon = 1.0
                            }
                        }
                        
                    } label: {
                        Image(systemName: destino.esFavorito ? "heart.fill" : "heart")
                            .font(.largeTitle)
                            .foregroundStyle(destino.esFavorito ? .red : .white)
                            .scaleEffect(escalaCorazon)
                            .padding()
                            .background(.thinMaterial)
                            .clipShape(Circle())
                            .padding()
                    }
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(destino.nombre)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(destino.descripcion)
                        .font(.body)
                    
                    Divider()
                    
                    VistaPuntuacion(puntuacion: $destino.puntuacion)
                }
                .padding()
            }
        }
    }
}

struct VistaPuntuacion: View {
    @Binding var puntuacion: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Tu valoración:")
                    .font(.headline)
                
                Spacer()
                
                if puntuacion > 0 {
                    Button("Borrar") {
                        let esperaEntreEstrellas = 0.2 // (en segundos)
                        let totalEstrellas = puntuacion
                        for i in 0..<totalEstrellas {
                            let retardo = Double(i) * esperaEntreEstrellas
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + retardo) {
                                withAnimation {
                                    puntuacion -= 1
                                }
                            }
                        }
                    }
                    .font(.caption)
                    .foregroundStyle(.red)
                }
            }
            
            // MARK: Estrellitas de puntuación
            HStack {
                ForEach(1...5, id: \.self) { numero in
                    Image(systemName: numero <= puntuacion ? "star.fill" : "star")
                        .foregroundStyle(numero <= puntuacion ? .yellow : .gray.opacity(0.3))
                        .font(.title2)
                        .contentTransition(.symbolEffect(.replace))
                        .onTapGesture {
                            puntuacion = numero
                        }
                }
            }
        }
    }
}



#Preview {
    @Previewable @State var destino = Destino(nombre: "New York", icono: "building.2", descripcion: "No está mal, pero hay muchas ratas...", color: .brown, puntuacion: 2)
    
    VistaDetalleDestino(destino: $destino)
}
