// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function control_setup(){
buffer_time = 3;
jump_key_buffered = 0;
jump_key_buffer_timer = 0;

}

function get_controls(){
right_key = keyboard_check(ord("D")) + gamepad_button_check(0, gp_padr);
right_key = clamp(right_key,0,1);



left_key =  keyboard_check(ord("A")) + gamepad_button_check(0, gp_padl);
left_key = clamp(left_key,0,1);

jump_key_pressed = keyboard_check_pressed(vk_space) + gamepad_button_check(0, gp_face1);
jump_key_pressed = clamp(jump_key_pressed,0,1);
jump_key = keyboard_check(vk_space) + gamepad_button_check(0, gp_face1);
jump_key = clamp(jump_key,0,1);



	//jump key buffering
	if jump_key_pressed
	{
		jump_key_buffer_timer = buffer_time;
	}
	if jump_key_buffer_timer > 0
	{
	jump_key_buffered = 1;
	jump_key_buffer_timer--;
	}
	else
	{
	jump_key_buffered = 0;
	}
	
}