//
//  Course.swift
//  Mamen
//
//  Created by Chester Zhao on 12/19/22.
//

import SwiftUI
import SwiftyJSON
struct Course: View {
    @State var showDetailView = false
    @State var showWebView = false
    @State var courseSlect = 0
    @State private var coursejson: responseBody = .init(result: 0, message: "", data: nil)
    @AppStorage("selectedCourse") var selectedCourse: [String] = []

    var body: some View {
        VStack {
            HStack {
                Text("Current Modules")
                    .font(.custom("AirbnbCereal_W_Bd", size: 25))
                    .foregroundColor(Color("main-green"))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
            .padding(.top, 20)
            .task {
                r.GetAllCourses { result in
                    self.coursejson = result
                }
            }
            let json = JSON(self.coursejson.data ?? "")
            ZStack {
                VStack {
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            ZStack {
                                HStack {
                                    ForEach(0 ..< json.count, id: \.self) { item in
                                        if self.selectedCourse.contains(json[item, "title"].stringValue) {
                                            ZStack {
                                                Course_card(image: json[item, "pic"].stringValue, name: json[item, "title"].stringValue, emoji: "🧑🏻‍💻")
                                                    .onTapGesture {
                                                        courseSlect = item
                                                        TapticEngine.impact.feedback(.medium)
                                                    }.task {
                                                        if courseSlect == 0 {
                                                            courseSlect = item
                                                        }
                                                        if item<courseSlect{
                                                            courseSlect=item
                                                        }
                                                    }
                                                    .animation(.easeOut, value: courseSlect)
                                                if courseSlect == item {
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .frame(width: 80, height: 3)
                                                        .foregroundColor(Color("main-green"))
                                                        .offset(x: 5, y: 63)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 5)
                    if selectedCourse.count > 0 {
                        Course_Down_View(TeacherImag: json[courseSlect, "name"].stringValue, TeacherName: json[courseSlect, "fullname"].stringValue, Course_name: json[courseSlect, "title"].stringValue, Email: json[courseSlect, "email"].stringValue, WorkTime: json[courseSlect, "worktime"].stringValue, OfficeLocation: json[courseSlect, "workroom"].stringValue, OfficeLocation_Map: json[courseSlect, "workroomdetail"].stringValue)
                    }
                }
            }
            .padding(.bottom, 10)
        }
    }
}

struct Course_Previews: PreviewProvider {
    static var previews: some View {
        Course()
    }
}
