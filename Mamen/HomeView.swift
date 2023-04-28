//
//  HomeView.swift
//  Mamen
//
//  Created by Chester Zhao on 12/24/22.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        ScrollView(showsIndicators: false) {
            // MARK: - Dadline view

            VStack {
                HStack {
                    Text("\(Date(), style: .date)")
                        .font(.custom("AirbnbCereal_W_Md", size: 17))
                        .fontWeight(/*@START_MENU_TOKEN@*/ .semibold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .listRowSeparator(.hidden)
                        .padding(.leading)
                    Spacer()
                }
                .padding(.bottom, 1)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        DeadLineView(name: "Human Interface", inf: "Individual design", time: "2022-5-08", DUO_day: "10  DAY", line: 100)
                        DeadLineView(name: "Data Structure Algorithms", inf: "Coursework", time: "2022-5-13", DUO_day: "15  DAY", line: 150)
                    }
                    .padding(.leading)
                    .frame(height: 120)
                }
                .offset(y: -10)
            }

            // MARK: - Message view

            VStack {
                HStack {
                    Text("Message")
                        .font(.custom("AirbnbCereal_W_Bd", size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color("main-green"))
                        .padding(.leading)
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color(hex: "e8e8e8"), lineWidth: 1)
                    .frame(width: 350, height: 75)
                    // .foregroundColor(Color.white)

                    .overlay {
                        VStack {
                            Group {
                                MassageView(name: "Doctument", icon: "doc.text.fill", massage: "IPD have new doctument", time: "5 hours age")
                                MassageView(name: "Daed Line", icon: "clock.fill", massage: "HCI have new daed line", time: "2 days age")
                                MassageView(name: "Dead Line", icon: "clock.fill", massage: "C&C++ have new daed line", time: "2 days age")
                            }
                            .padding(.top, 0.1)
                        }
                    }
            }
            .padding(.bottom)

            // MARK: - Day View

            VStack {
                HStack {
                    Text("Your Day")
                        .font(.custom("AirbnbCereal_W_Bd", size: 18))
                        .foregroundColor(Color("main-green"))
                        .padding(.leading)
                    Spacer()
                }
                DayView(name: "Data Base", place: "8203", begin: "8:00 AM", over: "9:45 AM", color: Color(hex: "FF927F"))
                DayView(name: "Human Interface", place: "8606", begin: "2:30 PM", over: "3:00 PM", color: Color(hex: "CCC8EF"))
            }
            .padding(.bottom)

            // MARK: - Tools View

            VStack {
                HStack {
                    Text("Useful Tools")
                        .font(.custom("AirbnbCereal_W_Bd", size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color("main-green"))
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    NavigationLink(destination: Translator_View()) {
                        ToolsView(name: "Translator", icon: "Exam")
                    }

                    NavigationLink(destination: CourseSlectView()) {
                        ToolsView(name: "Select", icon: "Course 1")
                    }

                    NavigationLink(destination: DalleView()) {
                        ToolsView(name: "My Courses", icon: "Pay")
                    }
                }
                HStack {
                    NavigationLink(destination: LibaryView()) {
                        ToolsView(name: "Libary", icon: "Book")
                    }
                    
                    NavigationLink(destination: LibaryView()) {
                        ToolsView(name: "Room", icon: "Room")
                    }

                    
                    ToolsView(name: "Drop out", icon: "Drop")
                }
            }
            
            Spacer()
                .frame(height: 40)
        }
    }

    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
