//
//  ContentView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var presentSideMenu = false
    @State var showSheetLargeNavigation: Bool = false
    @State var showSheetNavigation: Bool = false
    @State var showFullModalNavigation: Bool = false
    let itemsStackNavigation: [String] = ["Stack Navigation 1", "Stack Navigation 2"]
    @State private var searchText = ""
    @State var isLoading: Bool = false
    @State var showMultipleOptionsAlert: Bool = false
    @State var isPresentedNormalAlert: Bool = false
    @State var textNormalAlert: String = ""
    @State var isPresentedConfirmationDialog: Bool = false
    @State var textConfirmationDialog: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        
                        Section(header: Text("Progress View")) {
                            // MARK: Progress View
                            NavigationLink(destination: ScreenProgressView()) {
                                ContentViewCell(title: "Progress View")
                            }
                            
                            // MARK: Other Progress View
                            NavigationLink(destination: OtherProgressView()) {
                                ContentViewCell(title: "Other Progress View")
                            }
                        }
                        
                        // MARK: Sheet Large Navigation
                        Section(header: Text("Navigation")) {
                            Button {
                                showSheetLargeNavigation.toggle()
                            } label: {
                                ContentViewCell(title: "Sheet Large Navigation")
                            }
                            .buttonStyle(.plain)
                            .tint(.white)
                            
                            // MARK: Sheet Navigation
                            Button {
                                showSheetNavigation.toggle()
                            } label: {
                                ContentViewCell(title: "Sheet Navigation")
                            }
                            .buttonStyle(.plain)
                            .tint(.white)
                            
                            // MARK: Full Modal Navigation
                            Button {
                                showFullModalNavigation.toggle()
                            } label: {
                                ContentViewCell(title: "Full Modal Navigation")
                            }
                            .buttonStyle(.plain)
                            .tint(.white)
                            
                            // MARK: Stack Navigation
                            ForEach(filteredData, id: \.self) { item in
                                NavigationLink(value: item) {
                                    Text(item)
                                    
                                }
                            }.navigationDestination(for: String.self) { itemStackNavigation in
                                VStack {
                                    ZStack {
                                        Color.yellow
                                        VStack {
                                            Text("Selected Item")
                                                .font(.largeTitle)
                                                .bold()
                                            Text(itemStackNavigation)
                                                .font(.system(size: 20))
                                                .bold()
                                            Spacer()
                                        }
                                        .padding(.top, 160)
                                    }
                                }
                                .ignoresSafeArea()
                            }
                        }
                        
                        Section(header: Text("Content Unavailable")) {
                            // MARK: Content Unavailable Mail
                            NavigationLink(destination: ContentUnavailableNoMailView()) {
                                ContentViewCell(title: "Content Unavailable Mail")
                            }
                            
                            // MARK: Content Unavailable Inbox
                            NavigationLink(destination: ContentUnavailableNoInboxView()) {
                                ContentViewCell(title: "Content Unavailable Inbox")
                            }
                            
                            // MARK: Content Unavailable Results
                            NavigationLink(destination: ContentUnavailableNoResultsView()) {
                                ContentViewCell(title: "Content Unavailable Results")
                            }
                        }
                        
                        Section(header: Text("Other")) {
                            // MARK: Async Image
                            NavigationLink(destination: AsyncImageView()) {
                                ContentViewCell(title: "Async Image")
                            }
                            
                            // MARK: 3D Tab Bar
                            NavigationLink(destination: TabBarT()) {
                                ContentViewCell(title: "3D Tab Bar")
                            }
                            
                            // MARK: Text Editor
                            NavigationLink(destination: TextEditorView()) {
                                ContentViewCell(title: "Text Editor")
                            }
                            
                            // MARK: Text Editor
                            NavigationLink(destination: OpenLinkView()) {
                                ContentViewCell(title: "Open Link")
                            }
                            
                            // MARK: Scroll View Animation
                            NavigationLink(destination: ScrollViewAnimationView()) {
                                ContentViewCell(title: "Scroll View Animation")
                            }
                            
                            // MARK: GridView
                            NavigationLink(destination: GridView()) {
                                ContentViewCell(title: "GridView")
                            }
                            
                            // MARK: Context Menu
                            NavigationLink(destination: ContextMenuView()) {
                                ContentViewCell(title: "Context Menu")
                            }
                            
                            // MARK: Rating View
                            NavigationLink(destination: RatingView(rating: 1)) {
                                ContentViewCell(title: "Rating View")
                            }
                            
                            // MARK: Radial Gradient
                            NavigationLink(destination: RadialGradientView()) {
                                ContentViewCell(title: "Radial Gradient")
                            }
                            
                            // MARK: Text Animation
                            NavigationLink(destination: TextAnimationView()) {
                                ContentViewCell(title: "Text Animation")
                            }
                            
                            // MARK: Button Styles
                            NavigationLink(destination: ButtonStylesView()) {
                                ContentViewCell(title: "Button Styles")
                            }
                            
                            // MARK: Loading Buttons
                            NavigationLink(destination: LoadingButtonsView()) {
                                ContentViewCell(title: "Loading Buttons")
                            }
                            
                            // MARK: Gradient Text
                            NavigationLink(destination: GradientTextView()) {
                                ContentViewCell(title: "Gradient Text")
                            }
                            
                            // MARK: Unsplash
                            NavigationLink(destination: Unsplash()) {
                                ContentViewCell(title: "Unsplash API")
                            }
                            
                            // MARK: Drag Gesture
                            NavigationLink(destination: DragGestureView()) {
                                ContentViewCell(title: "Drag Gesture")
                            }
                            
                            // MARK: Staggered Text
                            NavigationLink(destination: StaggeredTextView()) {
                                ContentViewCell(title: "Staggered Text")
                            }
                            
                            // MARK: Materials
                            NavigationLink(destination: MaterialsView()) {
                                ContentViewCell(title: "Materials")
                            }
                        }
                        
                        Section(header: Text("Login")) {
                            // MARK: Login Form
                            NavigationLink(destination: LoginFormView()) {
                                ContentViewCell(title: "Login Form")
                            }
                            
                            // MARK: Login Form Forgot
                            NavigationLink(destination: LoginFormForgotView()) {
                                ContentViewCell(title: "Login Form Forgot")
                            }
                        }
                        
                        Section(header: Text("Picker")) {
                            // MARK: Date Picker
                            NavigationLink(destination: DatePickerView()) {
                                ContentViewCell(title: "Date Picker")
                            }
                            
                            // MARK: Date Picker with Time
                            NavigationLink(destination: DatePickerWithTimeView()) {
                                ContentViewCell(title: "Date Picker with Time")
                            }
                            
                            // MARK: Date Picker Scroll
                            NavigationLink(destination: DatePickerScrollView()) {
                                ContentViewCell(title: "Date Picker with Scroll")
                            }
                            
                            // MARK: Date Picker Time
                            NavigationLink(destination: DatePickerTimeView()) {
                                ContentViewCell(title: "Date Picker Time")
                            }
                        }
                        
                        Section(header: Text("Alerts")) {
                            // MARK: Multiple Options Alert
                            Button {
                                showMultipleOptionsAlert.toggle()
                            } label: {
                                ContentViewCell(title: "Multiple Options Alert")
                            }
                            .buttonStyle(.plain)
                            .tint(.white)
                            
                            // MARK: Normal Alert
                            Button {
                                isPresentedNormalAlert = true
                            } label: {
                                ContentViewCell(title: "Normal Alert")
                            }
                            .buttonStyle(.plain)
                            .tint(.white)
                            
                            // MARK: Confirmation Dialog
                            Button {
                                isPresentedConfirmationDialog = true
                            } label: {
                                ContentViewCell(title: "Confirmation Dialog")
                            }
                            .buttonStyle(.plain)
                            .tint(.white)
                        }
                        
                        
                    }
                    // MARK: Refreshable
                    .refreshable {
                        isLoading = true
                        Task {
                            try await Task.sleep(nanoseconds: 2_000_000_000)
                            
                            isLoading = false
                        }
                    }
                    //.listStyle(.plain)
                    //.listStyle(GroupedListStyle())
                    .navigationTitle(isLoading ? "LOADING..." : "Refresable")
                    
                }
                .padding(.top, 50)
                // MARK: Search Bar
                .searchable(text: $searchText)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // MARK: Side Menu
            .overlay(
                ZStack {
                    HStack {
                        Button {
                            presentSideMenu.toggle()
                        } label: {
                            Image(systemName: "list.bullet")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: 24, height: 24)
                        .padding(.leading, 30)
                        
                        Spacer()
                        
                        
                    }
                }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .zIndex(1)
                    .shadow(radius: 0.3)
                , alignment: .top)
            // MARK: Sheet Large Navigation
            .sheet(isPresented: $showSheetLargeNavigation, content: {
                SheetLargeNavigation()
                    .presentationDetents([.large])
            })
            // MARK: Sheet Navigation
            .sheet(isPresented: $showSheetNavigation, content: {
                SheetNavigation()
                    .presentationDetents([
                        .medium,
                        .fraction(0.3)
                    ])
            })
            // MARK: Full Modal Navigation
            .fullScreenCover(isPresented: $showFullModalNavigation, content: {
                FullModalNavigation()
            })
            // MARK: Multiple Options Alert
            .alert("AlertTitle",
                   isPresented: $showMultipleOptionsAlert) {
                Button("First Button", role: .none) {
                    print("First Button")
                }
                Button("Second Button", role: .none) {
                    print("Second Button")
                }
                Button("Third Button", role: .destructive) {
                    print("Third Button")
                }
                Button("Cancel Button", role: .cancel) {
                    print("Cancel Button")
                }
            }
            // MARK: Normal Alert
                   .alert(isPresented: $isPresentedNormalAlert) {
                       Alert(title:
                                Text("AlertTitle"),
                             message:
                                Text("AlertMessage"),
                             primaryButton:
                                Alert.Button.default(Text("Accept"), action: {
                           textNormalAlert = "Accept Button"
                           print(textNormalAlert)
                       }),
                             secondaryButton:
                            .destructive(Text("Cancel"), action: {
                                textNormalAlert = "Cancel Button"
                                print(textNormalAlert)
                            })
                       )
                   }
            // MARK: Confirmation Dialog
                   .confirmationDialog("Confirmation Dialog Title",
                                       isPresented: $isPresentedConfirmationDialog,
                                       titleVisibility: .visible,
                                       actions: {
                       Button("First Button", role: .none) {
                           textConfirmationDialog = "First Button"
                           print(textConfirmationDialog)
                       }
                       Button("Second Button", role: .none) {
                           textConfirmationDialog = "Second Button"
                           print(textConfirmationDialog)
                       }
                       Button("Third Button", role: .destructive) {
                           textConfirmationDialog = "Third Button"
                           print(textConfirmationDialog)
                       }
                       Button("Cancel Button", role: .cancel) {
                           textConfirmationDialog = "Cancel Button"
                           print(textConfirmationDialog)
                       }
                   }, message: {
                       Text("ConfirmationDialogMessage")
                   })
            
            
            
            SideMenu()
        }
        
        .frame(maxWidth: .infinity)
    }
    
    // MARK: Side Menu
    @ViewBuilder
    private func SideMenu() -> some View {
        SwiftUIDesigns.SideMenu(isShowing: $presentSideMenu, direction: .leading) {
            SideViewContents(presentSideMenu: $presentSideMenu)
                .frame(width: 300)
        }
    }
    
    // MARK: Search Bar
    var filteredData: [String] {
        guard searchText.isEmpty else {
            return itemsStackNavigation.filter { $0.contains(searchText) }
        }
        
        return itemsStackNavigation
    }
}

#Preview {
    ContentView()
}
