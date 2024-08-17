//
//  BuildsView.swift
//  App759
//
//  Created by IGOR on 11/08/2024.
//

import SwiftUI

struct BuildsView: View {
    
    @StateObject var viewModel = BuildsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                
                Text("My Builds")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 9)
                
                HStack {
                    
                    HStack {
                        
                        Text("10")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("Builds")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                    
                    HStack {
                        
                        Image("Puzzle")
                        
                        Text("Accessories")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                }
                .padding(.vertical)
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                    
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.currentType = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                            })
                            .padding(4)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(viewModel.currentType == index ? 1 : 0)))
                        }
                    }
                }
                .padding(2)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.3)))

                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.builds.filter{($0.buType ?? "") == viewModel.currentType}, id: \.self) { index in
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(index.buName ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                
                                Text(index.buDescr ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                HStack {
                                    
                                    Text("Cost")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text("\(index.buName ?? "") $")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: .medium))
                                }
                                
                                Image(index.buPhoto ?? "")
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                    .overlay(
                                    
                                        VStack {
                                            
                                            Spacer()
                                            
                                            Text(index.buDate ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 10, weight: .regular))
                                                .padding(4)
                                                .padding(.horizontal, 5)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
                                            .padding(5)
                                    )
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 3).opacity(0.3))
                            .padding(3)
                        })
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddBuild(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchBuilds()
        }
    }
}

#Preview {
    BuildsView()
}
