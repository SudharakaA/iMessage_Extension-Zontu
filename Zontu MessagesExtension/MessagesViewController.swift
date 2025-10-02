//
//  MessagesViewController.swift
//  Zontu MessagesExtension
//
//  Created by Sudharaka Ashen on 10/2/25.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    // MARK: - UI Components
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var quickMessagesButton: UIButton!
    @IBOutlet weak var pollButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var stickersButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground
        
        // Create header label
        let headerLabel = UILabel()
        headerLabel.text = "🌟 Zontu"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel.textAlignment = .center
        headerLabel.textColor = UIColor.systemBlue
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create stack view for buttons
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create buttons
        let quickMessagesButton = createFeatureButton(
            title: "📝 Quick Messages",
            action: #selector(quickMessagesPressed)
        )
        
        let pollButton = createFeatureButton(
            title: "📊 Create Poll",
            action: #selector(pollPressed)
        )
        
        let locationButton = createFeatureButton(
            title: "📍 Share Location",
            action: #selector(locationPressed)
        )
        
        let stickersButton = createFeatureButton(
            title: "😄 Fun Stickers",
            action: #selector(stickersPressed)
        )
        
        // Add buttons to stack view
        stackView.addArrangedSubview(quickMessagesButton)
        stackView.addArrangedSubview(pollButton)
        stackView.addArrangedSubview(locationButton)
        stackView.addArrangedSubview(stickersButton)
        
        // Add views to main view
        view.addSubview(headerLabel)
        view.addSubview(stackView)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        // Store references
        self.headerLabel = headerLabel
        self.quickMessagesButton = quickMessagesButton
        self.pollButton = pollButton
        self.locationButton = locationButton
        self.stickersButton = stickersButton
        self.stackView = stackView
    }
    
    private func createFeatureButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.1
        button.layer.shadowRadius = 4
        button.addTarget(self, action: action, for: .touchUpInside)
        
        // Set minimum height
        button.heightAnchor.constraint(greaterThanOrEqualTo: button.heightAnchor, constant: 44).isActive = true
        
        return button
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dismisses the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
        // Use this method to finalize any behaviors associated with the change in presentation style.
        
        // Adjust UI based on presentation style
        if presentationStyle == .compact {
            // Show compact view
            stackView.axis = .horizontal
            headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
        } else {
            // Show expanded view
            stackView.axis = .vertical
            headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        }
    }
    
    // MARK: - Button Actions
    @objc private func quickMessagesPressed() {
        showQuickMessagesView()
    }
    
    @objc private func pollPressed() {
        showPollCreationView()
    }
    
    @objc private func locationPressed() {
        shareLocation()
    }
    
    @objc private func stickersPressed() {
        showStickersView()
    }
    
    // MARK: - Feature Implementation
    private func showQuickMessagesView() {
        let alertController = UIAlertController(title: "Quick Messages", message: "Choose a message template", preferredStyle: .actionSheet)
        
        let templates = [
            ("👍 On my way!", "I'm on my way! See you soon!"),
            ("⏰ Running late", "Sorry, I'm running a bit late. Be there in 10 minutes!"),
            ("✅ Done!", "All done! ✅"),
            ("🤔 Let me think", "Let me think about it and get back to you"),
            ("📞 Call me", "Give me a call when you get a chance 📞"),
            ("🎉 Congratulations!", "Congratulations! So happy for you! 🎉")
        ]
        
        for (title, message) in templates {
            alertController.addAction(UIAlertAction(title: title, style: .default) { _ in
                self.sendMessage(text: message)
            })
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let popover = alertController.popoverPresentationController {
            popover.sourceView = quickMessagesButton
            popover.sourceRect = quickMessagesButton.bounds
        }
        
        present(alertController, animated: true)
    }
    
    private func showPollCreationView() {
        let alertController = UIAlertController(title: "Create Poll", message: "What would you like to ask?", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter your question..."
        }
        
        alertController.addAction(UIAlertAction(title: "Create", style: .default) { _ in
            if let question = alertController.textFields?.first?.text, !question.isEmpty {
                self.createPoll(question: question)
            }
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alertController, animated: true)
    }
    
    private func shareLocation() {
        let message = "📍 I'm sharing my location with you via Zontu!"
        sendMessage(text: message, type: .location)
    }
    
    private func showStickersView() {
        let alertController = UIAlertController(title: "Zontu Stickers", message: "Choose a sticker", preferredStyle: .actionSheet)
        
        let stickers = ["🌟", "🚀", "💫", "⭐", "✨", "🌈", "🎯", "🎨", "🎭", "🎪"]
        
        for sticker in stickers {
            alertController.addAction(UIAlertAction(title: sticker, style: .default) { _ in
                self.sendMessage(text: sticker, type: .sticker)
            })
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let popover = alertController.popoverPresentationController {
            popover.sourceView = stickersButton
            popover.sourceRect = stickersButton.bounds
        }
        
        present(alertController, animated: true)
    }
    
    private func createPoll(question: String) {
        let pollMessage = """
        📊 POLL by Zontu
        
        \(question)
        
        React with:
        👍 for Yes
        👎 for No
        🤷‍♀️ for Maybe
        """
        
        sendMessage(text: pollMessage, type: .poll)
    }
    
    private func sendMessage(text: String, type: ZontuMessageLayout.MessageType = .quickMessage) {
        guard let conversation = activeConversation else { return }
        
        let message = MSMessage()
        
        // Use custom layout
        let customLayout = ZontuMessageLayout(text: text, type: type)
        message.layout = customLayout.createTemplateLayout()
        
        // Create a URL for the message
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "text", value: text),
            URLQueryItem(name: "app", value: "Zontu"),
            URLQueryItem(name: "type", value: String(describing: type))
        ]
        message.url = components.url
        
        conversation.insert(message) { error in
            if let error = error {
                print("Error inserting message: \(error)")
            } else {
                // Request presentation style change to compact after sending
                self.requestPresentationStyle(.compact)
            }
        }
    }

}
