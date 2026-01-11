import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    // MARK: Lifecycle

    init() {
        room.addToDisplayList()
    }

    // MARK: Internal

    let room = Room()

    func update() -> Bool {
        Sprite.updateAndDrawDisplayListSprites()
        System.drawFPS()
        return true
    }

    func gameWillPause() {
        print("Paused!")
    }
}

// MARK: - Logo

class Room: Sprite.Sprite {
    // MARK: Lifecycle

    override init() {
        super.init()
        image = try! Graphics.Bitmap(path: "test_room.png")
        bounds = .init(x: 0, y: 0, width: 400, height: 240)
    }

    // MARK: Internal

    override func update() {
    }
}
