//
//  Constants.swift
//  Base-Project
//
//  Created by Hadi on 7/5/18.
//  Copyright © 2018 Tedmob. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

struct Constants {
    

    struct Network {
        
        static let baseURl : String = "https://google.com"
        static let SessionTokenExpiredCode = -777
        
    }
    
    struct Colors {
        static let appColor : UIColor  = .white
    }
    
    struct UserDefaultsKeys {
        
    }
    
    struct DictionaryKeys {
        
    }
    
    struct DefaultValues {
        
    }
    
    struct ControllersIdentifiers {
        
    }
    
    struct SegueIdentifiers {
        
    }
    
    struct  NSTimerIntervals {
        
    }
    
    struct URLSchemas{
        
        enum Browsers : String{
            case securedChrome = "googlechromes://"
            case notSecuredChrome = "googlechrome://"
            case securedFireFox = "firefox://open-url?url=https://"
            case notSecuredFireFox = "firefox://open-url?url=http://"
            case securedOpera = "opera://open-url?url=https://"
            case notSecuredOpera = "opera://open-url?url=http://"
        }
        
        enum SocialMediaApps : String{
            case whatsapp = "whatsapp://"
        }
    }
    
 
    
    struct ProgressHud {
        struct ProgressStyle {
            static let dark = SVProgressHUDStyle.dark
            static let light = SVProgressHUDStyle.light
        }
        
        struct ProgressAnimationType {
            static let flat = SVProgressHUDAnimationType.flat
            static let native = SVProgressHUDAnimationType.native
            
        }
        static let style = ProgressStyle.dark
        static let animationType = ProgressAnimationType.native
    }
    
    
    struct PlaceHolderView {

        struct Texts {
            static let loading = "LOADING".localized
            static let wait = "PLEASE WAIT".localized
            static let noConnection = "No network connection".localized
            static let retry = "TAP TO RETRY".localized
            static let offline = "You're offline".localized
        }
        
        struct Appearance {
            static let buttonColor : UIColor = .blue
            static let buttonCornerRaduis : CGFloat = 5
            static let buttonTextColor : UIColor = .white
            static let textColor : UIColor = .gray
            static let viewColor : UIColor = .white
            
        }
        
    }
    
    struct Error {
        static let unknown = "Unknown Error".localized
        static let badRequest = "Bad Request".localized
        static let someThingWentWrong = "SomeThing went wrong!".localized
        static let notFound = "Not Found".localized
        static let noInternet = "No internet connection".localized
    }
    
    struct Fonts {
        
        static let boldBody = UIFont.boldSystemFont(ofSize: Constants.FontSizes.body)
        static let boldSubheadline = UIFont.boldSystemFont(ofSize: Constants.FontSizes.subheadline)
        static let largeBold = UIFont.boldSystemFont(ofSize: Constants.FontSizes.largeTitle)
        
        static let largeNormal = UIFont.systemFont(ofSize: Constants.FontSizes.largeTitle)
        static let normal = UIFont.systemFont(ofSize: Constants.FontSizes.body)
        static let small = UIFont.systemFont(ofSize: Constants.FontSizes.caption1)
        
        
        static let largeItalic = UIFont.italicSystemFont(ofSize: Constants.FontSizes.largeTitle)
        static let normalItalic = UIFont.italicSystemFont(ofSize: Constants.FontSizes.body)
        static let smallItalic = UIFont.italicSystemFont(ofSize: Constants.FontSizes.caption1)

    }
    
    struct FontSizes {
        
        static let largeTitle : CGFloat = 34.0
        
        static let  title1  : CGFloat = 28.0
        static let  title2 : CGFloat = 22.0
        static let  title3 : CGFloat = 20.0
        
        static let  body : CGFloat = 17.0
        static let  subheadline : CGFloat = 15.0
        
        
        static let  caption1 : CGFloat = 12.0
        static let  caption2 : CGFloat = 11.0
    }

}
