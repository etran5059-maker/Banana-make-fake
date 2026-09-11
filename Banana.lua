-- ====================================================================
-- TAB: FARM MAIN / SETTING FARM MAIN
-- ====================================================================
-- Toggle: Kill Aura With DragonStorm
SettingFarmMainSection:CreateToggle({
    Title = "Kill Aura With DragonStorm",
    Desc = Desc,
    Default = Settings["Kill Aura With DragonStorm"],
    Callback = onToggleKillAuraWithDragonStorm
})

-- Toggle: Auto Turn On Buso
SettingFarmMainSection:CreateToggle({
    Title = "Auto Turn On Buso",
    Desc = Desc,
    Default = Settings["Auto Turn On Buso"],
    Callback = onToggleAutoTurnOnBuso
})

-- Toggle: Auto Turn On Observation
SettingFarmMainSection:CreateToggle({
    Title = "Auto Turn On Observation",
    Desc = Desc,
    Default = Settings["Auto Turn On Observation"],
    Callback = onToggleAutoTurnOnObservation
})


-- ====================================================================
-- TAB: SEA EVENT / SETTING SEA EVENT
-- ====================================================================
-- Dropdown: Select Sea Events
SettingSeaEventSection:CreateDropdown({
    Title = "Select Sea Events",
    List = PrepareMultiSelectList(SeaEventsList, Settings["Select Sea Events"]),
    Search = true,
    Selected = true,
    Default = Settings["Select Sea Events"],
    Callback = onSelectSelectSeaEvents
})

-- Dropdown: Select Boat
SettingSeaEventSection:CreateDropdown({
    Title = "Select Boat",
    List = BoatList,
    Search = true,
    Selected = nil,
    Default = Settings["Select Boat"],
    Callback = onSelectSelectBoat
})

-- Dropdown: Select Weapons Use Skill
SettingSeaEventSection:CreateDropdown({
    Title = "Select Weapons Use Skill",
    List = PrepareMultiSelectList(WeaponsList, Settings["Select Weapons Use Skill"]),
    Search = true,
    Selected = true,
    Default = Settings["Select Weapons Use Skill"],
    Callback = onSelectSelectWeaponsUseSkill
})

-- Toggle: Use Dragonstorm For Sea Event
SettingSeaEventSection:CreateToggle({
    Title = "Use Dragonstorm For Sea Event",
    Desc = "Only Farm Boat and Fish and TerrorShark",
    Default = Settings["Use Dragonstorm For Sea Event"],
    Callback = onToggleUseDragonstormForSeaEvent
})

-- Toggle: Auto Dodge Skill Seabeast
SettingSeaEventSection:CreateToggle({
    Title = "Auto Dodge Skill Seabeast",
    Desc = "Dodge Only Skill Kameha and waterbeam",
    Default = Settings["Auto Dodge Skill Seabeast"],
    Callback = onToggleAutoDodgeSkillSeabeast
})


-- ====================================================================
-- TAB: WEBHOOK
-- ====================================================================
TabWebhook = Main:CreatePage({
    Page_Name = "Tab Webhook",
    Page_Title = "Tab Webhook"
})

SectionWebhook = TabWebhook:CreateSection("Webhook")

-- TextBox: Input Url Webhook
SectionWebhook:CreateBox({
    Title = "Input Url Webhook",
    Placeholder = "Type here",
    Number = nil,
    Default = Settings["Input Url Webhook"],
    Callback = onInputInputUrlWebhook
})


-- ====================================================================
-- TAB: BOSS
-- ====================================================================
-- Dropdown: Select Boss
AutoKillBossSection:CreateDropdown({
    Title = "Select Boss",
    List = BossList,
    Search = true,
    Selected = nil,
    Default = Settings["Select Boss"],
    Callback = onChangeSelectBoss
})

-- Button: Refresh Boss
AutoKillBossSection:CreateButton({
    Title = "Refresh Boss",
    Callback = onClickRefreshBoss
})

