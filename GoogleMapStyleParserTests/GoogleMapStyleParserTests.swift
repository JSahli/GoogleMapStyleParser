//
//  GoogleMapStyleParserTests.swift
//  GoogleMapStyleParserTests
//
//  Created by Jesse Sahli on 4/7/18.
//  Copyright © 2018 JS. All rights reserved.
//

import XCTest
@testable import GoogleMapStyleParser


class GoogleMapStyleParserTests: XCTestCase {
    
    var mapStyleJSON: [[String: Any]] = [
        [
            "featureType": "administrative",
            "elementType": "labels.text.fill",
            "stylers": [
                [
                    "color": "#444444"
                ]
            ]
        ],
        [
            "featureType": "landscape",
            "stylers": [
                [
                    "color": "#fafafa"
                ],
                [
                    "visibility": "on"
                ]
            ]
        ],
        [
            "featureType": "landscape",
            "elementType": "labels.text",
            "stylers": [
                [
                    "color": "#e03131"
                ],
                [
                    "visibility": "off"
                ]
            ]
        ],
        [
            "featureType": "poi",
            "stylers": [
                [
                    "visibility": "off"
                ]
            ]
        ],
        [
            "featureType": "poi.park",
            "elementType": "geometry.fill",
            "stylers": [
                [
                    "color": "#a6e168"
                ],
                [
                    "visibility": "on"
                ]
            ]
        ],
        [
            "featureType": "road",
            "stylers": [
                [
                    "saturation": -100
                ],
                [
                    "lightness": 45
                ],
                [
                    "visibility": "simplified"
                ]
            ]
        ],
        [
            "featureType": "road",
            "elementType": "geometry.fill",
            "stylers": [
                [
                    "color": "#f0f0f0"
                ],
                [
                    "visibility": "on"
                ]
            ]
        ],
        [
            "featureType": "road",
            "elementType": "labels",
            "stylers": [
                [
                    "visibility": "off"
                ]
            ]
        ],
        [
            "featureType": "road",
            "elementType": "labels.icon",
            "stylers": [
                [
                    "visibility": "off"
                ]
            ]
        ],
        [
            "featureType": "road",
            "elementType": "labels.text",
            "stylers": [
                [
                    "visibility": "off"
                ]
            ]
        ],
        [
            "featureType": "road",
            "elementType": "labels.text.fill",
            "stylers": [
                [
                    "color": "#777777"
                ],
                [
                    "visibility": "on"
                ]
            ]
        ],
        [
            "featureType": "road.arterial",
            "elementType": "labels.icon",
            "stylers": [
                [
                    "visibility": "off"
                ]
            ]
        ],
        [
            "featureType": "road.highway",
            "stylers": [
                [
                    "color": "#ffffff"
                ],
                [
                    "visibility": "on"
                ]
            ]
        ],
        [
            "featureType": "road.highway",
            "elementType": "labels.text.fill",
            "stylers": [
                [
                    "color": "#787878"
                ]
            ]
        ],
        [
            "featureType": "transit",
            "stylers": [
                [
                    "visibility": "off"
                ]
            ]
        ],
        [
            "featureType": "transit.station",
            "stylers": [
                [
                    "visibility": "on"
                ]
            ]
        ],
        [
            "featureType": "water",
            "stylers": [
                [
                    "color": "#199bd0"
                ],
                [
                    "visibility": "on"
                ]
            ]
        ],
        [
            "featureType": "water",
            "elementType": "geometry.fill",
            "stylers": [
                [
                    "color": "#00caff"
                ],
                [
                    "gamma": "3.50"
                ],
                [
                    "visibility": "on"
                ]
            ]
        ]
    ]

    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let expectedURLString = "&style=feature:administrative%7Celement:labels.text.fill%7Ccolor:0x444444&style=feature:landscape%7Ccolor:0xfafafa%7Cvisibility:on&style=feature:landscape%7Celement:labels.text%7Ccolor:0xe03131%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0xa6e168%7Cvisibility:on&style=feature:road%7Csaturation:-100%7Clightness:45%7Cvisibility:simplified&style=feature:road%7Celement:geometry.fill%7Ccolor:0xf0f0f0%7Cvisibility:on&style=feature:road%7Celement:labels%7Cvisibility:off&style=feature:road%7Celement:labels.icon%7Cvisibility:off&style=feature:road%7Celement:labels.text%7Cvisibility:off&style=feature:road%7Celement:labels.text.fill%7Ccolor:0x777777%7Cvisibility:on&style=feature:road.arterial%7Celement:labels.icon%7Cvisibility:off&style=feature:road.highway%7Ccolor:0xffffff%7Cvisibility:on&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0x787878&style=feature:transit%7Cvisibility:off&style=feature:transit.station%7Cvisibility:on&style=feature:water%7Ccolor:0x199bd0%7Cvisibility:on&style=feature:water%7Celement:geometry.fill%7Ccolor:0x00caff%7Cgamma:3.50%7Cvisibility:on"
        
        guard let urlStringConvertedFromJSON = GoogleMapsStyleParser.jsonStyleToUrlStyle(json: mapStyleJSON) else {
            XCTFail("Unable to parse a string from map style JSON")
            return
        }
        XCTAssertEqual(expectedURLString, urlStringConvertedFromJSON)
    }
}

