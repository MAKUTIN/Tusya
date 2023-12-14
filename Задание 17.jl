using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

function main!(st_cond, r)
    s = Ost
    n = 1
    while !st_cond()
        for i in 1:2
            num_move!(st_cond, r, s, n)
            s = reverse(s)
        end
        n += 1
    end
end

function reverse(s)
    return HorizonSide(mod(Int(s) + 1, 4))
end

function try_move!(st_cond, r, side)
    if !st_cond()     
        move!(r, side)
    end
end

function num_move!(st_cond, r, side, n)
    for i in 1:n
        try_move!(st_cond, r, side)
    end
end

main!(() -> ismarker(r), r)
