using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

function perimetr!()
    num1, num2 = first_step()
    putmarker!(r)
    side = Ost
    while isborder(r, Sud) == false
        marking(side::HorizonSide)
        side = inverse(side)
    end
    marking(side)
    move_home(num1, num2)
end

function first_step()
    num_Nord = 0
    num_West = 0
    while isborder(r, Nord) == false
        move!(r, Nord)
        num_Nord += 1
    end
    while isborder(r, West) == false
        move!(r, West)
        num_West += 1
    end
    return num_Nord, num_West
end

function marking(side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
    if isborder(r, Sud) == false
        move!(r, Sud)
    end
    putmarker!(r)
end

function move_home(num_Sud, num_Ost)
    while isborder(r, Nord) == false
        move!(r, Nord)
    end
    while isborder(r, West) == false
        move!(r, West)
    end
    for _ in 1:num_Sud
        move!(r, Sud)
    end
    for _ in 2:num_Ost
        move!(r, Ost)
    end
end

function inverse(side)
    side = HorizonSide(mod(Int(side)+2,4))
    return side
end

perimetr!()
