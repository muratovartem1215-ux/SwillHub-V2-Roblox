-- SWILL Telekinesis ULTIMATE (MULTILANGUAGE)
-- English | Русский | Español

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local userInput = game:GetService("UserInputService")

-- === ЯЗЫКОВЫЕ СЛОВАРИ ===
local LANG = {
    ["en"] = {
        title = "SWILL TELEKINESIS ULTIMATE",
        blocks = "Blocks",
        players = "Players",
        ring = "Ring",
        grab_block = "GRAB BLOCK (LMB)",
        grab_player = "GRAB PLAYER (C)",
        throw_all = "THROW ALL (N)",
        zoom_in = "ZOOM IN (J)",
        zoom_out = "ZOOM OUT (U)",
        release_all = "RELEASE ALL",
        super_destruction = "💀 SUPER DESTRUCTION (X) 💀",
        remove_last = "REMOVE LAST BLOCK",
        disable_ring = "DISABLE RING",
        lang_btn = "🌐 EN",
        ring_active = "RING ACTIVE",
        ring_inactive = "RING INACTIVE",
        cant_grab = "First disable SUPER DESTRUCTION!",
        max_blocks = "Max blocks reached!",
        no_block = "No block under cursor",
        no_player = "No player under cursor",
        grabbed_block = "Block #",
        grabbed_player = "Player grabbed: ",
        thrown = "Thrown to ",
        released = "Released all",
        super_on = "💀 SUPER DESTRUCTION ACTIVATED! ",
        super_off = "SUPER DESTRUCTION DISABLED",
        blocks_teleported = " blocks TELEPORTED to ring!",
        kill_msg = "💀 THROWN AT SPEED 5000!",
        no_blocks_super = "No blocks for SUPER DESTRUCTION",
        found_blocks = "Found blocks: ",
        checked = "checked",
        no_hrp = "No HumanoidRootPart"
    },
    ["ru"] = {
        title = "ТЕЛЕКИНЕЗ SWILL ULTIMATE",
        blocks = "Блоков",
        players = "Игроков",
        ring = "Кольцо",
        grab_block = "ЗАХВАТИТЬ БЛОК (ЛКМ)",
        grab_player = "ЗАХВАТИТЬ ИГРОКА (C)",
        throw_all = "БРОСОК ВСЕХ (N)",
        zoom_in = "ПРИБЛИЗИТЬ (J)",
        zoom_out = "ОТДАЛИТЬ (U)",
        release_all = "ОТПУСТИТЬ ВСЁ",
        super_destruction = "💀 СУПЕР УНИЧТОЖЕНИЕ (X) 💀",
        remove_last = "УДАЛИТЬ ПОСЛЕДНИЙ БЛОК",
        disable_ring = "ОТКЛЮЧИТЬ КОЛЬЦО",
        lang_btn = "🌐 RU",
        ring_active = "КОЛЬЦО АКТИВНО",
        ring_inactive = "КОЛЬЦО НЕАКТИВНО",
        cant_grab = "Сначала отключите СУПЕР УНИЧТОЖЕНИЕ!",
        max_blocks = "Максимум блоков!",
        no_block = "Нет блока под курсором",
        no_player = "Нет игрока под курсором",
        grabbed_block = "Блок #",
        grabbed_player = "Игрок захвачен: ",
        thrown = "Бросок в ",
        released = "Всё отпущено",
        super_on = "💀 СУПЕР УНИЧТОЖЕНИЕ АКТИВИРОВАНО! ",
        super_off = "СУПЕР УНИЧТОЖЕНИЕ ОТКЛЮЧЕНО",
        blocks_teleported = " блоков ТЕЛЕПОРТИРОВАНЫ в кольцо!",
        kill_msg = "💀 ВЫБРОШЕН НА СКОРОСТИ 5000!",
        no_blocks_super = "Нет блоков для СУПЕР УНИЧТОЖЕНИЯ",
        found_blocks = "Найдено блоков: ",
        checked = "проверено",
        no_hrp = "Нет HumanoidRootPart"
    },
    ["es"] = {
        title = "TELEQUINESIS SWILL ULTIMATE",
        blocks = "Bloques",
        players = "Jugadores",
        ring = "Anillo",
        grab_block = "AGARRAR BLOQUE (LMB)",
        grab_player = "AGARRAR JUGADOR (C)",
        throw_all = "LANZAR TODO (N)",
        zoom_in = "ACERCAR (J)",
        zoom_out = "ALEJAR (U)",
        release_all = "LIBERAR TODO",
        super_destruction = "💀 SUPERS DESTRUCCIÓN (X) 💀",
        remove_last = "ELIMINAR ÚLTIMO BLOQUE",
        disable_ring = "DESACTIVAR ANILLO",
        lang_btn = "🌐 ES",
        ring_active = "ANILLO ACTIVO",
        ring_inactive = "ANILLO INACTIVO",
        cant_grab = "¡Desactiva SUPERS DESTRUCCIÓN primero!",
        max_blocks = "¡Máximo de bloques!",
        no_block = "Sin bloque bajo el cursor",
        no_player = "Sin jugador bajo el cursor",
        grabbed_block = "Bloque #",
        grabbed_player = "Jugador agarrado: ",
        thrown = "Lanzado a ",
        released = "Todo liberado",
        super_on = "💀 ¡SUPERS DESTRUCCIÓN ACTIVADA! ",
        super_off = "SUPERS DESTRUCCIÓN DESACTIVADA",
        blocks_teleported = " bloques TELEPORTADOS al anillo!",
        kill_msg = "💀 ¡LANZADO A VELOCIDAD 5000!",
        no_blocks_super = "Sin bloques para SUPERS DESTRUCCIÓN",
        found_blocks = "Bloques encontrados: ",
        checked = "revisados",
        no_hrp = "Sin HumanoidRootPart"
    }
}

