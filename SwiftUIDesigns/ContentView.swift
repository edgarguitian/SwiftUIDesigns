//
//  ContentView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 13/12/23.
//

import SwiftUI

struct SectionItem {
    let header: String
    let items: [Item]
}

struct Item {
    let title: String
    let destination: AnyView
}

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
    let itemsStackNavigationSections: [SectionItem] = [
        SectionItem(header: "Card View", items: [
            Item(title: "Card Views", destination: AnyView(CustomCardView()))
        ]),
        SectionItem(header: "App Intro", items: [
            Item(title: "App Intro View", destination: AnyView(AppIntroView())),
            Item(title: "Login Intro View", destination: AnyView(LoginIntroAnimationHome())),
        ]),
        SectionItem(header: "Carousel", items: [
            Item(title: "Cover Carousel", destination: AnyView(CustomCarouselContainer())),
            Item(title: "Carousel View", destination: AnyView(CarouselView())),
        ]),
        SectionItem(header: "Speech View", items: [
            Item(title: "Speech View", destination: AnyView(SpeechView()))
        ]),
        SectionItem(header: "Progress View", items: [
            Item(title: "Progress View", destination: AnyView(ScreenProgressView())),
            Item(title: "Other Progress View", destination: AnyView(OtherProgressView()))
        ]),
        
        SectionItem(header: "Loading", items: [
            Item(title: "Loading Buttons", destination: AnyView(LoadingButtonsView())),
            Item(title: "Loading Animation", destination: AnyView(LoadingAnimationView()))
        ]),
        
        SectionItem(header: "Content Unavailable", items: [
            Item(title: "Content Unavailable Mail", destination: AnyView(ContentUnavailableNoMailView())),
            Item(title: "Content Unavailable Inbox", destination: AnyView(ContentUnavailableNoInboxView())),
            Item(title: "Content Unavailable Results", destination: AnyView(ContentUnavailableNoResultsView())),
        ]),
        
        SectionItem(header: "Other", items: [
            Item(title: "Show Case", destination: AnyView(ShowCaseHome())),
            Item(title: "Shape Morphing", destination: AnyView(IntroView())),
            Item(title: "Dropdown", destination: AnyView(DropdownView())),
            Item(title: "NavigationSplitView", destination: AnyView(ThreeColumnSample())),
            Item(title: "Swipe Actions", destination: AnyView(SwipeActionsView())),
            Item(title: "Inspector", destination: AnyView(Inspector_View())),
            Item(title: "Async Image", destination: AnyView(AsyncImageView())),
            Item(title: "3D Tab Bar", destination: AnyView(TabBarT())),
            Item(title: "Text Editor", destination: AnyView(TextEditorView())),
            Item(title: "Open Link", destination: AnyView(OpenLinkView())),
            Item(title: "Scroll View Animation", destination: AnyView(ScrollViewAnimationView())),
            Item(title: "GridView", destination: AnyView(GridView())),
            Item(title: "Context Menu", destination: AnyView(ContextMenuView())),
            Item(title: "Rating View", destination: AnyView(RatingView(rating: 1))),
            Item(title: "Radial Gradient", destination: AnyView(RadialGradientView())),
            Item(title: "Text Animation", destination: AnyView(TextAnimationView())),
            Item(title: "Button Styles", destination: AnyView(ButtonStylesView()))
        ]),
        
        SectionItem(header: "Login", items: [
            Item(title: "Login Form", destination: AnyView(LoginFormView())),
            Item(title: "Login Form Forgot", destination: AnyView(LoginFormForgotView()))
        ]),
        
        SectionItem(header: "Picker", items: [
            Item(title: "Date Picker", destination: AnyView(DatePickerView())),
            Item(title: "Date Picker with Time", destination: AnyView(DatePickerWithTimeView())),
            Item(title: "Date Picker with Scroll", destination: AnyView(DatePickerScrollView())),
            Item(title: "Date Picker Time", destination: AnyView(DatePickerTimeView())),
            Item(title: "Timer Picker", destination: AnyView(CustomTimerPicker()))
        ]),
        
        SectionItem(header: "Cool", items: [
            Item(title: "Gradient Text", destination: AnyView(GradientTextView())),
            Item(title: "Unsplash API", destination: AnyView(Unsplash())),
            Item(title: "Drag Gesture", destination: AnyView(DragGestureView())),
            Item(title: "Staggered Text", destination: AnyView(StaggeredTextView())),
            Item(title: "Materials", destination: AnyView(MaterialsView())),
            Item(title: "Vibrancy", destination: AnyView(VibrancyView())),
            Item(title: "Path Menu", destination: AnyView(PathMenuView())),
            Item(title: "Vertical Pagging", destination: AnyView(VerticalPaggingView())),
            Item(title: "Material Saturation", destination: AnyView(MaterialSaturationView())),
            Item(title: "Top Menu", destination: AnyView(CategoryView(categories: categoriesData) {value in})),
            Item(title: "Symbol Efects", destination: AnyView(SymbolEffectsView())),
            Item(title: "Map", destination: AnyView(MapView())),
            Item(title: "Expandable View", destination: AnyView(ContentExpandableView())),
            Item(title: "Tip View", destination: AnyView(TipContentView())),
            Item(title: "Hero Animation", destination: AnyView(Home())),
        ]),
        
        SectionItem(header: "Graphs", items: [
            Item(title: "Bar Mark", destination: AnyView(BarMarkView())),
            Item(title: "Heat Map", destination: AnyView(HeatMapView())),
            Item(title: "Rule Mark", destination: AnyView(RuleMarkView())),
            Item(title: "Line Chart", destination: AnyView(LineChartView())),
            Item(title: "Bar Chart", destination: AnyView(BarChartView())),
            Item(title: "Pie Chart", destination: AnyView(PieChartView())),
            Item(title: "Gradient Area Chart", destination: AnyView(GradientAreaChartView())),
            Item(title: "Animated Charts", destination: AnyView(AnimatedCharts()))
            
        ])
    ]
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        
                        ForEach(filteredSections, id: \.header) { section in
                            Section(header: Text(section.header)) {
                                ForEach(section.items, id: \.title) { item in
                                    NavigationLink(destination: item.destination) {
                                        ContentViewCell(title: item.title)
                                    }
                                }
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
                //.padding(.top, 50)
                // MARK: Search Bar
                .searchable(text: $searchText)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // MARK: Side Menu
            /*.overlay(
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
                , alignment: .top)*/
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
            
            
            
            // SideMenu()
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
    
    var filteredSections: [SectionItem] {
        guard !searchText.isEmpty else {
                return itemsStackNavigationSections
            }

        return itemsStackNavigationSections.compactMap { section in
                let filteredItems = section.items.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
                if !filteredItems.isEmpty {
                    return SectionItem(header: section.header, items: filteredItems)
                } else if section.header.localizedCaseInsensitiveContains(searchText) {
                    return SectionItem(header: section.header, items: section.items)
                } else {
                    return nil
                }
            }
    }
}

#Preview {
    ContentView()
}
