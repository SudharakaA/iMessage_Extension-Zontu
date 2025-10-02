//
//  ZontuMessageLayout.swift
//  Zontu MessagesExtension
//
//  Created by Sudharaka Ashen on 10/2/25.
//

import UIKit
import Messages

class ZontuMessageLayout {
    
    // MARK: - Properties
    private var messageText: String = ""
    private var messageType: MessageType = .quickMessage
    
    enum MessageType {
        case quickMessage
        case poll
        case location
        case sticker
    }
    
    // MARK: - Initialization
    init(text: String, type: MessageType) {
        self.messageText = text
        self.messageType = type
    }
    
    // MARK: - Layout Creation
    func createTemplateLayout() -> MSMessageTemplateLayout {
        let templateLayout = MSMessageTemplateLayout()
        
        switch messageType {
        case .quickMessage:
            templateLayout.image = createQuickMessageImage()
            templateLayout.caption = messageText
            templateLayout.subcaption = "Sent via Zontu 🌟"
            
        case .poll:
            templateLayout.image = createPollImage()
            templateLayout.caption = "Poll Created"
            templateLayout.subcaption = messageText
            
        case .location:
            templateLayout.image = createLocationImage()
            templateLayout.caption = "Location Shared"
            templateLayout.subcaption = "Via Zontu 📍"
            
        case .sticker:
            templateLayout.image = createStickerImage()
            templateLayout.caption = messageText
            templateLayout.subcaption = "Zontu Sticker"
        }
        
        return templateLayout
    }
    
    // MARK: - Image Creation Methods
    private func createQuickMessageImage() -> UIImage? {
        let size = CGSize(width: 200, height: 100)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            // Background
            UIColor.systemBlue.setFill()
            UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: 12).fill()
            
            // Icon
            let iconSize: CGFloat = 30
            let iconRect = CGRect(
                x: (size.width - iconSize) / 2,
                y: 20,
                width: iconSize,
                height: iconSize
            )
            
            UIColor.white.setFill()
            UIBezierPath(ovalIn: iconRect).fill()
            
            // Text
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 12)
            ]
            
            let text = "Quick Message"
            let textSize = text.size(withAttributes: attributes)
            let textRect = CGRect(
                x: (size.width - textSize.width) / 2,
                y: size.height - 30,
                width: textSize.width,
                height: textSize.height
            )
            
            text.draw(in: textRect, withAttributes: attributes)
        }
    }
    
    private func createPollImage() -> UIImage? {
        let size = CGSize(width: 200, height: 100)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            // Background
            UIColor.systemGreen.setFill()
            UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: 12).fill()
            
            // Poll bars
            UIColor.white.setFill()
            let barWidth: CGFloat = 60
            let barHeight: CGFloat = 8
            let spacing: CGFloat = 4
            
            for i in 0..<3 {
                let barRect = CGRect(
                    x: (size.width - barWidth) / 2,
                    y: 30 + CGFloat(i) * (barHeight + spacing),
                    width: barWidth - CGFloat(i * 10),
                    height: barHeight
                )
                UIBezierPath(roundedRect: barRect, cornerRadius: 4).fill()
            }
            
            // Text
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 12)
            ]
            
            let text = "Poll"
            let textSize = text.size(withAttributes: attributes)
            let textRect = CGRect(
                x: (size.width - textSize.width) / 2,
                y: size.height - 20,
                width: textSize.width,
                height: textSize.height
            )
            
            text.draw(in: textRect, withAttributes: attributes)
        }
    }
    
    private func createLocationImage() -> UIImage? {
        let size = CGSize(width: 200, height: 100)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            // Background
            UIColor.systemRed.setFill()
            UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: 12).fill()
            
            // Location pin
            UIColor.white.setFill()
            let pinPath = UIBezierPath()
            let centerX = size.width / 2
            let centerY = size.height / 2 - 10
            
            pinPath.move(to: CGPoint(x: centerX, y: centerY + 15))
            pinPath.addLine(to: CGPoint(x: centerX - 10, y: centerY))
            pinPath.addLine(to: CGPoint(x: centerX + 10, y: centerY))
            pinPath.close()
            pinPath.fill()
            
            let circleRect = CGRect(x: centerX - 8, y: centerY - 8, width: 16, height: 16)
            UIBezierPath(ovalIn: circleRect).fill()
            
            // Text
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 12)
            ]
            
            let text = "Location"
            let textSize = text.size(withAttributes: attributes)
            let textRect = CGRect(
                x: (size.width - textSize.width) / 2,
                y: size.height - 20,
                width: textSize.width,
                height: textSize.height
            )
            
            text.draw(in: textRect, withAttributes: attributes)
        }
    }
    
    private func createStickerImage() -> UIImage? {
        let size = CGSize(width: 200, height: 100)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            // Background
            UIColor.systemPurple.setFill()
            UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: 12).fill()
            
            // Sticker emoji background
            UIColor.white.setFill()
            let emojiBackgroundRect = CGRect(x: 75, y: 25, width: 50, height: 50)
            UIBezierPath(ovalIn: emojiBackgroundRect).fill()
            
            // Text
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 12)
            ]
            
            let text = "Sticker"
            let textSize = text.size(withAttributes: attributes)
            let textRect = CGRect(
                x: (size.width - textSize.width) / 2,
                y: size.height - 20,
                width: textSize.width,
                height: textSize.height
            )
            
            text.draw(in: textRect, withAttributes: attributes)
        }
    }
}