//
//  DeliveryDetailsView.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import SwiftUI
import SDWebImageSwiftUI

struct TitleDescriptionView: View {
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Text(description)
        }
    }
}

struct DeliveryDetailsView: View {
    
    @ObservedObject var viewModel: DeliveryDetailsViewModel
    @State private var showingAlert: Bool = false
    var didTapFavouriteButton: () -> Void
    
    var body: some View {
        List {
            Section(header: Text("Route Info")) {
                TitleDescriptionView(title: "From", description: viewModel.delivery.route.start)
                TitleDescriptionView(title: "To", description: viewModel.delivery.route.end)
            }
            
            Section(header: Text("Sender Info")) {
                TitleDescriptionView(title: "Name", description: viewModel.delivery.sender.name)
                TitleDescriptionView(title: "Phone", description: viewModel.delivery.sender.phone)
                TitleDescriptionView(title: "Email", description: viewModel.delivery.sender.email)
            }
            
            Section(header: Text("Things to deliver")) {
                WebImage(url: URL(string: viewModel.delivery.goodsPicture))
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(15)
            }
            
            Section(header: Text("Remarks")) {
                Text(viewModel.delivery.remarks)
                    .multilineTextAlignment(.leading)
            }
            
            Section(header: Text("Charges")) {
                TitleDescriptionView(title: "Delivery Fee", description: viewModel.delivery.deliveryFee)
                TitleDescriptionView(title: "Supercharge Fee", description: viewModel.delivery.surcharge)
                TitleDescriptionView(title: "Total Fee", description: viewModel.calculateTotalDeliveryFee())
            }
            
            Button(viewModel.delivery.isFavourite! ? "Remove from favourites" : "Add to favourites") {
                Task {
                    do {
                        try await viewModel.updateFavouriteStatus()
                        viewModel.delivery.isFavourite?.toggle()
                        showingAlert.toggle()
                        didTapFavouriteButton()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            .tint(viewModel.delivery.isFavourite! ? .red : .blue)
            .alert("Updated your preference", isPresented: $showingAlert) {
                Button("Sweet!", role: .cancel) { }
            }
        }
    }
}

#Preview {
    DeliveryDetailsView(viewModel: .init(delivery: .init(id: "1",
                                                         remarks: "Consectetur culpa reprehenderit excepteur veniam officia aliquip amet",
                                                         pickupTime: "2021-04-12T15:20:33-08:00",
                                                         goodsPicture: "https://loremflickr.com/320/240/dog?lock=1234",
                                                         deliveryFee: "$57.83",
                                                         surcharge: "$23.15",
                                                         route: DeliveryRoute(start: "Harvard Street", end: "Palm Avenue"),
                                                         sender: DeliverySender(name: "Gabriel Reeves", phone: "+1 (432) 695-4891", email: "gabrielreeves@domain.com"),
                                                         isFavourite: false)),
                        didTapFavouriteButton: { () in })
}


