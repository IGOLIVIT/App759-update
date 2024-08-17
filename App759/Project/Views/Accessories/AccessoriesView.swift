//
//  AccessoriesView.swift
//  App759
//
//  Created by IGOR on 11/08/2024.
//

import SwiftUI

struct AccessoriesView: View {
    
    @StateObject var viewModel = BuildsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Accessories")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 9)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.accTypes, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentAccType = index
                                viewModel.fetchAccessories()
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .medium))
                                    .padding()
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(viewModel.currentAccType == index ? 1 : 0)))
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .gray.opacity(0.3), radius: 3))
                                    .padding(4)
                            })
                        }
                        
                    }
                }
                
                HStack {
                    
                    HStack {
                        
                        Text("\(viewModel.moneyAc)")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("$")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.4), radius: 3))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddAcc = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding()
                            .background(Circle().fill(Color("prim")))
                    })
                }
                .padding(.vertical)
                
                if viewModel.accessories.isEmpty {
                    
                    VStack(spacing: 17) {
                        
                        Image("folder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        
                        Text("You haven't added any entries")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 3))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false ) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.accessories.filter{($0.accType ?? "") == viewModel.currentAccType}, id: \.self) { index in
                            
                                VStack(spacing: 13) {
                                    
                                    Image(index.accPhoto ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity)
                                    
                                    Text(index.accName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                    HStack {
                                        
                                        Text("Quantity")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.accQuan ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                    }
                                    
                                    HStack {
                                        
                                        Text("Cost")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("\(index.accCost ?? "") $")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.3), radius: 3))
                                .padding(3)
                            }
                        })
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddAcc, content: {
            
            AddAcc(viewModel: viewModel)
        })
    }
}

#Preview {
    AccessoriesView()
}