-- Toggle: Kill Boss
AutoKillBossSection:CreateToggle({
    Title = "Kill Boss",
    Desc = Desc,
    Default = Settings["Kill Boss"],
    Callback = onToggleKillBoss
})

-- Toggle: Kill All Boss
AutoKillBossSection:CreateToggle({
    Title = "Kill All Boss",
    Desc = Desc,
    Default = Settings["Kill All Boss"],
    Callback = onToggleKillAllBoss
})

-- Toggle: Hop Server Find Boss
AutoKillBossSection:CreateToggle({
    Title = "Hop Server Find Boss",
    Desc = Desc,
    Default = Settings["Hop Server Find Boss"],
    Callback = onToggleHopServerFindBoss
})


-- ====================================================================
-- TAB: FRUIT, RAID, DUNGEON
-- ====================================================================
DFRaidMain = Main:CreatePage({
    Page_Name = "Fruit and Raid, Dungeon",
    Page_Title = "Fruit and Raid and Dungeon Tab"
})

DevilFruitSection = DFRaidMain:CreateSection("Devil Fruit")

-- Toggle: Random Devil Fruit
DevilFruitSection:CreateToggle({
    Title = "Random Devil Fruit",
    Desc = Desc,
    Default = Settings["Random Devil Fruit"],
    Callback = onToggleRandomDevilFruit
})

-- Toggle: Auto Store Fruit
DevilFruitSection:CreateToggle({
    Title = "Auto Store Fruit",
    Desc = Desc,
    Default = Settings["Auto Store Fruit"],
    Callback = onToggleAutoStoreFruit
})

-- Dropdown: Blox Fruit Sniper Shop
DevilFruitSection:CreateDropdown({
    Title = "Blox Fruit Sniper Shop",
    List = PrepareMultiSelectList(TableDevilFruit, Settings["Blox Fruit Sniper Shop"]),
    Search = true,
    Selected = true,
    Default = Settings["Blox Fruit Sniper Shop"],
    Callback = onSelectBloxFruitSniperShop
})

-- Toggle: Buy Blox Fruit Sniper Shop
DevilFruitSection:CreateToggle({
    Title = "Buy Blox Fruit Sniper Shop",
    Desc = Desc,
    Default = Settings["Buy Blox Fruit Sniper Shop"],
    Callback = onToggleBuyBloxFruitSniperShop
})


-- ====================================================================
-- TAB: LEVIATHAN EVENT & BOAT SETTINGS
-- ====================================================================
-- Toggle: Auto Start Leviathan
LeviathanEventSection:CreateToggle({
    Title = "Auto Start Leviathan",
    Desc = Desc,
    Default = Settings["Auto Start Leviathan"],
    Callback = onToggleAutoStartLeviathan
})

-- Toggle: Auto Destroy IDK
LeviathanEventSection:CreateToggle({
    Title = "Auto Destroy IDK",
    Desc = Desc,
    Default = Settings["Auto Destroy IDK"],
    Callback = onToggleAutoDestroyIDK
})

-- Toggle: Attack Multi Segments Leviathan
LeviathanEventSection:CreateToggle({
    Title = "Attack Multi Segments Leviathan",
    Desc = "Please enable the damage counter so I can calculate the damage dealt to that segment.\nplz Turn on multi Segments first.",
    Default = Settings["Attack Multi Segments Leviathan"],
    Callback = onToggleAttackMultiSegmentsLeviathan
})

-- Slider: Value Damage Multi Segments
LeviathanEventSection:CreateSlider({
    Title = "Value Damage Multi Segments",
    Min = 0,
    Max = 1000000,
    Precise = true,
    Default = Settings["Value Damage Multi Segments"] or 30000,
    Callback = onSlideValueDamageMultiSegments
})

-- Slider: Speed Boat Auto Drive
LeviathanEventSection:CreateSlider({
    Title = "Speed Boat Auto Drive",
    Min = 0,
    Max = 500,
    Precise = true,
    Default = Settings["Speed Boat Auto Drive"] or 300,
    Callback = onSlideSpeedBoatAutoDrive
})

