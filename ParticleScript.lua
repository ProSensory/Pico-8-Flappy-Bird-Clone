function init()
	ps={} --empty particle table
	g=0.1 --particle gravity
	max_vel=2 --max initial particle velocity
	min_time=2 --min/max time between particles
	max_time=5
	min_life=30 --particle lifetime
	max_life=90
	t=0
 cols={12,12} --colors
 burst=25
 
 next_p=rndb(min_time,max_time)	 
end

function rndb(low,high)
	return flr(rnd(high-low+1)+low)
end

function update_emitor()
	

	--burst
	--character o 
	if btnp(2) or btnp(🅾️) then
		for i=1,burst do add_p(player.x+4,player.y+7) end
	end
 foreach(ps,update_p)	
end



function add_p(x,y)
	local p={}
	p.x,p.y=x,y
	p.dx=rnd(max_vel)-max_vel/2
	p.dy=rnd(max_vel)*-1
	p.life_start=rndb(min_life,max_life)
	p.life=p.life_start
	add(ps,p)
end




--updates collision
function update_p(p)
	
	
	if p.life<=0 then
		del(ps,p) --kill old particles
	else
		p.dy+=g --add gravity
		for i=player.x,player.x+7 do
			if (p.y+p.dy>cave[i+1].btm) then

			 p.dy*=-0.8		
			 p.dx = -player.speed
			elseif p.y+p.dy<cave[i+1].top then
				p.dy*=0.8
			 p.dx = -player.speed
			end			
		end
		if p.y+p.dy>cloud.y and p.y+p.dy<cloud.y+7 and p.x > cloud.x and p.x < cloud.x+7 then
			p.dy*=-0.8
		end
  	 
		p.x+=p.dx --update position
		p.y+=p.dy
		p.life-=1 --die a little
	end	
end

function draw_p(p)
	local pcol=flr(p.life/p.life_start*#cols+1)
	pset(p.x,p.y,cols[pcol])
end

