//
//  SettingsView.swift
//  App759
//
//  Created by IGOR on 11/08/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {

                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/c54c43c4-75ba-4b88-8fff-92ab32d782a0") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            VStack {
                                
                                Image(systemName: "bolt.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                    .frame(width: 60, height: 60)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                                
                                Text("Usage Policy")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 3).opacity(0.4))
                        .padding(3)
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack {
                                
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                    .frame(width: 60, height: 60)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                                
                                Text("Rate Us")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .semibold))
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 3).opacity(0.4))
                        .padding(3)
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
