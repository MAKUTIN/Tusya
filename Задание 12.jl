using HorizonSideRobots
r = Robot("untitled.sit", animate=true) 

function peregorodki!(rob)
    g, v = first_step(rob, West), first_step(rob, Sud)
    if ! isborder(rob, Nord)
        move!(rob, Nord)
    else
        return 0
    end
    m = smake(rob)
    first_step(rob, West)
    first_step(rob, Sud)
    num_move!(rob, Nord, v)
    num_move!(rob, Ost, g)
    return m
end

function stenki_d(rob, s)
    x = 0
    g = 0
    f = 0
    n = 0
    while ! isborder(r, s)
        n = g
        g = f
        if isborder(r, Sud)
            f = 1
        else
            f = 0
        end
        if  (f == 0) & (g == 0)
            x += n  
        end
        move!(r, s)
    end
    if (f == 1) || (g == 1)
        x += 1
    end
    println(x)
    return x
end

function num_move!(rob, side, n)
    for i in 1:n
        move!(rob, side)
    end
end

function smake(rob)
    n = 0
    s = Ost
    while !isborder(rob,Nord)
        x = stenki!(rob, s)
        move!(rob, Nord)
        s = inverse(s)
        n += x
    end
    n += stenki!(rob, s)
    return n
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

print(peregorodki!(r))
