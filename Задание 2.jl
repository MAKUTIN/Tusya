using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

function perimetr!()
    num1, num2 = first_step()
    for side in (Ost, Sud, West, Nord)
        marking(side::HorizonSide)
    end
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
    println(num_Nord)
    println(num_West)
    return num_Nord, num_West
end

function marking(side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function move_home(num_Sud, num_Ost)
    for _ in 1:num_Sud
        move!(r, Sud)
    end
    for _ in 2:num_Ost
        move!(r, Ost)
    end
end

perimetr!()
