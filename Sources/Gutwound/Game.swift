import PlaydateKit

enum Scene {
    case mainLoop
    case paused
    case startMenu
}

final class Game: PlaydateGame {
    let gameScene: Scene = .startMenu
    init() {
        room.addToDisplayList()
    }

    let room = Room()

    func update() -> Bool {
        Sprite.updateAndDrawDisplayListSprites()
        return true
    }

    func gameWillPause() {
        
    }
}

class Room: Sprite.Sprite {
    let collisionMap: Graphics.Bitmap
    let flagsMap: Graphics.Bitmap
    override init() {
        super.init()
        image = try! Graphics.Bitmap(path: "test_room.png")
        collisionMap = try! Graphics.Bitmap(path: "test_room_collission_map.png")
        flagsMap = try! Graphics.Bitmap(path: "test_room_flags_map.png")
        bounds = .init(x: 0, y: 0, width: 400, height: 240)
    }

    override func update() {

    }
}
