//
//  LandmarksPage.swift
//  LocalLens
//
//  Created by Scholar on 8/12/25.
//

import SwiftUI

struct LandmarksPage: View {
    var body: some View {
        ZStack{
            Color("GreenYellow")
                .ignoresSafeArea()
            
            
            VStack(spacing: 0){ //VStack for fixed header and scroll content
                VStack {
                    Text("Landmarks")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top, 75.0)
                
                
                HStack {
                    Button("Touristy") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.asparagus)
                    .padding()
                    .foregroundColor(.white)
                    
                    Button("Local") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.asparagus)
                    .padding()
                    .foregroundColor(.white)
                    
                    Button("Waterfront") {
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.asparagus)
                    .padding()
                    .foregroundColor(.white)
                }//HStack end
            }//VStack end title + filters
            ScrollView(.vertical, showsIndicators: true){//Click and hold to scroll
                VStack {//VStack for landmark images
                    
                        
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 20.0)
                        Color("Asparagus")
                        
                        VStack{
                        Image("GGBridge")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            
                            .cornerRadius(10)
                            .frame(width: 250, height: 200)
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                            
                        Text("The Golden Gate Bridge")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.bottom, 15.0)
                            HStack{
                                
                            }
                            
                            
                            
                    }//vstack end for landmark box
                }//zstack end for landmark box
                
                    Divider()
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 20.0)
                        Color("Asparagus")
                        
                        VStack{
                        Image("FishermansWharf")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            
                            .cornerRadius(10)
                            .frame(width: 250, height: 200)
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                            
                        Text("Fishermans Wharf")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.bottom, 15.0)
                            
                    }//vstack end for landmark box
                }//zstack end for landmark box
                
                    Divider()
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 20.0)
                        Color("Asparagus")
                        
                        VStack{
                        Image("PaintedLadies")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            
                            .cornerRadius(10)
                            .frame(width: 250, height: 200)
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                            
                        Text("The Painted Ladies")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.bottom, 15.0)
                            
                    }//vstack end for landmark box
                }//zstack end for landmark box
                    
                    Divider()
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 20.0)
                        Color("Asparagus")
                        
                        VStack{
                        Image("CoitTower")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            
                            .cornerRadius(10)
                            .frame(width: 250, height: 200)
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                            
                        Text("Coit Tower")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.bottom, 15.0)
                            
                    }//vstack end for landmark box
                }//zstack end for landmark box
                    Divider()
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 20.0)
                        Color("Asparagus")
                        
                        VStack{
                        Image("OraclePark")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            
                            .cornerRadius(10)
                            .frame(width: 250, height: 200)
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                            
                        Text("Oracle Park")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.bottom, 15.0)
                            
                    }//vstack end for landmark box
                }//zstack end for landmark box
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 20.0)
                        Color("Asparagus")
                        
                        VStack{
                        Image("TiledSteps")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            
                            .cornerRadius(10)
                            .frame(width: 250, height: 200)
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                            
                        Text("16th Avenue Tiled Steps")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.bottom, 15.0)
                            
                    }//vstack end for landmark box
                }//zstack end for landmark box
                    
                    
                }//Vstack end landmark images
            }//Scroll end
            .frame(maxHeight: .infinity)
            }
            .frame(height: nil)// End of VStack for header + scroll
        }//ZStack
    }//body end
}//struct end

#Preview {
    LandmarksPage()
}
