# 🌟 Zontu - iMessage Extension

Zontu is a feature-rich iMessage extension that enhances your messaging experience with quick templates, polls, location sharing, and fun stickers.

## Features

### 📝 Quick Messages
- Pre-defined message templates for common responses
- Includes: "On my way!", "Running late", "Done!", "Let me think", "Call me", "Congratulations!"
- One-tap sending with beautiful custom layouts

### 📊 Interactive Polls
- Create instant polls in your conversations
- Easy-to-use interface with emoji reactions
- Perfect for making group decisions

### 📍 Location Sharing
- Quick location sharing with formatted messages
- Privacy-conscious with user permission prompts
- Beautiful location message layouts

### 😄 Fun Stickers
- Collection of emoji stickers and reactions
- Custom Zontu-branded message layouts
- Express yourself with style

## Technical Features

- **Custom Message Layouts**: Beautiful, branded message bubbles
- **Adaptive UI**: Works in both compact and expanded presentation modes
- **Smooth Animations**: Polished user experience with smooth transitions
- **Privacy Focused**: Respects user privacy and permissions

## Installation

1. Open the project in Xcode
2. Build and run the app on your iOS device
3. The Zontu iMessage extension will be available in Messages
4. Tap the app store icon in iMessage and select Zontu

## Usage

1. Open iMessage and start a conversation
2. Tap the Apps button (App Store icon)
3. Select Zontu from your installed apps
4. Choose from the available features:
   - **Quick Messages**: Tap to see pre-defined templates
   - **Create Poll**: Make instant polls for group decisions
   - **Share Location**: Send your location with style
   - **Fun Stickers**: Share emoji stickers and reactions

## Requirements

- iOS 12.0 or later
- Xcode 12.0 or later
- Swift 5.0 or later

## Project Structure

```
Zontu/
├── Zontu MessagesExtension/
│   ├── MessagesViewController.swift    # Main controller with UI and features
│   ├── ZontuMessageLayout.swift       # Custom message layouts
│   ├── Info.plist                     # Extension configuration
│   └── Assets.xcassets/              # App icons and images
└── Zontu.xcodeproj/                  # Xcode project file
```

## Customization

### Adding New Quick Messages
Edit the `templates` array in `showQuickMessagesView()` method:

```swift
let templates = [
    ("👍 On my way!", "I'm on my way! See you soon!"),
    // Add your custom templates here

]
```

### Adding New Stickers
Modify the `stickers` array in `showStickersView()` method:

```swift
let stickers = ["🌟", "🚀", "💫", "⭐", "✨", "🌈", "🎯", "🎨", "🎭", "🎪"]
// Add your custom stickers here
```

### Customizing Message Layouts
Edit the `ZontuMessageLayout.swift` file to modify the appearance of message bubbles:

- Change colors by modifying `UIColor` values
- Adjust sizes by changing `CGSize` values
- Add new layout types by extending the `MessageType` enum

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly on iOS devices
5. Submit a pull request

## License

This project is open source. Feel free to use, modify, and distribute as needed.

## Support

For issues or questions, please create an issue in the project repository.

---

--Quick Messages--
<img width="1440" height="900" alt="Screenshot 2025-10-02 at 6 58 28 AM" src="https://github.com/user-attachments/assets/ea340e06-3b58-417d-af19-b7228eb4f380" />

--Creating Polls--
<img width="1440" height="900" alt="Screenshot 2025-10-02 at 6 58 37 AM" src="https://github.com/user-attachments/assets/db071254-327b-4392-80b5-d2e7419eae25" />

--Stickers--
<img width="1440" height="900" alt="Screenshot 2025-10-02 at 6 59 35 AM" src="https://github.com/user-attachments/assets/65f01cd6-87cc-4de9-a769-3381c32c9852" />

--Location Sharing--
<img width="1440" height="900" alt="Screenshot 2025-10-02 at 7 00 30 AM" src="https://github.com/user-attachments/assets/4ca4f15d-d88c-4fdf-af91-61c000950d72" />




