function move_player()
	if start_menu == false then
		gravity=0.2 --bigger means more grav
		player.dy+=gravity
		
		--jump
		if (btnp(2) or btnp(🅾️)) then
			player.dy-=5
			sfx(0)
		end
		
		--move to new position
		player.y+=player.dy
		
		--update 
		
		player.score+=player.speed
	else
		player.y = 64
		
	end
end