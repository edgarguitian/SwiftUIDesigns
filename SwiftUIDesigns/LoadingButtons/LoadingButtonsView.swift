//
//  LoadingButtonsView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct LoadingButtonsView: View {
    @State private var progressValue: Double = 0.5
    @State private var progress = 0.2

    var body: some View {
        VStack {
            
            HStack {
                ProgressView()
                
                ProgressView("Loading")
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .padding()
                
                ProgressView("Loading", value: progressValue)
                    .progressViewStyle(.linear)
                    .tint(.blue)
                    .frame(maxWidth: 200)
            }
            
            
            Spacer()
            
            HStack {
                HStack {
                    ProgressView(value: progressValue)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(width: 20, height: 20)
                    
                    Text("Loading")
                        .foregroundColor(.white)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.blue)
                    
                )
                
                
                
                ProgressView(value: progress, total: 1.0)
                    .progressViewStyle(GaugeProgressStyle())
                    .frame(width: 50, height: 50)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if progress < 1.0 {
                            withAnimation {
                                progress += 0.2
                            }
                        }
                    }
            }
            .padding()
            
            Spacer()
            
            ProgressView(value: 0.3, label: { Text("Processing...") }, currentValueLabel: { Text("30%") })
                .progressViewStyle(BarProgressStyle(height: 50.0))
                .padding()
            
            Spacer()
            
            CustomProgressView(progress: progress)
                    .frame(height: 10)
                    .padding(.horizontal, 50)
            
            Spacer()
            
            HStack {
                CircularLoaderView()
                
                RotateImageLoaderView()
                
            }.padding()
            
            HStack {
                RotateCircleAroundCircle()
                
                MultiCircleLoaderView()
                
                SquareLoaderView()
            }
            .padding()
            
            HStack {
                AnimatedStrokeRectangle()
                
                AnimatedStrokeTriangle()
                
                AnimatedStrokeCircle()
            }.padding()
            
            HStack {
                CircleFillLoaderView()
                
                CirclesLoaderView()
                
                ModernCircularLoader()
            }.padding()
            
            HStack {
                DashCircleLoaderView()
                
                BottomToTopFill()
                
                PieSegmentLoader()
            }.padding()
            
            Spacer()
            
            
        }
        
        
    }
}

#Preview {
    LoadingButtonsView()
}
