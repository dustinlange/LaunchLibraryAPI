//
//  Rocket.swift
//  
//
//  Created by Dustin Lange on 6/23/19.
//

import Foundation

public struct Rocket {
    /// Rocket identifier
    /// Available in modes: L, S, V
    public let id: Int
    
    /// The name of the rocket
    /// Available in modes: L, S, V
    public let name: String?
    
    /// Describes the configuration of the rocket
    /// Available in modes: L, S, V
    public let configuration: String?
    
    /// A comma delimited string of default launch pad IDs
    /// Available in modes: L, S, V
    public let defaultPads: String?

    /// Rocket family
    /// Available in modes: S, V
    public let family: RocketFamily?

    /// Collection of info URLs
    /// Available in modes: V
    public let infoURLs: [String]?

    /// Wiki URL
    /// Available in modes: V
    public let wikiURL: String?

    /// Image URL
    /// All images are either public domain, or permission has been obtained for
    /// use by those using the Launch Library. Please set these images to cache,
    /// and do not pull them every time. They are saved with different widths,
    /// maintaining the aspect ratio of the original image. The url returned in
    /// imageURL is the largest image available for that rocket.
    /// Available in modes: V
    public let imageURL: String?

    /// Collection of available image sizes
    /// If you wish to pull a smaller image, select one of the widths from
    /// imageSizes, and replace it with the width in imageURl
    /// Available in modes: V
    public let imageSizes: [Int]?
    
    /// The date this resource last changed
    /// Available in modes: V
    public let changed: String?
}

extension Rocket: Codable { }

extension Rocket: CodableResponse {
    public static var arrayKey: String {
        return "rockets"
    }
}
