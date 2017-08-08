//
//  Constants.swift
//  ECom
//
//  Created by HyperThink Systems on 27/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import Foundation
import UIKit


// UIColors
let title_Bar_Color = UIColor(red: 146/255, green: 105/255, blue: 162/255, alpha: 1.0)
let borderLightColor = UIColor(red: 69/255, green: 70/255, blue: 79/255, alpha: 0.4)
let purple = UIColor.purple
let blue = UIColor.blue
let green = UIColor.green
let yellow = UIColor.yellow
let orange = UIColor.orange
let red = UIColor.red
let white = UIColor.white
let black = UIColor.black
let lightGray = UIColor.lightGray
let gray = UIColor.gray
let darkGray = UIColor.darkGray
let clear = UIColor.clear
let magenta = UIColor.magenta
let cyan = UIColor.cyan
let brown = UIColor.brown





//UIFonts
let helvetica = "Helvetica"
let helvetica_Bold = "HelveticaNeue-Bold"
let helvetica_New = "Helvetica Neue"





//Arrays
let imageURLArray : [String] = ["https://static.pexels.com/photos/5854/sea-woman-legs-water-medium.jpg", "https://static.pexels.com/photos/6245/kitchen-cooking-interior-decor-medium.jpg", "https://static.pexels.com/photos/6041/nature-grain-moving-cereal-medium.jpg", "https://static.pexels.com/photos/7116/mountains-water-trees-lake-medium.jpg", "https://static.pexels.com/photos/6601/food-plate-yellow-white-medium.jpg", "https://static.pexels.com/photos/6695/summer-sun-yellow-spring-medium.jpg", "https://static.pexels.com/photos/7117/mountains-night-clouds-lake-medium.jpg", "https://static.pexels.com/photos/7262/clouds-ocean-seagull-medium.jpg", "https://static.pexels.com/photos/5968/wood-nature-dark-forest-medium.jpg", "https://static.pexels.com/photos/6101/hands-woman-art-hand-medium.jpg", "https://static.pexels.com/photos/6571/pexels-photo-medium.jpeg", "https://static.pexels.com/photos/6740/food-sugar-lighting-milk-medium.jpg", "https://static.pexels.com/photos/5659/sky-sunset-clouds-field-medium.jpg"]

let itemNameArray : [String] = ["Girl", "Spoons", "Grains", "River", "Cakes", "Flower", "Sky", "Bird", "Forest", "Glass", "Train", "Milk", "field"]
let itemPriceArray : [String] = ["97", "15", "20", "50", "40", "5", "99", "55", "85", "25", "70", "10", "80"]

var cartArray : [[String : String]]! = [[String : String]]()
var dictionary : [String : String] = [String : String]()

var wishListArray : [[String : String]]! = [[String : String]]()
var wishListDictionary : [String : String] = [String : String]()





//Screen Variables
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height





//SharedInstances
let appDelegate_Instance:AppDelegate = UIApplication.shared.delegate as! AppDelegate
let defaults = UserDefaults.standard





