local function MegaWait(num)
    if num == nil then
        num = 0
    end
    num = num + 0
    local RunService = game:GetService("RunService")
    local Connections = {}
    local GlobalStepEvent = Instance.new("BindableEvent")
    local Main = RunService.Stepped:Connect(function()
        GlobalStepEvent:Fire()
    end)
    local c1 = RunService.RenderStepped:Connect(function()
        GlobalStepEvent:Fire()
    end)
    table.insert(Connections, c1)
    local c2 = RunService.Heartbeat:Connect(function(dt)
        GlobalStepEvent:Fire()
    end)
    table.insert(Connections, c2)
    task.spawn(function()
        while Main.Connected and task.wait() do
            GlobalStepEvent:Fire()
        end
    end)
    task.spawn(function()
        while Main.Connected and wait() do
            GlobalStepEvent:Fire()
        end
    end)
    task.spawn(function()
        repeat task.wait() until not Main.Connected
        GlobalStepEvent:Destroy()
        for _, Connection in pairs(Connections) do
            Connection:Disconnect()
        end
    end)
    if num == 0 then
        GlobalStepEvent.Event:Wait()
        Main:Disconnect()
        return true
    else
        local start = tick()
        repeat GlobalStepEvent.Event:Wait() until tick() - start > num
        Main:Disconnect()
        return true
    end
end

return MegaWait
