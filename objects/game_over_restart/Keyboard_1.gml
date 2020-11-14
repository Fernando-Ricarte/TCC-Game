   /// @description Insert description here
// You can write your code in this editor

//show_message_async( global.roomDeath );
number_room = asset_get_index( global.roomDeath );
room_goto( number_room );
audio_stop_all(); 