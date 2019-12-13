music(0)
play_once=true
play_once_again=true

function make_player()
	player = {}
	player.x=24 --position
	player.y=60
	player.dy=0 --fall speed
	player.rise=1 --sprites
	player.fall=2
	player.dead=3
	player.speed=3 --fly   
	player.score = 0
	player.hit = 0
end

function check_hit()
	if start_menu == false then
		
		
		  
  if player.speed > 10 and player.speed < 24 and play_once then
			music(1)
			play_once=false
			play_once_again=true
			
		elseif player.speed > 25 and play_once_again then
			play_once=true 
   play_once_again=false
   music(41)			
  end

		for i=player.x,player.x+7 do
			if (cave[i+1].top>player.y	or cave[i+1].btm<player.y+7) then
				game_over=true
			  
			 sfx(8)
			 music(-1)
			end			
		end
	end
end

function draw_player()
	if (game_over) then
		spr(19,player.x,player.y)
	elseif (player.dy<0) then
		if player.hit < 4 then
			spr(player.rise+player.hit*16,player.x,player.y)
		end
	else
	 if player.hit< 4 then
			spr(player.fall+player.hit*16,player.x,player.y)	
		end
	end
	
	if player.hit >= 4 then
		spr(35,player.x,player.y)
	end
end
