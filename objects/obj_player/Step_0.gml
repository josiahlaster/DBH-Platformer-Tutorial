// Get inputs
 get_controls();

// Movement
// Direction
move_dir = right_key - left_key;

// Get xspd
xspd = move_dir * move_speed;

	// X collision
	var _subPixel = .5;
	if (place_meeting(x + xspd, y, obj_wall))
	{
	    // Scoot up to wall precisely
	    var _pixelCheck = _subPixel * sign(xspd); 
	    while (!place_meeting(x + _pixelCheck, y, obj_wall))
	    {
	        x += _pixelCheck;
	    }

	    // Set xspd to zero to "collide"
	    xspd = 0;   
	}

	// Move
	x += xspd;


// y movement
	//Gravity
	yspd += grav;
	
	//reset and prepare jumping vars
	if on_ground {
    jump_count = 0;
	} else {
	    if jump_count == 0 { jump_count = 1; }
	}

	 //jumping
if jump_key_buffered && jump_count < jump_max {
    jump_key_buffered = false;
    jump_key_buffer_timer = 0;
    jump_count++;  // Increment jump count when in air
    yspd = jspd;   // Apply jump speed
}

	//y collision and movement
	// capping the falling speed
		if yspd >term_vel {yspd = term_vel;};
	
		// collision
			var _subPixel = .5;
		if (place_meeting(x , y+yspd, obj_wall))
		{
		    // Scoot up to wall precisely
		    var _pixelCheck = _subPixel * sign(yspd);
		    while (!place_meeting(x , y+_pixelCheck, obj_wall))
		    {
				
		        y += _pixelCheck;
		    }
			//set yspd to 0 to collide
			yspd = 0;
		}
		
		// set of player is on ground
		if yspd >= 0 && place_meeting(x, y+1,obj_wall) 
		{
			on_ground = true;
		}
		else
		{
			on_ground =false;
		}
		
		//move
		y+= yspd;