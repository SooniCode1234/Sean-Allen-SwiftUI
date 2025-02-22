//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Sooni Mohammed on 2020-11-07.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var daysArray = days
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatus(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                  temperature: 76)
                
                HStack(spacing: 20) {
//                    WeatherDayView(dayOfWeek: "TUE",
//                                   imageName: "cloud.sun.fill",
//                                   temperature: 74)
//                    WeatherDayView(dayOfWeek: "WED",
//                                   imageName: "sun.max.fill",
//                                   temperature: 88)
//                    WeatherDayView(dayOfWeek: "THU",
//                                   imageName: "wind.snow",
//                                   temperature: 55)
//                    WeatherDayView(dayOfWeek: "FRI",
//                                   imageName: "sunset.fill",
//                                   temperature: 60)
//                    WeatherDayView(dayOfWeek: "SAT",
//                                   imageName: "snow",
//                                   temperature: 25)
                    ForEach(daysArray) { day in
                        WeatherDayView(day: day)
                    }
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var day: Day
//    var dayOfWeek: String
//    var imageName: String
//    var temperature: Int
    
    var body: some View {
        VStack {
            Text(day.dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: day.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(day.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatus: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


