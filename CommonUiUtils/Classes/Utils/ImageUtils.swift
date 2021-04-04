//
//  ImageUtils.swift
//  CommonUiUtils
//
//  Created by clding on 2020/10/06.
//

import UIKit

class ImageUtils: NSObject {
    
    public class func image(withColor color: UIColor, size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    public class func image(withHexString colorStr: String, size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            let color = UIColor(colorStr)
            color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }

    public class func image(withOriImage oriImg: UIImage, ringColor: UIColor, ringBorder border: CGFloat) -> UIImage? {
        if oriImg.pngData() == nil {
            return nil
        }
        if let image = UIImage.init(data: oriImg.pngData()!, scale: oriImg.scale) {
            //image.width
            let imageWH: CGFloat = image.size.width
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: imageWH, height: imageWH), false, oriImg.scale);
            
            image.draw(in: CGRect(origin: .zero, size: CGSize(width: imageWH, height: imageWH)))
            
            //draw ring
            let path = UIBezierPath(ovalIn: CGRect(x: border/2, y: border/2, width: imageWH - 1*border, height: imageWH - 1*border))
            ringColor.set()
            path.lineWidth = border
            path.stroke()
            
            let clipImage = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            return clipImage
        } else {
            return nil
        }
    }
    
    public class func clipWithImageRect(clipFrame: CGRect, oriImage: UIImage) -> UIImage {
        let imgScale = oriImage.scale
        let rect_Scale = CGRect(x: clipFrame.origin.x * imgScale, y: clipFrame.origin.y * imgScale, width: clipFrame.size.width * imgScale, height: clipFrame.size.height * imgScale)
        
        let cgImageCorpped = oriImage.cgImage?.cropping(to: rect_Scale)
        let img_Clip = UIImage.init(cgImage: cgImageCorpped!, scale: imgScale, orientation: oriImage.imageOrientation)
        
        return img_Clip
    }
    
    public class func image(fromView view: UIView?) -> UIImage? {
        guard view != nil else {
            return nil
        }

        UIGraphicsBeginImageContextWithOptions(view!.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        view!.layer.render(in: context!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
 
    public class func image(fromGradients gradientColors: [UIColor], size: CGSize = CGSize(width: 10, height: 10), locations: [Float] = [], isVertical: Bool = true) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = gradientColors.map {(color: UIColor) -> AnyObject? in return color.cgColor as AnyObject? } as NSArray
        let gradient: CGGradient
        if locations.count > 0 {
            let cgLocations = locations.map { CGFloat($0) }
            gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: cgLocations)!
        } else {
            gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil)!
        }
        let startPoint = isVertical ? CGPoint(x: 0, y: 0) : CGPoint(x: 0, y: 0)
        let endPoint = isVertical ? CGPoint(x: 0, y: size.height) : CGPoint(x: size.width, y: 0)
        context!.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        
        let img = UIImage(cgImage:(UIGraphicsGetImageFromCurrentImageContext()?.cgImage!)!)
        UIGraphicsEndImageContext()
        
        return img
    }
}
