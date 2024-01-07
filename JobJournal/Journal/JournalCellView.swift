//
//  JournalCell.swift
//  JobJournal
//
//  Created by Andres Made on 12/25/23.
//

import SwiftUI

struct JournalCellView: View {
    var journal: JournalModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading, spacing: 10) {
                Text(journal.title)
                    .bold()
                    .font(.headline)
                    .foregroundStyle(journal.colorType)
                Text(journal.desc)
                    .font(.subheadline)
                    .lineLimit(2)
            }
            
            HStack {
                Text(journal.type.capitalized)
                    .font(.caption2)
                    .padding(5)
                    .padding(.horizontal, 5)
                    .bold()
                    .foregroundStyle(journal.colorType)
                    .background(journal.colorType.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                Text(journal.dateAdded.shortDate)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    JournalCellView(journal: JournalModel(dateAdded: .distantPast,
                                      title: "Test Journal",
                                      desc: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architect",
                                      type: .challanges))
}
