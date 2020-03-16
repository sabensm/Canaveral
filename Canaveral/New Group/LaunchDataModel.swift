//
//  LaunchDataModel.swift
//  Canaveral
//
//  Created by Mike Sabens on 3/8/20.
//  Copyright © 2020 Slip3 Studios. All rights reserved.
//

import Foundation

struct Launch: Codable, Identifiable {

    var id: Int
    var missionName: String
    var missionId: [String]
    var launchYear: String
    var launchDateUtc: String
    var isTentative: Bool
    var tentativeMaxPercision: String
    var tbd: Bool
    var launchWindow: Int
    var rocket: Rocket
    var ships: [String]
    var launchSite: LaunchSite
    var launchSuccess: Bool
    var links: Links
    var details: String
    var upcoming: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id = "flight_number", missionName = "mission_name", missionId = "mission_id", launchYear = "launch_year", launchDateUtc = "launch_date_utc", isTentative = "is_tentative", tentativeMaxPercision =
            "tenative_max_percision", tbd, launchWindow = "launch_window", rocket, ships, launchSite = "launch_site", launchSuccess = "launch_success", links, details, upcoming
    }
    
}

struct Rocket: Codable {
    
    var rocketId: String
    var rocketName: String
    var rocketType: String
    var firstStage: FirstStage
    var secondStage: SecondStage
    var fairings: Fairings
    
    private enum CodingKeys: String, CodingKey {
        case rocketId = "rocket_id", rocketName = "rocket_name", rocketType = "rocket_type", firstStage = "first_stage", secondStage = "secondStage", fairings
    }

}

struct FirstStage: Codable {

    var cores: [Cores]
    
}

struct Cores: Codable {
    
    var coreSerial: String
    var flight: Int
    var block: Int
    var gridfins: Bool
    var legs: Bool
    var reused: Bool
    var landSuccess: Bool
    var landingIntent: Bool
    var landingType: String
    var landingVehicle: String
    
    private enum CodingKeys: String, CodingKey {
        case coreSerial = "core_serial", flight, block, gridfins, legs, reused, landSuccess = "land_success", landingIntent = "landing_intent", landingType = "landing_type", landingVehicle = "landing_vehicle"
    }
    
}

struct SecondStage: Codable {
    
    var block: Int
    var payloads: [Payloads]
    
}

struct Payloads: Codable {
    
    var payloadId: String
    var noradId: [String]
    var reused: Bool
    var customers: [String]
    var nationality: String
    var manufacturer: String
    var payloadType: String
    var payloadMassLbs: Double
    var orbit: String
    
    private enum CodingKeys: String, CodingKey {
        case payloadId = "payload_id", noradId = "norad_id", reused, customers, nationality, manufacturer, payloadType = "payload_type", payloadMassLbs = "payload_mass_lbs", orbit
    }
    
}

struct Fairings: Codable {
    
    var resused: Bool
    var recoveryAttempted: Bool
    var recovered: Bool
    var ship: String
    
    private enum CodingKeys: String, CodingKey {
        case resused, recoveryAttempted = "recovery_attempt", recovered, ship
    }

}

struct LaunchSite: Codable {
    
    var siteId: String
    var siteName: String
    var siteNameLong: String
    
    private enum CodingKeys: String, CodingKey {
        case siteId = "site_id", siteName = "site_name", siteNameLong = "site_name_long"
    }

}

struct Links: Codable {
    
    var missionPatch: String
    var missionPatchSmall: String
    var redditCampaign: String
    var redditLaunch: String
    var redditRecovery: String
    var redditMedia: String
    var presskit: String
    var articleLink: String
    var wikipedia: String
    var videoLink: String
    var youtubeId: String
    var flickrImages: [String]
    
    private enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch", missionPatchSmall = "mission_patch_small", redditCampaign = "reddit_campaign", redditLaunch = "reddit_launch", redditRecovery = "reddit_recovery", redditMedia = "reddit_media", presskit, articleLink = "article)link", wikipedia, videoLink = "video_link", youtubeId = "youtube_id", flickrImages = "flickr_images"
    }
    
}

