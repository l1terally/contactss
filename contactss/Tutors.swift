//
//  Tutors.swift
//  contactss
//
//  Created by Юрий  Лизунов on 01/02/23.
//
import SwiftUI

struct Tutor: Identifiable {
    var id = UUID()
    var name: String
    var headline: String
    var bio: String
    
    var imageName: String { return name }
}

#if DEBUG
let testData = [
    Tutor(name: "Sai Kambampati", headline: "Writer at AppCoda", bio: "Sai Kambampati is an app developer. He lives in Sacramento, CA and was awar"),
    Tutor(name: "Simon Ng", headline: "Founder of AppCoda", bio: "Founder of AppCoda. Author of multiple iOS prgramming books including Begi"),
    Tutor(name: "Gabriel Theodoropoulos", headline: "Advanced Software Developer", bio: "Gabriel has been a software developer for about two decad"),
    Tutor(name: "Andrew Jaffee", headline: "Author and Software Developer", bio: "Avid and well-published author and software developer now specializing in iOS mobile app devel"),
    Tutor(name: "Athena Lam", headline: "Content marketing professional", bio: "Athena is a co-founder of Business 3.0, a publication dedi"),
    Tutor(name: "Alfian Losari", headline: "Lifelong Learner", bio: "Mobile, Web, a bit of backend Software Developer and LifeLong Learner. Current building super app."),
    Tutor(name: "Lawrence Tan", headline: "Passionate iOS Developer", bio: "Lawrence is a passionate iOS Developer with over 3 years of commercial experience and had"),
    Tutor(name: "Kelvin Tan", headline: "Self-taught iOS Mobile Developer", bio: "Kelvin is a self taught iOS Mobile Developer who is currently active writing tutorials on his site."),
]
#endif
