using HorizonSideRobots
r = Robot("untitled.sit", animate = true)
function cross!()
    for side in (Nord, Sud, West, Ost)
        cross_marking(side::HorizonSide)
    end
    putmarker!(r)    
end


function cross_marking(side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
    side = inverse(side)
    while ismarker(r) == true
        move!(r, side)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))

cross!()
