using HorizonSideRobots
r = Robot("untitled.sit", animate = true) 

function main!(r::Robot, side::HorizonSide, steps::Int64, o::Bool)
    if !isborder(r,side)
        try_move!(r,side)
        steps += 1
        steps += main!(r, side, steps, o)
        return steps
    else 
        for i in 1:steps*2
            if try_move!(r, inverse(side))
            else
                o = false
                num_move()
                end
                return 0
            end
        end
        return 0
    end
    return answer
end

function num_move()
  for j in  1:(i-steps-1)
    move!(r, side)
end

  function inverse(s)
    return HorizonSide(mod(Int(s) + 2, 4))
end

function try_move!(r, side)
    if !isborder(r, side)     
        move!(r, side)
        return true
    else 
        return false
    end
end

ble(r, Ost, 0, true)