-- Toggle: Drive Boat To Tiki
LeviathanEventSection:CreateToggle({
    Title = "Drive Boat To Tiki",
    Desc = Desc,
    Default = Settings["Drive Boat To Tiki"],
    Callback = onToggleDriveBoatToTiki
})

-- Toggle: Drive Boat To Hydra
LeviathanEventSection:CreateToggle({
    Title = "Drive Boat To Hydra",
    Desc = Desc,
    Default = Settings["Drive Boat To Hydra"],
    Callback = onToggleDriveBoatToHydra
})

BoatSettingSection = SeaEventTab:CreateSection("Boat Setting")

-- Toggle: Fly Boat
BoatSettingSection:CreateToggle({
    Title = "Fly Boat",
    Desc = Desc,
    Default = Settings["Fly Boat"],
    Callback = onToggleFlyBoat
})


-- ====================================================================
-- TAB: RACE MAIN / RACE V4
-- ====================================================================
-- Toggle: Hop Server Find Boss Cursed Captain
RaceNormalSection:CreateToggle({
    Title = "Hop Server Find Boss Cursed Captain",
    Desc = Desc,
    Default = Settings["Hop Server Get Ghoul"],
    Callback = onToggleHopServerFindBossCursedCaptain
})

-- Toggle: Auto Get Ghoul
RaceNormalSection:CreateToggle({
    Title = "Auto Get Ghoul",
    Desc = Desc,
    Default = Settings["Auto Get Ghoul"],
    Callback = onToggleAutoGetGhoul
})

RaceV4Section = RaceMain:CreateSection("Race V4")

-- Toggle: No Frog
RaceV4Section:CreateToggle({
    Title = "No Frog",
    Desc = Desc,
    Default = Settings["No Frog"],
    Callback = onToggleNoFrog
})

-- Toggle: Teleport Acient Clock
RaceV4Section:CreateToggle({
    Title = "Teleport Acient Clock",
    Desc = Desc,
    Default = Settings["Teleport Acient Clock"],
    Callback = onToggleTeleportAcientClock
})

-- Toggle: Auto Buy Gear
RaceV4Section:CreateToggle({
    Title = "Auto Buy Gear",
    Desc = Desc,
    Default = Settings["Auto Buy Gear"],
    Callback = onToggleAutoBuyGear
})

-- Toggle: Stack Train With Trial Race
RaceV4Section:CreateToggle({
    Title = "Stack Train With Trial Race",
    Desc = Desc,
    Default = Settings["Stack Train With Trial Race"],
    Callback = onToggleStackTrainWithTrialRace
})

-- Toggle: Hop Server [Trial Or Pull Lever]
RaceV4Section:CreateToggle({
    Title = "Hop Server [Trial Or Pull Lever]",
    Desc = Desc,
    Default = Settings["Hop Server [Trial Or Pull Lever]"],
    Callback = onToggleHopServerTrialOrPullLever
})

-- Toggle: Auto Pull Lever
RaceV4Section:CreateToggle({
    Title = "Auto Pull Lever",
    Desc = Desc,
    Default = Settings["Auto Pull Lever"],
    Callback = onToggleAutoPullLever
})

-- Dropdown: Select Players Multi
RaceV4Section:CreateDropdown({
    Title = "Select Players Multi",
    List = PrepareMultiSelectList(DetectNameMulti(), Settings["Select Players Multi"]),
    Search = true,
    Selected = true,
    Default = Settings["Select Players Multi"],
    Callback = onSelectSelectPlayersMulti
})

-- Button: Refresh Player
RaceV4Section:CreateButton({
    Title = "Refresh Player",
    Callback = onClickRefreshPlayer
})

-- Toggle: Multi Trial
RaceV4Section:CreateToggle({
    Title = "Multi Trial",
    Desc = Desc,
    Default = Settings["Multi Trial"],
    Callback = onToggleMultiTrial
})

