import UIKit


extension UIColor {
    
    
    static var cl_text_primary_dark: UIColor {
        get { return UIColor("#2F2F2F") }
    }
    static var cl_text_primary_light: UIColor {
        get { return UIColor("#F2F2F2") }
    }
    
    static var cl_text_secondary_dark: UIColor {
        get { return UIColor("#757575") }
    }
    static var cl_text_secondary_light: UIColor {
        get { return UIColor("#757575") }
    }
    
    static var cl_red: UIColor {
        get { return UIColor("#e53935") }
    }
    static var cl_pink: UIColor {
        get { return UIColor("#e91e63") }
    }
    static var cl_purple: UIColor {
        get { return UIColor("#9c27b0") }
    }
    static var cl_deepPurple: UIColor {
        get { return UIColor("#673ab7") }
    }
    static var cl_indigo: UIColor {
        get { return UIColor("#3f51b5") }
    }
    static var cl_blue: UIColor {
        get { return UIColor("#2196f3") }
    }
    static var cl_lightBlue: UIColor {
        get { return UIColor("#03a9f4") }
    }
    static var cl_cyan: UIColor {
        get { return UIColor("#00bcd4") }
    }
    static var cl_teal: UIColor {
        get { return UIColor("#009688") }
    }
    static var cl_green: UIColor {
        get { return UIColor("#4caf50") }
    }
    static var cl_lightGreen: UIColor {
        get { return UIColor("#8bc34a") }
    }
    static var cl_lime: UIColor {
        get { return UIColor("#cddc39") }
    }
    static var cl_yellow: UIColor {
        get { return UIColor("#ffeb3b") }
    }
    static var cl_amber: UIColor {
        get { return UIColor("#ffc107") }
    }
    static var cl_orange: UIColor {
        get { return UIColor("#ff9800") }
    }
    static var cl_deepOrange: UIColor {
        get { return UIColor("#ff5722") }
    }
    static var cl_brown: UIColor {
        get { return UIColor("#795548") }
    }
    static var cl_grey: UIColor {
        get { return UIColor("#9E9E9E") }
    }
    
    static var cl_black_5: UIColor {
        get { return UIColor("#0c000000") }
    }
    static var cl_black_10: UIColor {
        get { return UIColor("#19000000") }
    }
    static var cl_black_20: UIColor {
        get { return UIColor("#33000000") }
    }
    static var cl_black_30: UIColor {
        get { return UIColor("#4D000000") }
    }
    static var cl_black_40: UIColor {
        get { return UIColor("#55000000") }
    }
    static var cl_black_50: UIColor {
        get { return UIColor("#73000000") }
    }
    static var cl_black_60: UIColor {
        get { return UIColor("#90000000") }
    }
    static var cl_black_80: UIColor {
        get { return UIColor("#c2000000") }
    }
    
    
    static var cl_white_10: UIColor {
        get { return UIColor("#19ffffff") }
    }
    static var cl_white_20: UIColor {
        get { return UIColor("#33ffffff") }
    }
    static var cl_white_30: UIColor {
        get { return UIColor("#4Dffffff") }
    }
    static var cl_white_40: UIColor {
        get { return UIColor("#55ffffff") }
    }
    static var cl_white_60: UIColor {
        get { return UIColor("#90ffffff") }
    }
    static var cl_white_80: UIColor {
        get { return UIColor("#c2ffffff") }
    }
    
    
    static var arrColor: Array<UIColor> {
        get {
            return [
                .cl_pink,
                .cl_red,
                .cl_pink,
                .cl_purple,
                .cl_deepPurple,
                .cl_indigo,
                .cl_blue,
                .cl_lightBlue,
                .cl_cyan,
                .cl_teal,
                .cl_green,
                .cl_lightGreen,
                .cl_lime,
                .cl_yellow,
                .cl_amber,
                .cl_orange,
                .cl_deepOrange,
                .cl_brown,
                .cl_grey
            ]
        }
    }
    
    
    convenience init(_ hexFromString: String, _ alpha: CGFloat = 1.0) {
        var cString: String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue: UInt64 = 10066329 //color #999999 if string has wrong format
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt64(&rgbValue)
        }
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return .gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
        
        return NSString(format: "#%06x", rgb) as String
    }
    
    func alpha(_ alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }
}
