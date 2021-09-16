//
//  File.swift
//  Africa
//
//  Created by Владимир Ширяев on 15.09.2021.
//

import Foundation
import AVKit
var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) ->AVPlayer {
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer  = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
