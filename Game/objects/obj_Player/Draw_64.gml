display_set_gui_maximise(2, 2, pos[0] + 10, pos[1] + 10);
draw_sprite(sHealthbar_bg, 0, hpBar_x, hpBar_y);
draw_sprite_stretched(sHealthbar, 0, hpBar_x, hpBar_y, (hp / 3) * hpWidth, hpHeight);