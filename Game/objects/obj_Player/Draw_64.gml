draw_sprite(sHealthbar_bg, 0, hpBar_x, hpBar_y);
draw_sprite_stretched(sHealthbar, 0, hpBar_x, hpBar_y, (global.hp / 100) * hpWidth, hpHeight);