-- Toggle: Auto Reset Character
RaceV4Section:CreateToggle({
    Title = "Auto Reset Character",
    Desc = Desc,
    Default = Settings["Auto Reset Character"],
    Callback = onAutoResetCharacter
})

-- Toggle: Auto Trial
RaceV4Section:CreateToggle({
    Title = "Auto Trial",
    Desc = Desc,
    Default = Settings["Auto Trial"],
    Callback = onToggleAutoTrial
})

-- Toggle: Auto Turn On V3 Near Door
RaceV4Section:CreateToggle({
    Title = "Auto Turn On V3 Near Door",
    Desc = "will auto turn on race \nif have players near door",
    Default = Settings["Auto Turn On V3 Near Door"],
    Callback = onToggleAutoTurnOnV3NearDoor
})

KillTrialSection = RaceMain:CreateSection("Kill Trial")

-- Dropdown: Select Weapon Attack Trial
KillTrialSection:CreateDropdown({
    Title = "Select Weapon Attack Trial",
    List = {"Melee", "Sword", "Blox Fruit"},
    Search = true,
    Selected = nil,
    Default = Settings["Select Weapon Attack Trial"],
    Callback = onSelectSelectWeaponAttackTrial
})

-- Toggle: Kill players When complete Trial
KillTrialSection:CreateToggle({
    Title = "Kill players When complete Trial",
    Desc = "Turn on before Start Attack and Turn on Auto Trial",
    Default = Settings["Kill players When complete Trial"],
    Callback = onToggleKillPlayersWhenCompleteTrial
})

-- Toggle: Use Skill when Kill Player
KillTrialSection:CreateToggle({
    Title = "Use Skill when Kill Player",
    Desc = Desc,
    Default = Settings["Use Skill when Kill Player"],
    Callback = onToggleUseSkillWhenKillPlayer
})

-- Toggle: Just Use Skill when Player Active Ken
KillTrialSection:CreateToggle({
    Title = "Just Use Skill when Player Active Ken",
    Desc = Desc,
    Default = Settings["Just Use Skill when Player Active Ken"],
    Callback = onToggleJustUseSkillWhenPlayerActiveKen
})


-- ====================================================================
-- TAB: GET AND UPGRADE ITEMS
-- ====================================================================
GetItemsMain = Main:CreatePage({
    Page_Name = "Get and Upgrade Items",
    Page_Title = "Get and Upgrade Items Tab"
})

GetItemsSection = GetItemsMain:CreateSection("Get Items")

-- Toggle: Auto Trade Bone
GetItemsSection:CreateToggle({
    Title = "Auto Trade Bone",
    Desc = Desc,
    Default = Settings["Auto Trade Bone"],
    Callback = onToggleAutoTradeBone
})

-- Toggle: Auto Buy Legendary Sword
GetItemsSection:CreateToggle({
    Title = "Auto Buy Legendary Sword",
    Desc = Desc,
    Default = Settings["Auto Buy Legendary Sword"],
    Callback = onToggleAutoBuyLegendarySword
})

-- Toggle: Auto Buy Haki Color
GetItemsSection:CreateToggle({
    Title = "Auto Buy Haki Color",
    Desc = Desc,
    Default = Settings["Auto Buy Haki Color"],
    Callback = onToggleAutoBuyHakiColor
})

-- Toggle: Hop Server [ Haki color or Legendary Sword]
GetItemsSection:CreateToggle({
    Title = "Hop Server [ Haki color or Legendary Sword]",
    Desc = Desc,
    Default = Settings["Hop Server [ Haki color or Legendary Sword]"],
    Callback = onToggleHopServerHakiColorOrLegendarySword
})

-- Toggle: Auto Get Rainbow Haki
GetItemsSection:CreateToggle({
    Title = "Auto Get Rainbow Haki",
    Desc = Desc,
    Default = Settings["Auto Get Rainbow Haki"],
    Callback = onToggleAutoGetRainbowHaki
})

-- Toggle: Auto Soul Guitar
GetItemsSection:CreateToggle({
    Title = "Auto Soul Guitar",
    Desc = Desc,
    Default = Settings["Auto Soul Guitar"],
    Callback = onToggleAutoSoulGuitar
})

