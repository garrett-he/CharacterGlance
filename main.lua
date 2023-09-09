local function SaveCharacterItemLinks()
    local items = {}

    for i, _ in ipairs(slots) do
        local link = GetInventoryItemLink("player", i)

        items[i] = link
    end

    CharacterGlance[UnitName("player")] = items
end

-- Register slash commands
_G["SLASH_CGLANCE1"] = "/cglance"
_G["SLASH_CGLANCE2"] = "/cg"

if not CharacterGlance then
    CharacterGlance = {}
end

local slots = {
    "Head", "Neck", "Shoulder", "Shirt", "Chest", "Waist",
    "Legs", "Feet", "Wrist", "Hands", "Finger1", "Finger2",
    "Trinket1", "Trinket2", "Back", "Main Hand", "Off Hand", "Ranged"
}

SlashCmdList["CGLANCE"] = function(str)
    if str == "" then
        SaveCharacterItemLinks()
        return
    end

    if not CharacterGlance[str] then
        print("[CharacterGlance] Character " .. str .. " not available yet")
        return
    end

    print("[CharacterGlance] List items of character: " .. str)

    local items = CharacterGlance[str]

    for i, link in pairs(items) do
        if not link then
            link = "nil"
        end

        print(slots[i] .. ": " .. link)
    end
end