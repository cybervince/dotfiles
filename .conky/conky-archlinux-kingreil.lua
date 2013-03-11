--[[
#Conky Widgets by londonali1010 (2009)
#Call this script in Conky using the following before TEXT (assuming you save this script to ~/scripts/conky_widgets.lua):
#	lua_load ~/Scripts/conky_widgets.lua
#	lua_draw_hook_pre load_text 
Reconstruido (casi) por completo por Kingreil
]]

require 'cairo'
function draw_text()
	if conky_window==nil then return end
	local w=conky_window.width
	local h=conky_window.height
	local cs=cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, w, h)
	cr=cairo_create(cs)

	
		
-- Seleccionar font
	cairo_select_font_face (cr, "Impact", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);

-- Cambiar tamaño (código ejemplo)
--cairo_set_font_size (cr, 60.0);

--Cambiar color (código ejemplo)
--cairo_set_source_rgba (cr, 0.192156863, 0.180392157, 0.156862745, 1);

--Redimensionar área (código ejemplo)
--cairo_translate (cr, 0.0, 0.0);

-- Ángulo (en radianes)
	cairo_rotate(cr,0.785398163);

-- "Mover" puntero (Código ejemplo)
--cairo_move_to (cr, 0.0, 0.0);

-- Texto:

-- Horario y fecha
	cairo_set_font_size (cr, 42.0);
	cairo_move_to (cr, 1635.0, -614.0);
	cairo_set_source_rgba (cr, 0.980392157, 0.980392157, 0.980392157, 1);
	cairo_show_text (cr, conky_parse('${time |%B}'));
	cairo_move_to (cr, 1540.0, -577.0);
	cairo_set_font_size (cr, 84.0);
	cairo_show_text (cr, conky_parse('${time %d}'));
	cairo_set_font_size (cr, 42.0);
	cairo_move_to (cr, 1635.0, -577.0);
	cairo_show_text (cr, conky_parse('${time |%A}'));
	cairo_set_font_size (cr, 84.0);
	cairo_move_to (cr, 1850.0, -577.0);
	cairo_show_text (cr, conky_parse('${time %k:%M}'));

--CPU1 (Texto)
	cairo_set_font_size (cr, 30.0);
	cairo_move_to (cr, 1570.0, -699.0);
	cairo_set_source_rgba (cr, 0.11372549, 0.11372549, 0.11372549, 0.7);
	cairo_show_text (cr, conky_parse('CPU1:'));

--CPU2 (Texto)
	cairo_move_to (cr, 1570.0, -669.0);
	cairo_show_text (cr, conky_parse('CPU2:'));

--CPU1 y CPU2 (Porcentaje)
	cairo_move_to (cr, 1650.0, -699.0);
	cairo_show_text (cr, conky_parse('${cpu cpu1}%'));
	cairo_move_to (cr, 1650.0, -669.0);
	cairo_show_text (cr, conky_parse('${cpu cpu2}%'));

--Top 4 uso CPU (Nombre)
	cairo_set_font_size (cr, 15.0);
	cairo_move_to (cr, 1715.0, -714.0);
	cairo_show_text (cr, conky_parse('${top name 1}'));
	cairo_move_to (cr, 1715.0, -698.0);
	cairo_show_text (cr, conky_parse('${top name 2}'));
	cairo_move_to (cr, 1715.0, -683.0);
	cairo_show_text (cr, conky_parse('${top name 3}'));
	cairo_move_to (cr, 1715.0, -668.0);
	cairo_show_text (cr, conky_parse('${top name 4}'));

--Top4 uso CPU (Porcentaje)
	cairo_move_to (cr, 1795.0, -714.0);
	cairo_show_text (cr, conky_parse('${top cpu 1}%'));
	cairo_move_to (cr, 1795.0, -698.0);
	cairo_show_text (cr, conky_parse('${top cpu 2}%'));
	cairo_move_to (cr, 1795.0, -683.0);
	cairo_show_text (cr, conky_parse('${top cpu 3}%'));
	cairo_move_to (cr, 1795.0, -668.0);
	cairo_show_text (cr, conky_parse('${top cpu 4}%'));

--RAM
	cairo_set_font_size (cr, 40.0);
	cairo_move_to (cr, 1570.0, -767.0);
	cairo_set_source_rgba (cr, 0.129411765, 0.411764706, 0.490196078, 1);
	cairo_show_text (cr, conky_parse('RAM: ${mem}'));

--Tpo 4 uso RAM (Nombre)
	cairo_set_font_size (cr, 15.0);
	cairo_move_to (cr, 1785.0, -799.0);
	cairo_show_text (cr, conky_parse('${top_mem name 1}'));
	cairo_move_to (cr, 1785.0, -783.0);
	cairo_show_text (cr, conky_parse('${top_mem name 2}'));
	cairo_move_to (cr, 1785.0, -768.0);
	cairo_show_text (cr, conky_parse('${top_mem name 3}'));
	cairo_move_to (cr, 1785.0, -753.0);
	cairo_show_text (cr, conky_parse('${top_mem name 4}'));

--Top 4 uso RAM (Uso)
	cairo_move_to (cr, 1860.0, -799.0);
	cairo_show_text (cr, conky_parse('${top_mem mem_res 1}'));
	cairo_move_to (cr, 1860.0, -783.0);
	cairo_show_text (cr, conky_parse('${top_mem mem_res 2}'));
	cairo_move_to (cr, 1860.0, -768.0);
	cairo_show_text (cr, conky_parse('${top_mem mem_res 3}'));
	cairo_move_to (cr, 1860.0, -753.0);
	cairo_show_text (cr, conky_parse('${top_mem mem_res 4}'));

--Espacio libre partición /
	cairo_set_font_size (cr, 30.0);
	cairo_move_to (cr, 1570.0, -870);
	cairo_set_source_rgba (cr, 0.529411765, 0.164705882, 0.0470588235, 1);
	cairo_show_text (cr, conky_parse('ROOT: ${fs_free /}'));

--Espacio libre partición /home/
	cairo_move_to (cr, 1640.0, -840);
	cairo_show_text (cr, conky_parse('HOME: ${fs_free /home/}'));

	cairo_stroke (cr);
end



function conky_load_text()
	if conky_window==nil then return end
	local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)

	local cr=cairo_create(cs)    

	local updates=conky_parse('${updates}')
	update_num=tonumber(updates)
    
	if update_num>5 then
		draw_text()
	end
end

