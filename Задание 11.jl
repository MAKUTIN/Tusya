using HorizonSideRobots
r = Robot("untitled.sit", animate=true) 

function main!(rob)
    g, v = first_step(rob, West), first_step(rob, Sud)
    if ! isborder(rob, Nord)
        move!(rob, Nord)
    else
        return 0
    end
    m = snake(rob)
    first_step(rob, West)
    first_step(rob, Sud)
    num_move!(rob, Nord, v)
    num_move!(rob, Ost, g)
    return m
end

function num_move!(rob, side, n)
    for i in 1:n
        move!(rob, side)
    end
end

function snake(rob)
    n = 0
    s = Ost
    while !isborder(rob,Nord)
        x = st!(rob, s)
        move!(rob, Nord)
        s = inverse(s)
        n += x
    end
    n += st!(rob, s)
    return n
end

function st!(rob, s)
    x = 0
    f = 0
    while ! isborder(rob, s)
        if isborder(rob, Sud)
            f = 1
        else
            x += f
            f = 0
        end
        move!(rob, s)
    end
    x += f
    return x
end

function inverse(s)
    return HorizonSide(mod(Int(s) + 2,4))
end

function first_step(rob, side)
    n = 0
    while ! isborder(rob, side)
        move!(rob, side)
        n += 1
    end
    return n
end