local currentLang = "ru" -- можно сменить на "en" или "es"

-- === GUI ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SWILL_TeleGUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 600)
frame.Position = UDim2.new(0.5, -150, 0.5, -300)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(0, 200, 255)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 300, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = LANG[currentLang].title
title.TextColor3 = Color3.fromRGB(0, 200, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = frame

local countLabel = Instance.new("TextLabel")
countLabel.Size = UDim2.new(0, 300, 0, 25)
countLabel.Position = UDim2.new(0, 0, 0, 33)
countLabel.Text = LANG[currentLang].blocks .. ": 0/6 | " .. LANG[currentLang].players .. ": 0 | " .. LANG[currentLang].ring .. ": 0"
countLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
countLabel.BackgroundTransparency = 1
countLabel.Font = Enum.Font.Gotham
countLabel.TextSize = 13
countLabel.Parent = frame

-- Кнопка выбора языка
local langBtn = Instance.new("TextButton")
langBtn.Size = UDim2.new(0, 50, 0, 25)
langBtn.Position = UDim2.new(1, -60, 0, 5)
langBtn.Text = LANG[currentLang].lang_btn
langBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
langBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
langBtn.BorderSizePixel = 0
langBtn.Font = Enum.Font.Gotham
langBtn.TextSize = 12
langBtn.Parent = frame
local langCorner = Instance.new("UICorner")
langCorner.CornerRadius = UDim.new(0, 6)
langCorner.Parent = langBtn

local function createButton(text, y, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 270, 0, 32)
    btn.Position = UDim2.new(0, 15, 0, y)
    btn.Text = text
    btn.BackgroundColor3 = color or Color3.fromRGB(50, 50, 80)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 13
    btn.Parent = frame
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- === ДАННЫЕ ===
local blocks = {}
local players = {}
local ringBlocks = {}
local maxBlocks = 6
local distance = 15
local minDist = 3
local maxDist = 40
local timer = 0
local isRingActive = false
local ringRadius = 20
local ringSpeed = 3.5
local ringHeight = 3
local killRadius = 10
local COLLECT_RADIUS = 9999999

local rainbowColors = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 127, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(75, 0, 130),
    Color3.fromRGB(148, 0, 211),
}

