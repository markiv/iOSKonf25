//
//  DeparturesView.swift
//  iOSKonf25
//
//  Created by Vikram Kriplaney on 25.04.2025.
//

import SwiftUI

struct Country: Identifiable, Codable {
    let id, name, capital, flag: String
    static let all = [Country](json: "capitals")
}

struct Departure: Identifiable, Hashable {
    enum Status: String {
        case onTime
        case boarding
        case delayed
        case cancelled
        case closed

        var color: Color {
            switch self {
            case .onTime: .green
            case .boarding: .orange
            case .delayed: .purple
            case .cancelled, .closed: .red
            }
        }
    }

    let id: UUID
    let destination: String
    var time: Date
    var status = Status.onTime

    static func random() -> Self {
        let country = Country.all.randomElement()!
        return .init(
            id: UUID(),
            destination: country.flag + " " + country.capital,
            time: .now.addingTimeInterval(.random(in: 10...30))
        )
    }
}

struct StatusBadge: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .textCase(.uppercase)
            .font(.caption2)
            .foregroundStyle(.white)
            .padding(2)
            .padding(.horizontal, 2)
            .background(color, in: .rect(cornerRadius: 3))
    }
}

@Observable class ListViewModel {
    var departures: [Departure] = (1...12).map { _ in
        Departure.random()
    }
    .sorted { $0.time < $1.time }

    func simulate() {
        for (index, departure) in departures.enumerated() {
            switch departure.status {
            case .onTime, .delayed:
                if Int.random(in: 0...9) == 0 {
                    departures[index].time += .random(in: 5...20)
                    departures[index].status = .delayed
                }
                if departure.time < .now + 10 {
                    departures[index].status = .boarding
                }
            case .boarding where departure.time < .now:
                departures[index].status = .closed
            case .delayed where Int.random(in: 0...9) == 0:
                departures[index].status = .cancelled
            default: break
            }
        }
        if departures.count < 10 {
            departures.append(Departure.random())
        }
        departures = departures
            .filter { $0.time.timeIntervalSinceNow > -5 }
            .sorted { $0.time < $1.time }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.simulate()
        }
    }
}

struct DeparturesView: View {
    var viewModel = ListViewModel()

    var body: some View {
        List {
            Section {
                HStack {
                    Text("Departures").bold()
                    Spacer()
                    TimelineView(.periodic(from: .now, by: 1)) {
                        Text($0.date, format: .dateTime.hour().minute().second())
                            .animation(.bouncy)
                            .contentTransition(.numericText())
                    }
                }
            }
            Section {
                ForEach(viewModel.departures) { departure in
                    HStack {
                        Text(departure.destination)
                        Spacer()
                        Text(departure.status.rawValue)
                            .modifier(StatusBadge(color: departure.status.color))
                        Text(departure.time, format: .dateTime.hour().minute().second())
                    }
                }
            }
        }
        .monospacedDigit()
        .animation(.default, value: viewModel.departures)
        .onAppear {
            viewModel.simulate()
        }
    }
}

#Preview {
    NavigationStack {
        DeparturesView()
    }
}
