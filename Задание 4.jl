using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

function main!()
    for side in ((Nord, Ost), (Nord, West), (Sud, Ost), (Sud, West))
        moving(side)
        back(side)
    end
    putmarker!(r)
end

function moving(side)
    while isborder(r, side[1]) == false && isborder(r, side[2]) == false
        move!(r, side[1])
        move!(r, side[2])
        putmarker!(r)
    end
end

function back(side)
    side_1, side_2 = inverse(side)
    while ismarker(r)
        move!(r, side_1)
        move!(r, side_2)
    end
end

function inverse(side)
    side_1 = HorizonSide(mod(Int(side[1])+2,4))
    side_2 = HorizonSide(mod(Int(side[2])+2,4))
    return side_1, side_2
end

main!()
