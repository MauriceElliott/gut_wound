import PlaydateKit

class Room: Sprite.Sprite {
    init(roomImagePath: String) {
        super.init()
        self.image = try! Graphics.Bitmap(path: roomImagePath)
        self.bounds = .init(x: 0, y: 0, width: 400, height: 240)
        self.addToDisplayList()
    }
    override func update() {
    }
}
