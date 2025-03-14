//
//  ContentView.swift
//  DailyHoroscope
//
//  Created by Zachary Dwight
//

import SwiftUI

struct HoroscopeView: View {
    let zodiacSign: String
    let horoscope: String

    var body: some View {
        VStack {
            Text(zodiacSign)
                .font(.largeTitle)
                .padding()

            ScrollView {
                Text(horoscope)
                    .padding()
                    .multilineTextAlignment(.leading)
            }
        }
        .padding()
        .navigationTitle("Your Horoscope")
    }
}

struct ContentView: View {
    @State private var selectedSign = "Aries"
    let zodiacSigns = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]

    // Simulate horoscope data (replace with actual API or data source)
    let horoscopeData: [String: String] = [
        "Aries": "Today, your fiery energy is perfect for tackling new challenges. Embrace spontaneity and don't be afraid to take risks. Your confidence will attract positive attention.",
        "Taurus": "Focus on stability and comfort today. Practical matters require your attention. Take time to appreciate the simple pleasures in life and indulge in some self-care.",
        "Gemini": "Your communication skills are highlighted today. Engage in stimulating conversations and share your ideas. Be open to new perspectives and embrace flexibility.",
        "Cancer": "Your intuition is strong today. Pay attention to your emotions and nurture your relationships. Spend time with loved ones and create a cozy atmosphere.",
        "Leo": "Your creativity and charisma are shining bright today. Express yourself confidently and embrace your inner star. Share your talents with others and enjoy the spotlight.",
        "Virgo": "Focus on organization and efficiency today. Pay attention to details and tackle tasks with precision. Your analytical skills will help you solve problems.",
        "Libra": "Seek balance and harmony in your relationships today. Engage in diplomacy and strive for fairness. Appreciate beauty and surround yourself with positive energy.",
        "Scorpio": "Your intensity and passion are heightened today. Dive deep into your emotions and explore your inner self. Embrace transformation and let go of what no longer serves you.",
        "Sagittarius": "Your adventurous spirit is calling you today. Seek new experiences and expand your horizons. Embrace optimism and share your enthusiasm with others.",
        "Capricorn": "Focus on your goals and responsibilities today. Your discipline and determination will lead to success. Stay grounded and persevere through challenges.",
        "Aquarius": "Your innovative and independent spirit is highlighted today. Embrace your unique perspective and challenge the status quo. Connect with like-minded individuals and share your vision.",
        "Pisces": "Your intuition and compassion are strong today. Connect with your spiritual side and embrace your creativity. Offer support to those in need and nurture your dreams."
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Look within, take a breath, and absorb the day!") // Subheader
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                
                Picker("Select Zodiac Sign", selection: $selectedSign) {
                    ForEach(zodiacSigns, id: \.self) { sign in
                        Text(sign).tag(sign)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                
                NavigationLink(destination: HoroscopeView(zodiacSign: selectedSign, horoscope: horoscopeData[selectedSign] ?? "Horoscope not found.")) {
                    Text("View Horoscope")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Daily Zodiac Reading")
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
