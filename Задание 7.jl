using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

function move_throgh_the_border!(r, side)
    num_steps = 0
    side_m = left(side)
    while isborder(r, side)
        num_steps += 1
        move_n!(r, side_m, num_steps)
        side_m = inverse(side_m)
    end
    move!(r, side)
    move_n!(r, side_m, div((num_steps + 1), 2))
end

left(side::HorizonSide) = HorizonSide(mod(Int(side) + 1, 4))

function move_n!(r, side, n)
    for _ in 1:т
        move!(r, side)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))

move_throgh_the_border!(r, Nord)
