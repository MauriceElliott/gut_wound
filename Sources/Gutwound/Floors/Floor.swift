import PlaydateKit

class Floor {
    var rooms: Array<Room>
    init(rooms: Array<Room> = Array<Room>(arrayLiteral: Room(roomImagePath: "Images/test_room.png"))) {
        self.rooms = rooms
        for room in self.rooms {
            room.isVisible = true
        }
    }
    
    func update() {
        
    }
}
