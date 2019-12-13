cloud = {}
cloud.x = 128
cloud.y = 64
cloud.tl = 7
cloud.bl = 23
cloud.tr = 8
cloud.br = 24
cloud.dtl = 39
cloud.dbl = 55
cloud.dtr = 40
cloud.dbr = 56
cloud.light = false

function draw_cloud()
	if cloud.light then
		spr(cloud.tl,cloud.x,cloud.y)
		spr(cloud.bl,cloud.x,cloud.y+8)
		spr(cloud.tr,cloud.x+8,cloud.y)
		spr(cloud.br,cloud.x+8,cloud.y+8)
	else
		spr(cloud.dtl,cloud.x,cloud.y)
		spr(cloud.dbl,cloud.x,cloud.y+8)
		spr(cloud.dtr,cloud.x+8,cloud.y)
		spr(cloud.dbr,cloud.x+8,cloud.y+8)
	end
end

function hit_cloud()
	if start_menu == false then
	 if cloud.light==false then
		 if player.x+7 >  cloud.x   and player.x < cloud.x+15 then
	 	 if player.y+7 > cloud.y  and player.y < cloud.y +15  then
	  	
		  	cloud.x = 128
		  	sfx(4)
		  	current_track_time+=1000
			  	player.speed += 2
			  	level_switch_flag=true
			  	b_color = 0
			  	bot_c = 8
						top_c = 5
						place_cookie=122
						caught_up = true
						evil=5
 		  	player.score +=50
			  	cloud.x = 128
			  	cloud.light = true	
			   penalty+=450
		  end
		 end
		else
			if player.x+7 >  cloud.x   and player.x < cloud.x+15 then
	 	 if player.y+7 > cloud.y  and player.y < cloud.y +15  then
	 	  cloud.x = 128
		  
		 		sfx(4)
		  	current_track_time+=500
			  
			  	level_switch_flag=true
			  	b_color = 1
			  	bot_c = 3
					 top_c = 0
						place_cookie=122
						caught_up = false
						evil=4			  
			  	cloud.x = 128
			  	cloud.light = false
			  	player.score -= 50
	  	end
	  end
	 end
	 
	end

  	
end