//
//  VideoModel.swift
//  Naruto
//
//  Created by user on 22/06/24.
//

import Foundation

struct videoModel {
  let image: String
  let title: String
  let url: String

  static let collection: [videoModel] = [
    .init(image: "zabuza", title: "Zabuza Momochi", url: "https://www.youtube.com/watch?v=XBPkNYuo7FY&t=4s"),
    .init(image: "itachi", title: "Itachi Uchiha", url: "https://www.youtube.com/watch?v=WTVBQ4NRIDo&t=2s"),
    .init(image: "asuma", title: "Asuma Sarutobi", url: "https://www.youtube.com/watch?v=l7-c515gL6M&t=35s"),
    .init(image: "jziraya", title: "Jiraya", url: "https://www.youtube.com/watch?v=wEQoGk8jFqo"),
    .init(image: "nagato", title: "Nagato Uzumaki(Peyn)", url: "https://www.youtube.com/watch?v=hio46IFCAEg"),
//    .init(image: "", title: "", url: ""),
//    .init(image: "", title: "", url: ""),
//    .init(image: "", title: "", url: ""),
//    .init(image: "", title: "", url: ""),
//    .init(image: "", title: "", url: ""),
  ]
}
