import Foundation

struct Achievement {
    let title: String
    let total: Int
    var current: Int
    var isClaimed: Bool
    
    var progress: String {
        return "\(current)/\(total)"
    }
}

class AchievementsManager {
    static let shared = AchievementsManager()
    
    private let userDefaults = UserDefaults.standard
    
    public var achievements: [Achievement] = [
        Achievement(title: "Buy any upgrade", total: 3, current: 0, isClaimed: false),
        Achievement(title: "Catch 5 Fishes", total: 5, current: 0, isClaimed: false),
        Achievement(title: "Use 3 types of bites", total: 3, current: 0, isClaimed: false),
        Achievement(title: "Play 10 times", total: 10, current: 0, isClaimed: false),
        Achievement(title: "Catch 1 Fish", total: 1, current: 0, isClaimed: false)
    ]
    
    private init() {
        loadAchievements()
    }
    
    // Загрузка достижений из UserDefaults
    private func loadAchievements() {
        for (index, achievement) in achievements.enumerated() {
            let key = achievement.title
            let currentValue = userDefaults.integer(forKey: key)
            achievements[index].current = currentValue
        }
    }
    
    // Получение текущего прогресса по всем достижениям
    func getAchievementsProgress() -> [Achievement] {
        return achievements
    }
    
    // Добавление +1 к текущему значению достижения
    func incrementAchievement(index: Int) {
        
        if achievements[index].current < achievements[index].total {
            achievements[index].current += 1
            userDefaults.set(achievements[index].current, forKey: achievements[index].title)
        }
    }
    
    func isAchievementCompleted(title: String) -> Bool {
        guard let achievement = achievements.first(where: { $0.title == title }) else {
            return false
        }
        return achievement.current >= achievement.total
    }
    
    func claiming(index: Int) {
        if achievements[index].current == achievements[index].total {
            achievements[index].isClaimed = true
            userDefaults.set(achievements[index].current, forKey: achievements[index].title)
        }
    }
    
    func getCurrentPercent() -> String {
        var counter = 0
        for i in achievements {
            if i.total == i.current {
                counter += 1
            }
        }
        return "\(counter)/5"
    }
}
