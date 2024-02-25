//
//  DetailSectionCard.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import SwiftUI

struct DetailSectionCard: View {
    let section : DetailViewSection
    let namespace : Namespace.ID
    @Binding var selectedSection : DetailViewSection
    var body: some View {
        Text(section.rawValue)
            .background{
                if section == selectedSection {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.mint)
                        .frame(height: 3)
                        .offset(y : 20)
                        .matchedGeometryEffect(id: "DetailSectionCard", in: namespace)
                }
            }
            .padding()
    }
}

#Preview {
    DetailSectionCard(section: .about, namespace: Namespace().wrappedValue, selectedSection: .constant(.about))
}
