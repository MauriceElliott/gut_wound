import PlaydateKit

@PlaydateMain
final class Game: PlaydateGame {
    let casper = Casper()
    init() {
    }
    func update() -> Bool {
        Sprite.updateAndDrawDisplayListSprites()
        return true
    }

    func gameWillPause() {
        
    }
}