-- === ФУНКЦИЯ ОБНОВЛЕНИЯ ЯЗЫКА ===
local function updateLanguage()
    local lang = LANG[currentLang]
    title.Text = lang.title
    langBtn.Text = lang.lang_btn
    -- Кнопки обновляются при создании, но для динамики пересоздадим их позже
    -- Сейчас просто обновим счётчик
    updateCount()
end

-- === ФУНКЦИИ ===
local function isPlayerPart(part)
    if not part then return false end
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:IsAncestorOf(part) then
            return true
        end
    end
    return false
end

local function findBlock()
    local mousePos = mouse.Hit.Position
    local best = nil
    local bestDist = 60
    local grabbed = {}
    for _, b in ipairs(blocks) do grabbed[b.part] = true end
    for _, r in ipairs(ringBlocks) do grabbed[r.part] = true end
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Anchored and not isPlayerPart(part) and not grabbed[part] then
            local d = (part.Position - mousePos).Magnitude
            if d < bestDist then
                bestDist = d
                best = part
            end
        end
    end
    return best
end

local function findPlayer()
    local ray = Ray.new(mouse.Origin, mouse.UnitRay.Direction * 500)
    local hit = workspace:FindPartOnRay(ray, player.Character)
    if hit then
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:IsAncestorOf(hit) then
                for _, p in ipairs(players) do
                    if p.player == plr then return nil end
                end
                return plr
            end
        end
    end
    return nil
end

local function findTarget()
    local ray = Ray.new(mouse.Origin, mouse.UnitRay.Direction * 500)
    local hit = workspace:FindPartOnRay(ray, player.Character)
    if hit then
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:IsAncestorOf(hit) then
                return plr
            end
        end
    end
    return nil
end

local function updateCount()
    local lang = LANG[currentLang]
    countLabel.Text = lang.blocks .. ": " .. #blocks .. "/6 | " .. lang.players .. ": " .. #players .. " | " .. lang.ring .. ": " .. #ringBlocks
end

local function grabBlock(part)
    if #blocks >= maxBlocks then
        print("[SWILL] " .. LANG[currentLang].max_blocks)
        return
    end
    local idx = #blocks + 1
    part.Material = Enum.Material.Neon
    part.Color = Color3.fromRGB(255, 140, 0)
    part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
    part.Velocity = Vector3.new(0,0,0)
    part.RotVelocity = Vector3.new(0,0,0)
    part.CanCollide = true
    table.insert(blocks, {part = part, index = idx})
    updateCount()
    print("[SWILL] " .. LANG[currentLang].grabbed_block .. idx .. " " .. (currentLang == "ru" and "захвачен" or currentLang == "es" and "agarrado" or "grabbed"))
end

