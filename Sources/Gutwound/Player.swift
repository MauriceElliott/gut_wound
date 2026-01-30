import PlaydateKit

class Player: Sprite.Sprite {
    var x: Float
    var y: Float
    let width: Float
    let height: Float
    init(_ imagePath: String, x: Float, y: Float, width: Float = 48, height: Float = 66) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        super.init()
        let boundsStartX = self.x - (self.width / 2)
        let boundsStartY = self.y - (self.height / 2)
        self.bounds = .init(x: boundsStartX, y: boundsStartY, width: self.width, height: self.height)
        image = try! Graphics.Bitmap(path: imagePath)
        self.addToDisplayList()
    }
    
    override func update() {
        self.processMove()
    }
    
    func processMove() {
        let buttonState = System.buttonState.current
        if buttonState == PDButtons.down {
            self.moveBy(dx: 0, dy: 1)
        }
        if buttonState == PDButtons.left {
            self.moveBy(dx: -1, dy: 0)
        }
        if buttonState == PDButtons.right {
            self.moveBy(dx: 1, dy: 0)
        }
        if buttonState == PDButtons.up {
            self.moveBy(dx: 0, dy: -1)
        }
    }
}