-- Dropdown: Select Method Hop CDK
GetItemsSection:CreateDropdown({
    Title = "Select Method Hop CDK",
    List = PrepareMultiSelectList(MethodHopCDk, Settings["Select Method Hop CDK1"]),
    Search = true,
    Selected = true,
    Default = Settings["Select Method Hop CDK1"],
    Callback = onSelectSelectMethodHopCDK
})

-- Toggle: Auto CDK
GetItemsSection:CreateToggle({
    Title = "Auto CDK",
    Desc = Desc,
    Default = Settings["Auto CDK"],
    Callback = onToggleAutoCDK
})

-- Toggle: Auto Yama
GetItemsSection:CreateToggle({
    Title = "Auto Yama",
    Desc = Desc,
    Default = Settings["Auto Yama"],
    Callback = onToggleAutoYama
})

-- Toggle: Auto Tushita
GetItemsSection:CreateToggle({
    Title = "Auto Tushita",
    Desc = Desc,
    Default = Settings["Auto Tushita"],
    Callback = onToggleAutoTushita
})

-- Toggle: Auto TTK
GetItemsSection:CreateToggle({
    Title = "Auto TTK",
    Desc = Desc,
    Default = Settings["Auto TTK"],
    Callback = onToggleAutoTTK
})

-- Toggle: Auto Saber
GetItemsSection:CreateToggle({
    Title = "Auto Saber",
    Desc = Desc,
    Default = Settings["Auto Saber"],
    Callback = onToggleAutoSaber
})

-- Toggle: Auto Craft Item Shark Anchor
GetItemsSection:CreateToggle({
    Title = "Auto Craft Item Shark Anchor",
    Desc = Desc,
    Default = Settings["Auto Craft Item Shark Anchor"],
    Callback = onChangeAutoCraftItemSharkAnchor
})

-- Toggle: Auto Yoru Mini
GetItemsSection:CreateToggle({
    Title = "Auto Yoru Mini",
    Desc = "u need have 3 haki legendary,\nit will auto chest, kill Elite Hunter Find Chalice,\nSummon And Kill Rip Indra",
    Default = Settings["Auto Yoru Mini"],
    Callback = onToggleAutoYoruMini
})

-- Toggle: Auto Yoru Mini (Hop Server)
GetItemsSection:CreateToggle({
    Title = "Auto Yoru Mini (Hop Server)",
    Desc = "u can change value hop chest in Tab Farming Other",
    Default = Settings["Auto Yoru Mini"],
    Callback = onToggleAutoYoruMiniHopServer
})

MasteryWeaponSection = GetItemsMain:CreateSection("Mastery Weapon")

-- Toggle: Auto Farm Mastery 600 Melees
MasteryWeaponSection:CreateToggle({
    Title = "Auto Farm Mastery 600 Melees",
    Desc = Desc,
    Default = Settings["Auto Farm Mastery 600 Melees"],
    Callback = onToggleAutoFarmMastery600Melees
})

-- Toggle: Auto Farm Mastery 600 Sword In Inventory
MasteryWeaponSection:CreateToggle({
    Title = "Auto Farm Mastery 600 Sword In Inventory",
    Desc = Desc,
    Default = Settings["Auto Farm Mastery 600 Sword In Inventory"],
    Callback = onChangeAutoFarmMastery600SwordInInventory
})

UpgradeWeaponSection = GetItemsMain:CreateSection("Upgrade Weapon")

-- Label: Status Upgrade Weapon
StatusUpgradeWP = UpgradeWeaponSection:CreateLabel({
    Title = ""
})

-- Toggle: Auto Upgrade Sword Inventory
UpgradeWeaponSection:CreateToggle({
    Title = "Auto Upgrade Sword Inventory",
    Desc = Desc,
    Default = Settings["Auto Upgrade Sword Inventory"],
    Callback = onToggleAutoUpgradeSwordInventory
})

