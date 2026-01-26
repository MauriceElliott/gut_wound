import PlaydateKit

enum Scene {
    case mainLoop
    case paused
    case startMenu
}

@PlaydateMain
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
    override init() {
        super.init()
        image = try! Graphics.Bitmap(path: "Images/test_room.png")
        bounds = .init(x: 0, y: 0, width: 400, height: 240)
    }

    override func update() {

    }
}
