using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

function findmarker!(r)
    s = Ost
    n = 1
    while  !ismarker(r)
        for i in 1:2
            num_move!(r, s, n)
            s = rever(s)
        end
        n += 1
    end
end

function rever(s)
    return HorizonSide(mod(Int(s) + 1, 4))
end

function num_move!(r, side, n)
    for i in 1:n
        if !ismarker(r)
            move!(r, side)
        end
    end
end

findmarker!(r)
