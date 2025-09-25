-- Rayfield UI Script untuk Menampilkan Koordinat
-- Letakkan script ini di StarterPlayer > StarterPlayerScripts

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Membuat UI Rayfield
local window = Rayfield:Create{
    Name = "Roblox Coordinate System",
    Theme = "Dark",
    Animations = true,
    Draggable = true
}

local mainTab = window:CreateTab("Coordinates", 4483758156) -- Icon ID bisa diubah

-- Membuat label untuk menampilkan koordinat
local coordinateLabel = mainTab:CreateLabel{
    Text = "Loading...",
    Colour = Color3.fromRGB(255, 255, 255)
}

-- Fungsi untuk memperbarui teks label
local function updateCoordinates()
    -- Mengambil posisi HumanoidRootPart
    local position = rootPart.Position
    
    -- Membulatkan dan memformat koordinat
    local x = string.format("%.2f", position.X)
    local y = string.format("%.2f", position.Y)
    local z = string.format("%.2f", position.Z)
    
    -- Menggabungkan teks
    local text = string.format("X: %s | Y: %s | Z: %s", x, y, z)
    
    -- Memperbarui teks pada label Rayfield
    coordinateLabel:SetText(text)
end

-- Menjalankan fungsi updateCoordinates setiap frame
game:GetService("RunService").RenderStepped:Connect(updateCoordinates)

-- Menambahkan tombol untuk menyembunyikan/menampilkan UI (opsional)
mainTab:CreateButton{
    Name = "Hide/Show UI",
    Callback = function()
        if window.Visible then
            window:Hide()
        else
            window:Show()
        end
    end
}
