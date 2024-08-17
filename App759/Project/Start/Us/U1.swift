//
//  U1.swift
//  App759
//
//  Created by IGOR on 11/08/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    
            }
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 39) {
                    
                    Text("Play and win with us")
                        .foregroundColor(.black)
                        .font(.system(size: 29, weight: .bold))
                    
                    HStack {
                        
                        Spacer()
                        
                        Circle()
                            .fill(.gray.opacity(0.3))
                            .frame(width: 10)
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 10)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            Reviews()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 140, height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 220)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    U1()
}
