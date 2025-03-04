--[[pod_format="raw",created="2024-05-06 22:22:02",modified="2025-03-04 21:57:20",revision=6912]]
class={
	new=
		function(self,tbl)
			tbl=tbl or {}
			setmetatable(tbl, {
				__index=self
				}
			)
			return tbl
		end,
}

entity=class:new({
	x=0,
	y=0,
})

container_slot=entity:new({
	container_id = 1,
	quantity = 0,
	item = nil,
	starting_x = 0,
	starting_y = 0,
	ending_x = 0,
	ending_y = 0,
})

object_type={
	item=1,
}

button={
	up=4,
	down=8,
	left=1,
	right=2,
	down_right=10,
	up_left=5,
	up_right=6,
	down_left=9,
	none=0
}

direction={
	up = 1,
	down = 2,
	left = 3,
	right = 4
}