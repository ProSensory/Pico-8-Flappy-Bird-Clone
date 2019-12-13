
start_menu=true
new_score=1000
penalty=0
current_track_time=1000
level_switch_flag=false
level = 1
b_color = 1
bot_c = 3
top_c = 0
place_cookie=128
cookie_y = 50
caught_up = false
evil=4
counter = 0
hit=false


function _init()
	game_over=false
	make_cave()
	make_player()

	init()
	o_speed = player.speed
	
end

function _update()
 if player.speed > 29 then
 	game_over = true
 end

 hit_money()
  
 if player.score > new_score then
 
 	level+=1
  new_score += 2500
  o_speed+=1
  player.speed = o_speed
 end

	
 

 
 if (not game_over) then
 	update_cave()
	 move_player()
	 check_hit()

	 update_emitor()
	 if player.score > current_track_time then
	 
	  if level_switch_flag==false then
	  	current_track_time+=1000
	  	player.speed += 1
    
	  	b_color = 0
	  	bot_c = 8
				top_c = 5
				place_cookie=122
				caught_up = true
				evil=5
	  	
	  	
    	  
	  	cloud.light = true
	  elseif level_switch==true then
	  	current_track_time+=1000
	  	
				player.speed +=1
	  
	  	b_color = 1
	  	bot_c = 4
				top_c = 0
	   caught_up = false
	   
	  	evil=4
	  	place_cookie=128
	   cloud.x = 128
	   cloud.light = false
	  
	  	
  		hit = false
	  end
	 
	 end
	else
	 place_cookie -= 1
 end

	if player.x > cloud.x - 16 and cloud.light then
		cloud.x -= player.speed

	elseif player.x > cloud.x - 16 then
	 cloud.x -= .2*player.speed
	else
	 	 cloud.x -=.5* player.speed
	end
	
	if player.x > money.x - 16 and cloud.light then
		money.x -= .2*player.speed

	elseif player.x > money.x - 16 then
	 money.x -= .1*player.speed
	else
	 money.x -=.2* player.speed
	end

	money.y = money.y - player.dy
	
	cloud.y = cloud.y -.5* player.dy
	
	if cloud.x < -32 then
	 cloud.x = 256
	end
	if money.x < -56 then
	 money.x = 800
	 money.draw=true 
	end

	if place_cookie > 110 then
		place_cookie -= 1
	end

	if caught_up then
	 place_cookie -= 2
	end
 
 hit_cloud()	

	if player.x+7 > place_cookie and player.x < place_cookie +7 then
		if player.y+7 > cookie_y and player.y < cookie_y+7	then
			place_cookie = -20
			player.hit += 1
		 sfx(7)	
			if player.hit > 4 then
				game_over = true
			end
			hit=true
		end
	end

 if counter > 40 then
 
 	counter = 0
 	 
 elseif counter > 20 then
 
		cookie_y -=2
	elseif counter > 0 then 
 	cookie_y += 2
 	
 end
 
	counter += 1
 
end

function _draw()
	cls(b_color)
	foreach(ps,draw_p)
	draw_cloud()
	draw_cave	()

	if start_menu == false then
		draw_player()
	end
 	draw_money()
 	
 if not (game_over) then
		spr(evil,place_cookie,cookie_y)
	end
	
	if start_menu then
		player.x=24
		player.y=64
		print("how to play",44,44,8)
		print("grind ghosts and money",24,54,12)
		print("avoid walls and ghosts", 24,64,9)
		print("press ⬆️ or 🅾️ to jump",24,74,11)
		print("reach speed 30/ to win",24,84,7)
		print("press ❎ to start!",24,94,10)
		if btnp(❎) then
			start_menu=false
			game_over=false
		end
	end
	
	
	
		if (game_over and start_menu == false) then
	 
	 if player.speed > 29 then
	  print("speed 30 reached!",20,44,12)
 		print("congrats",20,64,11)
	  print("you win",34,54,12)
	  print("press ❎ to restart!",26,74,10)
	 else
			print("game over!",44,44,8)
			print("your score:"..(player.score),34,54,12)
			print("you made it to level:"..level,20,64,11)
			print("press ❎ to restart!",26,74,10)
	
		end
	
		if btnp(❎) then
			
			player.score=0
			player.speed = 3
			bcolor=1
			o_speed=3
			new_score=500
			player.x=24
			player.y=60
			player.dy = 0						
			game_over = false
			place_cookie=122
			cloud.dy = 0
			cloud.y = 64
			cloud.x = 128
			player.hit=0
			level =1
			money.y=64
			money.x =128
			play_once=true
			play_once_again=true
			music(0)
		end
	else
		print("score: "..(player.score),2,2,9)	
		print("level: "..level,2,8,9)
		print("speed: "..player.speed,2,15,9)
	end
	
	print("money distance = "..flr(money.x),0,120)   
end