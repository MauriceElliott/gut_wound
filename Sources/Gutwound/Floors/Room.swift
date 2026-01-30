import PlaydateKit

class Room: Sprite.Sprite {
    init(_ imagePath: String) {
        super.init()
        self.image = try! Graphics.Bitmap(path: imagePath)
        self.bounds = .init(x: 0, y: 0, width: 400, height: 240)
        self.addToDisplayList()
    }
    override func update() {
    }
}
