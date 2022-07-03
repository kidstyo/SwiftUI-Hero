//
//  JustWidgets.swift
//  JustWidgets
//
//  Created by kidstyo on 2022/7/3.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct JustWidgetsEntryView : View {
    var entry: Provider.Entry
    @AppStorage(THEME_KEY, store: UserDefaults(suiteName: GROUP_ID)) var appTheme: Theme = .classic

    @AppStorage(PRO_COLOR_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proColor: Color = Theme.orange.mainColor

    var body: some View {
        Text(entry.date, style: .time)
            .foregroundColor(appTheme != .custom ? appTheme.mainColor : proColor)
    }
}

@main
struct JustWidgets: Widget {
    let kind: String = "JustWidgets"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            JustWidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("Hello Widget")
        .description("This is an example widget.")
    }
}

struct JustWidgets_Previews: PreviewProvider {
    static var previews: some View {
        JustWidgetsEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