local function grabPlayer(plr)
    if not plr or not plr.Character then return end
    local parts = {}
    for _, part in ipairs(plr.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Material = Enum.Material.Neon
            part.Color = Color3.fromRGB(255, 50, 200)
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            part.Velocity = Vector3.new(0,0,0)
            part.RotVelocity = Vector3.new(0,0,0)
            part.CanCollide = true
            table.insert(parts, part)
        end
    end
    table.insert(players, {player = plr, parts = parts})
    updateCount()
    print("[SWILL] " .. LANG[currentLang].grabbed_player .. plr.Name)
end

local function throwAll(target)
    if not target or not target.Character then return end
    local targetHrp = target.Character:FindFirstChild("HumanoidRootPart")
    if not targetHrp then return end
    for _, data in ipairs(blocks) do
        local part = data.part
        if part and part.Parent then
            local dir = (targetHrp.Position - part.Position).Unit
            part.Velocity = dir * 350
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            part.Touched:Connect(function(hit)
                if hit and target.Character and target.Character:IsAncestorOf(hit) then
                    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = CFrame.new(0, -5000, 0)
                        hrp.Velocity = Vector3.new(0, -1000, 0)
                        local hum = target.Character:FindFirstChild("Humanoid")
                        if hum then hum.Health = 0 end
                    end
                    part:Destroy()
                end
            end)
            game:GetService("Debris"):AddItem(part, 5)
        end
    end
    for _, data in ipairs(players) do
        local plr = data.player
        if plr and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local dir = (targetHrp.Position - hrp.Position).Unit
                hrp.Velocity = dir * 300
                for _, part in ipairs(data.parts) do
                    if part and part.Parent then
                        part.Velocity = hrp.Velocity
                        part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                    end
                end
                hrp.Touched:Connect(function(hit)
                    if hit and target.Character and target.Character:IsAncestorOf(hit) then
                        local tHrp = target.Character:FindFirstChild("HumanoidRootPart")
                        if tHrp then
                            tHrp.CFrame = CFrame.new(0, -5000, 0)
                            tHrp.Velocity = Vector3.new(0, -1000, 0)
                            local hum = target.Character:FindFirstChild("Humanoid")
                            if hum then hum.Health = 0 end
                        end
                        plr.Character:BreakJoints()
                    end
                end)
                game:GetService("Debris"):AddItem(hrp, 5)
            end
        end
    end
    blocks = {}
    players = {}
    updateCount()
    print("[SWILL] " .. LANG[currentLang].thrown .. target.Name)
end

local function releaseAll()
    for _, data in ipairs(blocks) do
        local part = data.part
        if part and part.Parent then
            part.Material = Enum.Material.Plastic
            part.Color = Color3.fromRGB(255,255,255)
            part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5, 0.5, 0.5)
            part.Velocity = Vector3.new(0,0,0)
            part.RotVelocity = Vector3.new(0,0,0)
            part.CanCollide = true
        end
    end
    for _, data in ipairs(players) do
        for _, part in ipairs(data.parts) do
            if part and part.Parent then
                part.Material = Enum.Material.Plastic
                part.Color = Color3.fromRGB(255,255,255)
                part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5, 0.5, 0.5)
                part.Velocity = Vector3.new(0,0,0)
                part.RotVelocity = Vector3.new(0,0,0)
                part.CanCollide = true
            end
        end
    end
    blocks = {}
    players = {}
    updateCount()
    print("[SWILL] " .. LANG[currentLang].released)
end

