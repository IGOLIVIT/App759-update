//
//  AddAcc.swift
//  App759
//
//  Created by IGOR on 11/08/2024.
//

import SwiftUI

struct AddAcc: View {

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
                        
                        viewModel.moneyAc += Int(viewModel.accCost) ?? 0
                        
                        viewModel.accName.append(viewModel.accName)

                        viewModel.accPhoto = viewModel.currentAccPhoto
                        
                        viewModel.accType = viewModel.currentAccType
                        
                        viewModel.addAccessory()
                        
                        viewModel.accName = ""
                        viewModel.accQuan = ""
                        viewModel.accCost = ""
                        viewModel.currentAccPhoto = ""
                        viewModel.currentAccType = ""
                        
                        viewModel.fetchAccessories()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddAcc = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    })
                    .opacity(viewModel.accName.isEmpty || viewModel.accQuan.isEmpty || viewModel.accCost.isEmpty || viewModel.currentAccType.isEmpty || viewModel.currentAccPhoto.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.accName.isEmpty || viewModel.accQuan.isEmpty || viewModel.accCost.isEmpty || viewModel.currentAccType.isEmpty || viewModel.currentAccPhoto.isEmpty ? true : false)
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.AccPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentAccPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentAccPhoto.isEmpty {
                                
                                VStack(spacing: 20) {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 20, weight: .regular))
                                 
                                    Text("Add image")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .medium))
                                }
                                .padding()
                                .frame(width: 170, height: 170)
                                
                            } else {
                                
                                Image(viewModel.currentAccPhoto)
                                    .resizable()
                                    .frame(width: 170, height: 170)

                            }
                            
                        })
                        .padding(.bottom)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(viewModel.accTypes, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentAccType = index
                                        
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
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.accName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.accName)
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
                                
                                Text("Quantity")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.accQuan.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.accQuan)
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
                                        .opacity(viewModel.accCost.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.accCost)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                .padding(1)
                                
                            }
                            
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddAcc(viewModel: BuildsViewModel())
}
