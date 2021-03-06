/*
keybind:
	Proxy for performing actions when an associated key is pressed and/or released.
	i.e. move north, open inventory, run, etc.

New()
	Creates a new keybind object.

	Args:
		client/C: the client that is creating the keybind object.

KeyDown()
	Called by a client when the associated key is pressed.

	Returns:
		Success: when an attached client exists.
		Failure: when there is no attached client.

KeyUp()
	Called by a client when the associated key is released.

	Returns:
		Success: when an attached client exists.
		Failure: when there is no attached client.
*/
/keybind
	var/name = ""
	var/client/client

/keybind/New(var/client/C)
	if(istype(C))
		client = C
	..()

/keybind/proc/KeyDown()
	if(!client)
		return FALSE
	return TRUE

/keybind/proc/KeyUp()
	if(!client)
		return FALSE
	return TRUE


//Movement keybinds
//	KeyDown movement keybinds set the appropriate x or y move dir variable, then call the clients MovePlayer proc
//	KeyUp movement keybinds unset the move dir variable, then calls the clients MovePlayer proc
/keybind/north
	name = "Move Up"

/keybind/north/KeyDown()
	if(!..())
		return
//	client.North()
	client.move_dir_y = NORTH
	client.last_axis = Y_AXIS
	client.MovePlayer()

/keybind/north/KeyUp()
	if(!..())
		return

	if(client.move_dir_y == NORTH)
		client.move_dir_y = 0
	if(client.move_dir_x)
		client.last_axis = X_AXIS

	client.MovePlayer()

/keybind/south
	name = "Move Down"

/keybind/south/KeyDown()
	if(!..())
		return
//	client.South()
	client.move_dir_y = SOUTH
	client.last_axis = Y_AXIS
	client.MovePlayer()

/keybind/south/KeyUp()
	if(!..())
		return

	if(client.move_dir_y == SOUTH)
		client.move_dir_y = 0
	if(client.move_dir_x)
		client.last_axis = X_AXIS

	client.MovePlayer()

/keybind/east
	name = "Move Right"

/keybind/east/KeyDown()
	if(!..())
		return
//	client.East()
	client.move_dir_x = EAST
	client.last_axis = X_AXIS
	client.MovePlayer()

/keybind/east/KeyUp()
	if(!..())
		return

	if(client.move_dir_x == EAST)
		client.move_dir_x = 0
	if(client.move_dir_y)
		client.last_axis = Y_AXIS

	client.MovePlayer()

/keybind/west
	name = "Move Left"

/keybind/west/KeyDown()
	if(!..())
		return
//	client.West()
	client.move_dir_x = WEST
	client.last_axis = X_AXIS
	client.MovePlayer()

/keybind/west/KeyUp()
	if(!..())
		return

	if(client.move_dir_x == WEST)
		client.move_dir_x = 0
	if(client.move_dir_y)
		client.last_axis = Y_AXIS

	client.MovePlayer()

/keybind/run
	name = "Run"

/keybind/run/KeyDown()
	if(!..())
		return

	if(client.toggle_run)
		client.run_state = !client.run_state
	else
		client.run_state = TRUE

	client.Run()

/keybind/run/KeyUp()
	if(!..())
		return

	if(client.toggle_run)
		return

	client.run_state = FALSE
	client.Run()

/keybind/modifyhud
	name = "Modify HUD"

/keybind/modifyhud/KeyDown()
	if(!..())
		return

	client.modify_hud = !client.modify_hud
	client.ModifyHUD()