local function superDestruction()
    if isRingActive then
        isRingActive = false
        for _, data in ipairs(ringBlocks) do
            local part = data.part
            if part and part.Parent then
                part.Material = Enum.Material.Plastic
                part.Color = Color3.fromRGB(255,255,255)
                part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5, 0.5, 0.5)
                part.Velocity = Vector3.new(0,0,0)
                part.RotVelocity = Vector3.new(0,0,0)
                part.CanCollide = true
            end
        end
        ringBlocks = {}
        updateCount()
        print("[SWILL] " .. LANG[currentLang].super_off)
        return
    end
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then
        print("[SWILL] " .. LANG[currentLang].no_hrp)
        return
    end
    local playerPos = hrp.Position
    local collected = {}
    local totalChecked = 0
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Anchored and not isPlayerPart(part) then
            totalChecked = totalChecked + 1
            local dist = (part.Position - playerPos).Magnitude
            if dist < COLLECT_RADIUS then
                table.insert(collected, part)
            end
        end
    end
    if #collected == 0 then
        print("[SWILL] " .. LANG[currentLang].no_blocks_super .. " (" .. LANG[currentLang].checked .. ": " .. totalChecked .. ")")
        return
    end
    print("[SWILL] " .. LANG[currentLang].found_blocks .. #collected .. " (" .. LANG[currentLang].checked .. ": " .. totalChecked .. ")")
    for _, data in ipairs(blocks) do
        local part = data.part
        if part and part.Parent then
            part.Material = Enum.Material.Plastic
            part.Color = Color3.fromRGB(255,255,255)
            part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5, 0.5, 0.5)
            part.Velocity = Vector3.new(0,0,0)
            part.RotVelocity = Vector3.new(0,0,0)
            part.CanCollide = true
        end
    end
    blocks = {}
    for _, data in ipairs(players) do
        for _, part in ipairs(data.parts) do
            if part and part.Parent then
                part.Material = Enum.Material.Plastic
                part.Color = Color3.fromRGB(255,255,255)
                part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5, 0.5, 0.5)
                part.Velocity = Vector3.new(0,0,0)
                part.RotVelocity = Vector3.new(0,0,0)
                part.CanCollide = true
            end
        end
    end
    players = {}
    for _, data in ipairs(ringBlocks) do
        local part = data.part
        if part and part.Parent then
            part:Destroy()
        end
    end
    ringBlocks = {}
    local count = #collected
    for i, part in ipairs(collected) do
        local angle = (i / count) * math.pi * 2
        local color = rainbowColors[(i % #rainbowColors) + 1]
        local radius = ringRadius + math.random(-2, 2)
        local height = ringHeight + math.random(-1, 1)
        local x = math.cos(angle) * radius
        local z = math.sin(angle) * radius
        local targetPos = playerPos + Vector3.new(x, height, z)
        part.CFrame = CFrame.new(targetPos)
        part.Velocity = Vector3.new(0,0,0)
        part.RotVelocity = Vector3.new(0,0,0)
        part.Material = Enum.Material.Neon
        part.Color = color
        part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        part.CanCollide = true
        part.Transparency = 0.1
        table.insert(ringBlocks, {
            part = part,
            angle = angle,
            speed = ringSpeed + math.random(-0.5, 0.5),
            radius = radius,
            height = height,
            color = color
        })
    end
    isRingActive = true
    updateCount()
    print("[SWILL] " .. LANG[currentLang].super_on .. #ringBlocks .. LANG[currentLang].blocks_teleported)
end

-- === СОЗДАНИЕ КНОПОК ===
local btn1 = createButton(LANG[currentLang].grab_block, 65, Color3.fromRGB(0, 150, 200), function()
    if isRingActive then print("[SWILL] " .. LANG[currentLang].cant_grab) return end
    if #blocks >= maxBlocks then return end
    local part = findBlock()
    if part then grabBlock(part) else print("[SWILL] " .. LANG[currentLang].no_block) end
end)

local btn2 = createButton(LANG[currentLang].grab_player, 101, Color3.fromRGB(255, 50, 200), function()
    if isRingActive then print("[SWILL] " .. LANG[currentLang].cant_grab) return end
    local plr = findPlayer()
    if plr then grabPlayer(plr) else print("[SWILL] " .. LANG[currentLang].no_player) end
end)

local btn3 = createButton(LANG[currentLang].throw_all, 137, Color3.fromRGB(255, 100, 0), function()
    if isRingActive then print("[SWILL] " .. LANG[currentLang].cant_grab) return end
    if #blocks > 0 or #players > 0 then
        local target = findTarget()
        if target then throwAll(target) end
    end
end)

local btn4 = createButton(LANG[currentLang].zoom_in, 173, Color3.fromRGB(0, 200, 100), function()
    if not isRingActive then distance = math.max(minDist, distance - 2) end
end)

local btn5 = createButton(LANG[currentLang].zoom_out, 209, Color3.fromRGB(200, 200, 0), function()
    if not isRingActive then distance = math.min(maxDist, distance + 2) end
end)

local btn6 = createButton(LANG[currentLang].release_all, 245, Color3.fromRGB(200, 50, 50), function()
    if isRingActive then print("[SWILL] " .. LANG[currentLang].cant_grab) return end
    releaseAll()
end)

local btn7 = createButton(LANG[currentLang].super_destruction, 281, Color3.fromRGB(255, 0, 0), function()
    superDestruction()
end)

local btn8 = createButton(LANG[currentLang].remove_last, 317, Color3.fromRGB(150, 0, 150), function()
    if isRingActive then print("[SWILL] " .. LANG[currentLang].cant_grab) return end
    if #blocks > 0 then
        local data = blocks[#blocks]
        if data and data.part and data.part.Parent then
            data.part.Material = Enum.Material.Plastic
            data.part.Color = Color3.fromRGB(255,255,255)
            data.part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5, 0.5, 0.5)
            data.part.Velocity = Vector3.new(0,0,0)
            data.part.RotVelocity = Vector3.new(0,0,0)
            data.part.CanCollide = true
        end
        table.remove(blocks)
        updateCount()
    end
end)

local btn9 = createButton(LANG[currentLang].disable_ring, 353, Color3.fromRGB(100, 100, 100), function()
    if isRingActive then superDestruction() else print("[SWILL] " .. LANG[currentLang].ring_inactive) end
end)

-- === ЛОГИКА СМЕНЫ ЯЗЫКА ===
langBtn.MouseButton1Click:Connect(function()
    local langs = {"ru", "en", "es"}
    local idx = table.find(langs, currentLang)
    if not idx then idx = 1 end
    idx = idx % #langs + 1
    currentLang = langs[idx]
    
    -- Обновляем все тексты
    local lang = LANG[currentLang]
    title.Text = lang.title
    langBtn.Text = lang.lang_btn
    btn1.Text = lang.grab_block
    btn2.Text = lang.grab_player
    btn3.Text = lang.throw_all
    btn4.Text = lang.zoom_in
    btn5.Text = lang.zoom_out
    btn6.Text = lang.release_all
    btn7.Text = lang.super_destruction
    btn8.Text = lang.remove_last
    btn9.Text = lang.disable_ring
    updateCount()
    print("[SWILL] Language switched to: " .. currentLang)
end)

-- === УПРАВЛЕНИЕ ===
mouse.Button1Down:Connect(function()
    if isRingActive then print("[SWILL] " .. LANG[currentLang].cant_grab) return end
    if #blocks >= maxBlocks then return end
    local part = findBlock()
    if part then grabBlock(part) end
end)

userInput.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.C then
        if isRingActive then print("[SWILL] " .. LANG[currentLang].cant_grab) return end
        local plr = findPlayer()
        if plr then grabPlayer(plr) end
    end
    if input.KeyCode == Enum.KeyCode.N then
        if isRingActive then print("[SWILL] " .. LANG[currentLang].cant_grab) return end
        if #blocks > 0 or #players > 0 then
            local target = findTarget()
            if target then throwAll(target) end
        end
    end
    if input.KeyCode == Enum.KeyCode.J then
        if not isRingActive then distance = math.max(minDist, distance - 2) end
    end
    if input.KeyCode == Enum.KeyCode.U then
        if not isRingActive then distance = math.min(maxDist, distance + 2) end
    end
    if input.KeyCode == Enum.KeyCode.X then
        superDestruction()
    end
end)

-- === ЦИКЛ ДВИЖЕНИЯ ===
runService.RenderStepped:Connect(function()
    if not isRingActive then
        local total = #blocks + #players
        if total == 0 then return end
        if not player.Character then return end
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local mousePos = mouse.Hit.Position
        local playerPos = hrp.Position
        local dir = (mousePos - playerPos).Unit
        local base = playerPos + dir * distance
        base = Vector3.new(base.X, base.Y + 2, base.Z)
        local idx = 0
        for _, data in ipairs(blocks) do
            local part = data.part
            if part and part.Parent then
                idx = idx + 1
                local ang = (idx / total) * math.pi * 2
                local off = Vector3.new(math.cos(ang) * 3.5, 0, math.sin(ang) * 3.5)
                local target = base + off
                part.Velocity = (target - part.Position) * 16
                part.RotVelocity = Vector3.new(0,0,0)
                part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            end
        end
        for _, data in ipairs(players) do
            idx = idx + 1
            local ang = (idx / total) * math.pi * 2
            local off = Vector3.new(math.cos(ang) * 4, 0, math.sin(ang) * 4)
            local target = base + off
            for _, part in ipairs(data.parts) do
                if part and part.Parent then
                    part.Velocity = (target - part.Position) * 14
                    part.RotVelocity = Vector3.new(0,0,0)
                    part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                end
            end
        end
    else
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local center = hrp.Position
        local time = tick()
        for _, data in ipairs(ringBlocks) do
            local part = data.part
            if part and part.Parent then
                local currentAngle = data.angle + time * data.speed * 0.5
                local radius = data.radius
                local height = data.height
                local x = math.cos(currentAngle) * radius
                local z = math.sin(currentAngle) * radius
                local targetPos = center + Vector3.new(x, height, z)
                part.Velocity = (targetPos - part.Position) * 25
                part.RotVelocity = Vector3.new(0, 20, 0)
                part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                part.Color = data.color
                part.Transparency = 0.1
            end
        end
    end
end)

-- === УБИЙСТВО ===
local killTimer = 0
runService.Heartbeat:Connect(function(dt)
    killTimer = killTimer + dt
    if isRingActive and killTimer > 0.1 then
        killTimer = 0
        for _, data in ipairs(ringBlocks) do
            local part = data.part
            if part and part.Parent then
                for _, plr in ipairs(game.Players:GetPlayers()) do
                    if plr ~= player and plr.Character then
                        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local dist = (hrp.Position - part.Position).Magnitude
                            if dist < killRadius then
                                local throwDir = (hrp.Position - part.Position).Unit
                                local finalVelocity = throwDir * 5000 + Vector3.new(0, -2000, 0)
                                hrp.Velocity = finalVelocity
                                hrp.CFrame = CFrame.new(hrp.Position + finalVelocity * 0.1)
                                for _, bodyPart in ipairs(plr.Character:GetDescendants()) do
                                    if bodyPart:IsA("BasePart") and bodyPart ~= hrp then
                                        bodyPart.Velocity = finalVelocity + Vector3.new(math.random(-200,200), math.random(-300,0), math.random(-200,200))
                                    end
                                end
                                local hum = plr.Character:FindFirstChild("Humanoid")
                                if hum then
                                    hum.Health = 0
                                    hum.PlatformStand = true
                                end
                                plr.Character:BreakJoints()
                                print("[SWILL] 💀 " .. plr.Name .. " " .. LANG[currentLang].kill_msg)
                            end
                        end
                    end
                end
            end
        end
    end
    if not isRingActive then
        timer = timer + dt
        if timer < 0.5 then return end
        timer = 0
        for _, data in ipairs(blocks) do
            local part = data.part
            if part and part.Parent then
                local touching = false
                for _, other in ipairs(workspace:GetDescendants()) do
                    if other:IsA("BasePart") and other ~= part and not isPlayerPart(other) then
                        if (other.Position - part.Position).Magnitude < 5 then
                            touching = true
                            break
                        end
                    end
                end
                part.CanCollide = not touching
            end
        end
        for _, data in ipairs(players) do
            for _, part in ipairs(data.parts) do
                if part and part.Parent then
                    local touching = false
                    for _, other in ipairs(workspace:GetDescendants()) do
                        if other:IsA("BasePart") and other ~= part and not isPlayerPart(other) then
                            if (other.Position - part.Position).Magnitude < 4 then
                                touching = true
                                break
                            end
                        end
                    end
                    part.CanCollide = not touching
                end
            end
        end
    end
end)

print("[SWILL] MULTILANGUAGE ACTIVATED! | English | Русский | Español")
print("[SWILL] LMB - block | C - player | J/U - zoom | N - throw | X - SUPER DESTRUCTION")
print("[SWILL] Click 🌐 button to switch language")
