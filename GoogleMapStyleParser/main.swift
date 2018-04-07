//
//  main.swift
//  GoogleMapStyleParser
//
//  Created by Jesse Sahli on 1/11/18.
//  Copyright © 2018 JS. All rights reserved.
//

import Foundation

class GoogleMapsStyleParser {
    
    private enum Exceptions: String {
        case color
    }

    static func jsonStyleToUrlStyle(json: [[String: Any]]) -> String? {
        var styleUrlString = ""
        for jsonDict in json {
            var styleComponentString = "style="
            guard let feature = jsonDict["featureType"] as? String else {
                return nil
            }
            guard let stylers = jsonDict["stylers"] as? [[String: Any]] else {
                return nil
            }
            styleComponentString.append("feature:\(feature)")
            if let element = jsonDict["elementType"] as? String {
                styleComponentString.append("%7Celement:\(element)")
            }
            for styleDict in stylers {
                for (parameter, argument) in styleDict {
                    
                    if parameter == Exceptions.color.rawValue {
                        guard let argString = argument as? String,
                        let colorCode = convertColorCodes(jsonColorCode: argString) else {
                            return nil
                        }
                        styleComponentString.append("%7C\(parameter):\(colorCode)")
                        continue
                    }
                    styleComponentString.append("%7C\(parameter):\(argument)")
                }
            }
            styleUrlString.append("&\(styleComponentString)")
        }
        return styleUrlString
    }
    
    private static func convertColorCodes(jsonColorCode: String) -> String? {
        let hashtagSet = CharacterSet(charactersIn: "#")
        let urlColorCode = jsonColorCode.trimmingCharacters(in: hashtagSet)
        return "0x\(urlColorCode)"
    }
}

//&style=feature:administrative%7Celement:labels.text.fill%7Ccolor:0x444444&style=feature:landscape%7Ccolor:0xfafafa%7Cvisibility:on&style=feature:landscape%7Celement:labels.text%7Ccolor:0xe03131%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0xa6e168%7Cvisibility:on&style=feature:road%7Csaturation:-100%7Clightness:45%7Cvisibility:simplified&style=feature:road%7Celement:geometry.fill%7Ccolor:0xf0f0f0%7Cvisibility:on&style=feature:road%7Celement:labels%7Cvisibility:off&style=feature:road%7Celement:labels.icon%7Cvisibility:off&style=feature:road%7Celement:labels.text%7Cvisibility:off&style=feature:road%7Celement:labels.text.fill%7Ccolor:0x777777%7Cvisibility:on&style=feature:road.arterial%7Celement:labels.icon%7Cvisibility:off&style=feature:road.highway%7Ccolor:0xffffff%7Cvisibility:on&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0x787878&style=feature:transit%7Cvisibility:off&style=feature:transit.station%7Cvisibility:on&style=feature:water%7Ccolor:0x199bd0%7Cvisibility:on&style=feature:water%7Celement:geometry.fill%7Ccolor:0x00caff%7Cgamma:3.50%7Cvisibility:on

//
//"https://maps.googleapis.com/maps/api/staticmap?center=40.7385,-73.9885&zoom=18&size=600x400&maptype=roadmap&markers=color:red%7C40.7385,-73.9885&key=AIzaSyA2KsiQPWKnLzKu-RSJrZ2SW8VZrmBQTX0"

