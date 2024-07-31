//
//  AppIntroView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 31/7/24.
//

import SwiftUI

struct AppIntroView: View {
    @State var showWalkThroughScreens: Bool = false
    @State var currentIndex: Int = 0
    @State var showHomeView: Bool = false
    var body: some View {
        ZStack {
            if showHomeView {
                Text("Home View")
            } else {
                ZStack {
                    Color.gray.opacity(0.5)
                        .ignoresSafeArea()
                    
                    IntroScreen()
                        
                    WalkThroughScreens()
                    
                    NavBar()
                }
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.35), value: showHomeView)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func WalkThroughScreens() -> some View {
        GeometryReader {
            let isLast = currentIndex == intros.count
            let size = $0.size
            
            ZStack {
                ForEach(intros.indices, id: \.self) { index in
                    ScreenView(size: size, index: index)
                }
                
                WelcomeView(size: size, index: intros.count)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottom) {
                ZStack {
                    Image(systemName: "chevron.right")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .scaleEffect(!isLast ? 1 : 0.001)
                        .opacity(!isLast ? 1 : 0)
                    
                    HStack {
                        Text("Sign Up")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "arrow.right")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 15)
                    .scaleEffect(isLast ? 1 : 0.001)
                    .frame(height: isLast ? nil : 0)
                    .opacity(isLast ? 1 : 0)
                }
                .frame(width: isLast ? size.width / 1.5 : 55, height: isLast ? 50 : 55)
                    .foregroundColor(.white)
                    .background {
                        RoundedRectangle(cornerRadius: isLast ? 10 :30, style: isLast ? .continuous : .circular)
                            .fill(.blue)
                    }
                    .onTapGesture {
                        if currentIndex == intros.count {
                            showHomeView = true
                        } else {
                            currentIndex += 1
                        }
                    }
                    .offset(y: isLast ? -40 : -90)
                    .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: isLast)
            }
            .overlay(alignment: .bottom) {
                let isLast = currentIndex == intros.count
                
                HStack(spacing: 5) {
                    Text("Already have an account?")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Button("Login") {
                        
                    }
                    .font(.body)
                    .foregroundColor(.blue)
                }
                .offset(y: isLast ? -12 : 100)
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: isLast)

                
            }
            .offset(y: showWalkThroughScreens ? 0 : size.height + 20)
        }
    }
    
    @ViewBuilder
    func WelcomeView(size: CGSize, index: Int) -> some View {
        
        VStack(spacing: 10) {
            
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            Text("Welcome")
                .font(.title)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            Text("Stay organisez and live stress-free with\nyou-do app.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)



        }
        .offset(y: -30)
    }
    
    @ViewBuilder
    func ScreenView(size: CGSize, index: Int) -> some View {
        let intro = intros[index]
        
        VStack(spacing: 10) {
            Text(intro.title)
                .font(.title)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Text(dummyTextIntro)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)

            Image(intro.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)

        }
    }
    
    @ViewBuilder
    func NavBar() -> some View {
        let isLast = currentIndex == intros.count

        HStack {
            Button(action: {
                if currentIndex > 0 {
                    currentIndex -= 1
                } else {
                    showWalkThroughScreens.toggle()
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            })
            
            Spacer()
            
            Button("Skip") {
                currentIndex = intros.count
            }
            .font(.title2)
            .foregroundColor(.blue)
            .opacity(isLast ? 0 : 1)
            .animation(.easeInOut, value: isLast)
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(y: showWalkThroughScreens ? 0 : -120)
    }
    
    @ViewBuilder
    func IntroScreen() -> some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 10) {
                Image("fondo1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height / 2)
                
                Text("Clearhead")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 85)
                
                Text(dummyTextIntro)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Text("Let's Begin")
                    .font(.title3)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 14)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(.blue)
                    }
                    .onTapGesture {
                        showWalkThroughScreens = true
                    }
                    .padding(.top, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .offset(y: showWalkThroughScreens ? -size.height : 0)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    IntroView()
}
