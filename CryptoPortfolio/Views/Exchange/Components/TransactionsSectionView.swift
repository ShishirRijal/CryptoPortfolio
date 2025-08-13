struct TransactionsSectionView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Section Header
            HStack {
                Text("Transactions")
                Spacer()
                Text("Last 4 days")
                   
             }
            .font(.system(size: 14, weight: .medium))
            
            // Transaction List
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(transactions, id: \.id) { transaction in
                        TransactionRowView(transaction: transaction)
                    }
                }
            }
            
        }
    }
}