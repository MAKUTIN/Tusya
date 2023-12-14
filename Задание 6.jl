using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

left(side::HorizonSide) = HorizonSide(mod(Int(side)+1, 4))

right(side::HorizonSide) = HorizonSide(mod(Int(side)-1, 4))

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))


function perimetr!()
    ans = 0
    num1, num2 = first_step()
    side = Ost
    while isborder(r, Sud) == false
        ans = max(ans, marking(side::HorizonSide))
        side = inverse(side)
    end
    move_home(num1, num2)
    println(ans)
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
    fl = false
    cd_cound = 0
    mx = 0
    while isborder(r, side) == false
        move!(r, side)
        if isborder(r, Sud) == true && fl == false
            cd_cound += 1
            fl = true
            mx = max(mx, cd_cound)
        elseif isborder(r, Sud) == false && fl == true
            fl = false
        end
    end
    if isborder(r, Sud) == false
        mx = max(mx, cd_cound)
        move!(r, Sud)
        cd_cound = 0
    end
return mx
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
