// MARK: - Portfolio Header View
struct TransactionSummaryCard: View {
    @Binding var selectedCurrency: CurrencyType
    
    var body: some View {
        VStack(spacing: 20) {
            // Top bar with menu and notifications
            HStack {
                Button(action: {}) {
                    Image(systemName: "line.3.horizontal")
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bell")
                }
            }
            .font(.system(size: 24))
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            
            // Portfolio Card
            VStack(spacing: 16) {
                // Currency Badge
                HStack {
                    Spacer()
                    Text("INR")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.2))
                        )
                    Spacer()
                }
                
                // Portfolio Amount
                VStack(spacing: 8) {
                    Text("1,57,342.05")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 12) {
                        Text("₹1,342")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white.opacity(0.7))
                        
                        Text("+4.6%")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.green)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 30)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 0.4, green: 0.35, blue: 0.8),
                                Color(red: 0.2, green: 0.25, blue: 0.6)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            .padding(.horizontal, 20)
        }
    }
}