-- Toggle: Auto Upgrade Gun Inventory
UpgradeWeaponSection:CreateToggle({
    Title = "Auto Upgrade Gun Inventory",
    Desc = Desc,
    Default = Settings["Auto Upgrade Gun Inventory"],
    Callback = onToggleAutoUpgradeGunInventory
})


-- ====================================================================
-- TAB: VOLCANO EVENT
-- ====================================================================
VolcanoTab = Main:CreatePage({
    Page_Name = "Volcano Event",
    Page_Title = "Volcano Event Tab"
})

SettingsVolcanoSection = VolcanoTab:CreateSection("Settings Volcano")

-- Dropdown: Select Weapon Kill Golem
SettingsVolcanoSection:CreateDropdown({
    Title = "Select Weapon Kill Golem",
    List = {"Melee", "Sword", "Blox Fruit"},
    Search = true,
    Selected = nil,
    Default = Settings["Select Weapon Kill Golem"],
    Callback = onChangeSelectWeaponKillGolem
})

-- Dropdown: Select Weapons Fix Lava
SettingsVolcanoSection:CreateDropdown({
    Title = "Select Weapons Fix Lava",
    List = PrepareMultiSelectList(WeaponsList, Settings["Select Weapons Fix Lava"]),
    Search = true,
    Selected = true,
    Default = Settings["Select Weapons Fix Lava"],
    Callback = onSelectSelectWeaponsFixLava
})

-- Dropdown: Select Method Kill Golem
SettingsVolcanoSection:CreateDropdown({
    Title = "Select Method Kill Golem",
    List = {"Click M1", "Instant Kill [ Risk and can bug no die mob ]"},
    Search = true,
    Selected = nil,
    Default = Settings["Select Method Kill Golem"],
    Callback = onSelectSelectMethodKillGolem
})

FarmingVolcanoSection = VolcanoTab:CreateSection("Farming Volcano")

-- Toggle: Auto Crafting Volcanic Magnet
FarmingVolcanoSection:CreateToggle({
    Title = "Auto Crafting Volcanic Magnet",
    Desc = Desc,
    Default = Settings["Auto Crafting Volcanic Magnet"],
    Callback = onToggleAutoCraftingVolcanicMagnet
})

-- Toggle: Auto Find Prehistoric Island
FarmingVolcanoSection:CreateToggle({
    Title = "Auto Find Prehistoric Island",
    Desc = Desc,
    Default = Settings["Auto Find Prehistoric Island"],
    Callback = onToggleAutoFindPrehistoricIsland
})

-- Toggle: Auto Event Prehistoric Island
FarmingVolcanoSection:CreateToggle({
    Title = "Auto Event Prehistoric Island",
    Desc = "auto Start Event and Auto kill golem, Auto Fix Volcano",
    Default = Settings["Auto Event Prehistoric Island"],
    Callback = onToggleAutoEventPrehistoricIsland
})

-- Toggle: Auto Collect Bone
FarmingVolcanoSection:CreateToggle({
    Title = "Auto Collect Bone",
    Desc = Desc,
    Default = Settings["Auto Collect Bone"],
    Callback = onToggleAutoCollectBone
})

-- Toggle: Auto Collect Egg
FarmingVolcanoSection:CreateToggle({
    Title = "Auto Collect Egg",
    Desc = Desc,
    Default = Settings["Auto Collect Egg"],
    Callback = onToggleAutoCollectEgg
})

FullyVolcanoSection = VolcanoTab:CreateSection("Fully Volcano")

-- Toggle: Ignore Craft Volcanic Magnet [ Fully ]
FullyVolcanoSection:CreateToggle({
    Title = "Ignore Craft Volcanic Magnet [ Fully ]",
    Desc = Desc,
    Default = Settings["Ignore Craft Volcanic Magnet [ Fully ]"]
})


-- ====================================================================
-- TAB: FARM OBSERVATION & FISHING
-- ====================================================================
-- Toggle: Farm Observation
FarmObservationSection:CreateToggle({
    Title = "Farm Observation",
