using HorizonSideRobots
r = Robot(animate = true)

function along!(st_cond, r, side)
    while !st_cond()
        move!(r, side)
        along!(st_cond, r, side)
    end
end

along!(() -> isborder(r, Ost), r, Ost)
