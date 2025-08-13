
struct TransactionRowView: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            Image(systemName: transaction.type.iconName)
                .foregroundStyle(.white)
                .frame(width: 24, height: 24)
                .padding(10)
                .background(.gray)
                .cornerRadius(12)
            
            // Transaction Info
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.type.displayName)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                   
                Text(transaction.date)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white.opacity(0.6))
            }
            
            Spacer()
            
            // Amount Info
            VStack(alignment: .trailing, spacing: 4) {
                Text(transaction.coin)
                Text(String(format: "%+.6f", transaction.amount))
            }
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.theme.dark)
        )
    }
}