function refresh_text_elements(_x = Dialogue_Trigger_Box.x, _y = Dialogue_Trigger_Box.y)
{
    
    text_elements = [];
    //Set all the Scribble t
    //var _x = 450;
    //var _y = 600;
    
    //Iterate over all the content strings
    var _i = 0;
    repeat(ChatterboxGetContentCount(chatterbox))
    {
        //Cache a new text element using the content text Chatterbox found
        var _element = scribble(ChatterboxGetContent(chatterbox, _i));
        
        //Wrap our text so that it doesn't exceed the room's width
        _element.wrap(room_width - 800);
        
        //Create a new typist for the text element, and tell it to start typing in
        var _typist = scribble_typist().in(1, 5);
        
        //Store our new text element and typist
        array_push(text_elements, {
            x: _x,
            y: _y,
            element: _element,
            typist: _typist
        });
        
        //Move down a bit to make each content string look like a paragraph
        _y += _element.get_height(_element) + 2;
        ++_i;
    }
    
    //Ident our options slightly
    _x += 8;
    
    //Space out the options from the content a little too
    _y += 2;
    
    if (ChatterboxIsWaiting(chatterbox))
    {
        //If we're in a waiting state (no options) then we should prompt the user to press space
        array_push(text_elements, {
            x: _x,
            y: _y,
            element: scribble("(Press space)"),
            typist: scribble_typist().in(1, 5)
        });
    }
    else
    {
        var _i = 0;
        repeat(ChatterboxGetOptionCount(chatterbox))
        {
            //Start formatting our string with some colour!
            //switch(_i)
            //{
            //    case 0: var _string = "[#FFFFFF]"; break;
            //    case 1: var _string = "[#FFFFFF]"; break;
            //    case 2: var _string = "[#FFFFFF]"; break;
            //    case 3: var _string = "[#FFFFFF]"; break;
            //}
            
            //Add a number prompt
            _string = string(_i+1) + ") ";
            
            //aaaand add the actual option string too
            _string += ChatterboxGetOption(chatterbox, _i);
            
            //Cache a new text element using our formatted string
            var _element = scribble(_string);
            
            //Wrap our text so that it doesn't exceed the room's width
            _element.wrap(room_width - 200);
            
            //Create a new typist for the text element, and tell it to start typing in
            var _typist = scribble_typist().in(1, 5);
            
            //Store our new text element and typist
            array_push(text_elements, {
                x: _x,
                y: _y,
                element: _element,
                typist: _typist
            });
            
            //Move down a bit to visually separate each option
            _y += _element.get_height() + 2;
            ++_i;
        }
    }
}