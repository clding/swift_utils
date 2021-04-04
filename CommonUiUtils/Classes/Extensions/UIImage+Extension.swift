//
//  UIImage+Extension.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/30.
//

import UIKit

extension UIImage {
    func aspectFill(inSize: CGSize) -> UIImage? {
        if size.width * size.height == 0 || inSize.width * inSize.height == 0 {
            return nil
        }
        let oriRatio = size.width / size.height
        let toRatio = inSize.width / inSize.height
        
        var toWidth = size.width
        var toHeight = size.height
        if oriRatio > toRatio {
            toWidth = floor(toHeight * toRatio)
        } else {
            toHeight = floor(toWidth / toRatio)
        }
        let scaleRect = CGRect(x: (size.width - toWidth)/2, y: (size.height - toHeight)/2, width: toWidth, height: toHeight)
        
        if let croppedCgImg = self.cgImage?.cropping(to: scaleRect) {
            return UIImage(cgImage: croppedCgImg, scale: scale, orientation: imageOrientation)
        }
        
        return nil
    }
    
    func fixedOrientation() -> UIImage {
        if imageOrientation == .up {
            return self
        }
        
        var transform = CGAffineTransform.identity
        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: CGFloat.pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: CGFloat.pi/2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: -CGFloat.pi/2)
        default: break
        }
        
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default: break
        }

        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        if let tmpCgImage = cgImage {
            let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: tmpCgImage.bitsPerComponent, bytesPerRow: tmpCgImage.bytesPerRow, space: tmpCgImage.colorSpace ?? colorSpace, bitmapInfo: tmpCgImage.bitmapInfo.rawValue)
            
            context?.concatenate(transform)
            
            switch imageOrientation {
            case .left, .leftMirrored, .right, .rightMirrored:
                context?.draw(tmpCgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
            default:
                context?.draw(tmpCgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            }
            
            if let toCGImage = context?.makeImage() {
                return UIImage(cgImage: toCGImage)
            }
        }
        return self
    }
}
