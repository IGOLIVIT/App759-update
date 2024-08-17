//
//  AddBuild.swift
//  App759
//
//  Created by IGOR on 11/08/2024.
//

import SwiftUI

struct AddBuild: View {

    @StateObject var viewModel: BuildsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {

                        viewModel.buPhoto = viewModel.currentPhoto
                        viewModel.buType = viewModel.currentType
                        viewModel.buAcc = viewModel.AccNameForAdd
                        
                        viewModel.addBuild()
                        
                        viewModel.buName = ""
                        viewModel.buDescr = ""
                        viewModel.buCost = ""
                        viewModel.currentPhoto = ""
                        viewModel.buDate = ""
                        viewModel.buCost = ""
                        viewModel.AccNameForAdd = ""
                        
                        viewModel.fetchBuilds()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    })

                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 70, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                    
                                
                            } else {
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                   
                            }
                            
                        })
                        .padding(.bottom)
                        
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
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.buName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.buName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                            .padding(1)
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Description")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.buDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.buDescr)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                            .padding(1)
                            
                        }
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Text("Date")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.buDate.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.buDate)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                .padding(1)
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Text("Cost")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.buCost.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.buCost)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                .padding(1)
                                
                            }
                            
                        }
                        
                        HStack {
                            
                            Text("Accessories")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical)
                            
                            Spacer()
                         
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddAddedAcc = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                    .padding(4)
                                    .background(Circle().fill(Color("prim")))
                            })
                        }
                        
                        VStack(spacing: 10) {
                            
                            ForEach(viewModel.AddeAccessories, id: \.self) { index in
                                
                                HStack {
                                    
                                    Image(index.acPhoto ?? "")
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .padding(1)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(index.acName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(3)

                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                                                
            
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchAddedAccessories()
        }
        .sheet(isPresented: $viewModel.isAddAddedAcc, content: {
            
            AddAccess(viewModel: viewModel)
        })
    }
}

#Preview {
    AddBuild(viewModel: BuildsViewModel())
}
