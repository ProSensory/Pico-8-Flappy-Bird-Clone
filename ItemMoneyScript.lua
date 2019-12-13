money = {}
money.x = 128
money.y = 64
money.sprite=51
money.light = false
money.draw=false

function draw_money()
	spr(money.sprite,money.x,money.y)
end

function hit_money()
	if start_menu == false  then

		 if player.x+7 >  money.x   and player.x < money.x+7 then
			if player.y+7 > money.y  and player.y < money.y+7  then
				
				money.x = 700	
			
				player.speed+=5
				player.score+=300
					
		  	end
		 end
	end
end