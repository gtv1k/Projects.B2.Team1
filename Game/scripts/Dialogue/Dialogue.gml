///@description create_dialogue
///@arg Text
///@arg Speaker
///@arg *Effects
///@arg *Speed
///@arg *Type
///@arg *Next_Line
///@arg *Scripts
///@arg *Text_Col
///@arg *Emotion
///@arg *Emote
function create_dialogue() {

	if(instance_exists(obj_textbox)){ exit; }

	//Create the Textbox
	var _textbox = instance_create_layer(x,y, "Text", obj_textbox);
	with(obj_textbox) var _dcol = default_col;

	//Get Arguments
	var arg = 0, i = 0, arg_count = argument_count;
	repeat(arg_count){ arg[i] = argument[i]; i++; } 

	//Get arguments
	var _text = arg[0];
	var _speaker, text_len;

	//If Text or Speaker aren't arrays (single line input), make them arrays 
	if(is_array(_text))		{ text_len = array_length_1d(_text); }
	else					{ text_len = 1; _text[0] = _text;  }
	if(!is_array(arg[1]))	{ _speaker = array_create(text_len, id); }
	else					{ _speaker = arg[1]; }

	//Get rest of arguments, fill with default
	var _effects	= array_create(text_len, [1,0]);
	var _speed		= array_create(text_len, [1,0.5]);
	var _textcol	= array_create(text_len, [1,_dcol]);
	var _type		= array_create(text_len, 0);
	var _nextline	= array_create(text_len, 0);
	var _script		= array_create(text_len, 0);
	var _emotion	= array_create(text_len, 0);
	var _emotes		= array_create(text_len, -1);
	var _creator	= array_create(text_len, id);

	var a;
	//Fill variables depending on argument count
	switch(arg_count-1){
		case 9:	a = arg[9]; if(array_length_1d(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _emotes[i] = a[i]; }
		case 8: a = arg[8]; if(array_length_1d(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _emotion[i] = a[i]; }
		case 7: a = arg[7];	if(array_length_1d(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _textcol[i] = a[i]; }
		case 6: a = arg[6];	if(array_length_1d(a) != text_len){ a[text_len] =-1; } for(i = 0; i < text_len; i++){ if(a[i] !=-1) _script[i] = a[i]; }
		case 5: a = arg[5];	if(array_length_1d(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _nextline[i] = a[i]; }
		case 4: a = arg[4];	if(array_length_1d(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _type[i] = a[i]; }
		case 3: a = arg[3];	if(array_length_1d(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _speed[i] = a[i]; }
		case 2: a = arg[2];	if(array_length_1d(a) != text_len){ a[text_len] = 0; } for(i = 0; i < text_len; i++){ if(a[i] != 0) _effects[i] = a[i]; }
	}

	//Change the Textbox Values
	with(_textbox){
		creator		= _creator;
		effects		= _effects;
		text_speed	= _speed;
		type		= _type;
		text		= _text;
		nextline	= _nextline;
		executeScript = _script;
		text_col	= _textcol;
		emotion		= _emotion;	
		emotes		= _emotes;
	
		//Speaker's Variables
		i = 0; repeat(text_len){
			portrait[i]			= _speaker[i].myPortrait;
			voice[i]			= _speaker[i].myVoice;
			font[i]				= _speaker[i].myFont;
			name[i]				= _speaker[i].myName;
			speaker[i]			= _speaker[i];
		
			if(variable_instance_exists(_speaker[i], "myPortraitTalk"))		{ portrait_talk[i] = _speaker[i].myPortraitTalk; }
			else { portrait_talk[i] = -1; }
			if(variable_instance_exists(_speaker[i], "myPortraitTalk_x"))	{ portrait_talk_x[i] = _speaker[i].myPortraitTalk_x; }
			else { portrait_talk_x[i] = -1; }
			if(variable_instance_exists(_speaker[i], "myPortraitTalk_y"))	{ portrait_talk_y[i] = _speaker[i].myPortraitTalk_y; }
			else { portrait_talk_y[i] = -1; }
			if(variable_instance_exists(_speaker[i], "myPortraitIdle"))		{ portrait_idle[i] = _speaker[i].myPortraitIdle; }
			else { portrait_idle[i] = -1; }
			if(variable_instance_exists(_speaker[i], "myPortraitIdle_x"))	{ portrait_idle_x[i] = _speaker[i].myPortraitIdle_x; }
			else { portrait_idle_x[i] = -1; }
			if(variable_instance_exists(_speaker[i], "myPortraitIdle_y"))	{ portrait_idle_y[i] = _speaker[i].myPortraitIdle_y; }
			else { portrait_idle_y[i] = -1; }
		
		
			if(portrait_talk[i] != -1){ 
				portrait_talk_n[i] = sprite_get_number(portrait_talk[i]);
				portrait_talk_s[i] = sprite_get_speed(portrait_talk[i])/room_speed;
			}
			if(portrait_idle[i] != -1){ 
				portrait_idle_n[i] = sprite_get_number(portrait_idle[i]);
				portrait_idle_s[i] = sprite_get_speed(portrait_idle[i])/room_speed;
			}
			i++;
		}
	
		draw_set_font(font[0]);
		charSize = string_width("M");
		stringHeight = string_height("M");
		event_perform(ev_alarm, 0);	//makes textbox perform "setup"
	}

	myTextbox = _textbox;
	return _textbox;


}

///@description create_textevent
///@arg Text
///@arg Speaker
///@arg *Effects
///@arg *Speed
///@arg *Type
///@arg *Next_Line
///@arg *Scripts
///@arg *Text_Col
///@arg *Emotion
///@arg *Emote
function create_textevent() {

	if(instance_exists(obj_textevent)){ exit; }

	var arg_count = argument_count;
	var i = 0, var arg; repeat(arg_count){
		arg[i] = argument[i];
		i++;
	}

	var textevent = instance_create_layer(0,0,"Instances",obj_textevent);

	with(textevent){
		reset_dialogue_defaults();
	
		switch(arg_count-1){
			case 9: myEmote		= arg[9];
			case 8: myEmotion	= arg[8];
			case 7: myTextCol	= arg[7];
			case 6: myScripts	= arg[6];
			case 5: myNextLine	= arg[5];
			case 4: myTypes		= arg[4];
			case 3: myTextSpeed	= arg[3];
			case 2: myEffects	= arg[2];
		}
		mySpeaker	= arg[1];
		myText		= arg[0];
	
		event_perform(ev_other, ev_user0);
	}

	return textevent;


}

///@description reset_dialogue_defaults
function reset_dialogue_defaults() {

	myTextbox			= noone;
	myText				= -1;
	mySpeaker			= -1;
	myEffects			= 0;
	myTextSpeed			= 0;
	myTypes				= 0;
	myNextLine			= 0;
	myScripts			= 0;
	myTextCol			= 0;
	myEmotion			= 0;
	myEmote				= -1;


}
	
	///@description script_execute_alt
///@arg ind
///@arg [arg1,arg2,...]
function script_execute_alt(argument0, argument1) {

	var s = argument0;
	var a = argument1;
	var len = array_length_1d(argument1);

	switch(len){
		case 0 : script_execute(s); break;
		case 1 : script_execute(s, a[0]); break;
		case 2:  script_execute(s, a[0], a[1]); break;
		case 3:  script_execute(s, a[0], a[1], a[2]); break;
		case 4:  script_execute(s, a[0], a[1], a[2], a[3]); break;
		case 5:  script_execute(s, a[0], a[1], a[2], a[3], a[4]); break;
		case 6:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5]); break;
		case 7:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6]); break;
		case 8:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]); break;
		case 9:  script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]); break;
		case 10: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]); break;
		case 11: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]); break;
		case 12: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]); break;
		case 13: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]); break;
		case 14: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]); break;
		case 15: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]); break;
		case 16: script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15]); break;
	}




}
	
	///@description change_variable
///@arg obj
///@arg var_name_as_string
///@arg new_value
function change_variable(argument0, argument1, argument2) {

	with(argument0) var oid = id;
	variable_instance_set(oid, argument1, argument2);


}
	
	///@description create_instance_layer
///@arg x
///@arg y
///@arg layer
///@arg obj
function create_instance_layer(argument0, argument1, argument2, argument3) {
	var ax = argument0;
	var ay = argument1;
	var al = argument2;
	var o = argument3;
	instance_create_layer(ax,ay,al,o);


}



