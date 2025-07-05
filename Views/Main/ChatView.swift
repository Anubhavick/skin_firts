import SwiftUI

// Model for a single message
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isFromCurrentUser: Bool
}

struct ChatView: View {
    // Mock messages for the conversation
    let messages: [Message] = [
        Message(text: "Hello! I have a question about my recent appointment.", isFromCurrentUser: true),
        Message(text: "Of course, I'm here to help. What can I assist you with today?", isFromCurrentUser: false),
        Message(text: "I was wondering about the prescription you mentioned.", isFromCurrentUser: true),
        Message(text: "Certainly. I've sent the details to your registered pharmacy. You should be able to pick it up this afternoon.", isFromCurrentUser: false)
    ]
    
    // State for the message input field
    @State private var newMessage = ""

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(messages) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding()
            }
            
            // Message Input Field
            HStack {
                TextField("Type a message...", text: $newMessage)
                    .padding(12)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Button(action: {
                    // Action to send message
                    newMessage = ""
                }) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .navigationTitle("Dr. Olivia Turner")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// A reusable view for the chat bubble
struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer()
            }
            
            Text(message.text)
                .padding()
                .background(message.isFromCurrentUser ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(message.isFromCurrentUser ? .white : .primary)
                .cornerRadius(16)
            
            if !message.isFromCurrentUser {
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
