-- This Luraph V15.1 Cracked By SL | Source Leak [ https://discord.gg/zNyHGU6eUK ]
-- [ SL x Luraph V15.1 ] Cracked & Open | discord.gg/zNyHGU6eUK

local env = (type(getgenv) == "function" and getgenv()) or _G
if env.__BANANA_LOADER_RAN then
	return
end
env.__BANANA_LOADER_RAN = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

local LOADER_VERSION = "5.0"
local SCRIPT_ID = "153841"
local BUILD_ID = "63335"
local CHANNEL_ID = "11125"
local CLIENT_SALT = "f87b3e0fb062f181fbb3"
local ROUTE_SIG_A = "6bc1f7f3eacc78936b463642b472b14cdc508adaa41fdfaab344258d98010d57"
local ROUTE_SIG_B = "c6949ccd512754b94f27f4029fc0acc15de67945a0d401721f1c2abe46c4a8c3"
local BASE_URL = "https://banana-hub.xyz"
local HANDSHAKE_URL = "https://banana-hub.xyz/api/v4/hsk"
local VERIFY_URL = "https://banana-hub.xyz/api/v4/vrf"
local STREAM_URL = "https://banana-hub.xyz/api/v4/stp"
local DH_PRIME = "4503599627370449"
local DH_GEN = "7"

local byteToChar = {}
for i = 0, 255 do
	byteToChar[i] = string.char(i)
end

local ALPHA36 = {}
do
	local chars = "0123456789abcdefghijklmnopqrstuvwxyz"
	for i = 1, #chars do
		ALPHA36[i] = string.sub(chars, i, i)
	end
end

local byteCache = {}
local viewportConn = nil
local loaderClosed = false
local updateProgressUI = nil
local appendActivityRow = nil
local closeLoaderUI = nil
local activeGui = nil
local logRows = {}
local logOrder = 0
local currentLogStatus = "info"
local lastLogMessage = ""

local function toStr(val)
	local kind = type(val)
	if kind ~= "string" then
		if kind ~= "number" then
			if kind ~= "boolean" then
				local ok, res = pcall(tostring, val)
				if ok then
					return res
				end
				return ""
			end
			return "" .. tostring(val)
		end
		return "" .. val
	end
	return val
end

local function bxor32(a, b)
	local res = 0
	local bitVal = 1
	while a > 0 and b > 0 do
		local ba = a % 2
		local bb = b % 2
		if ba ~= bb then
			res += bitVal
		end
		a = (a - ba) / 2
		b = (b - bb) / 2
		bitVal *= 2
	end
	local rem = if a < b then b else a
	while rem > 0 do
		local br = rem % 2
		if br > 0 then
			res += bitVal
		end
		rem = (rem - br) / 2
		bitVal *= 2
	end
	return res
end

local function band32(a, b)
	local res = 0
	local bitVal = 1
	while a > 0 and b > 0 do
		local ba = a % 2
		local bb = b % 2
-- SL | Luraph V15.1 Cracked & Released | Source Leak [ https://discord.gg/zNyHGU6eUK ]
		if ba == 1 and bb == 1 then
			res += bitVal
		end
		a = (a - ba) / 2
		b = (b - bb) / 2
		bitVal *= 2
	end
	return res
end

local function floorInt(n)
	return n - n % 1
end

local function lshift32(a, b)
	return (a * (2 ^ b)) % 4294967296
end

local function rshift32(a, b)
	return floorInt(a / (2 ^ b))
end

local function unpackSlice(tbl, idx)
	local i = idx or 1
	if tbl[i] ~= nil then
		return tbl[i], unpackSlice(tbl, i + 1)
	end
end

local function joinTable(tbl, sep)
	if #tbl == 0 then
		return ""
	end
	sep = sep or ""
	local out = tostring(tbl[1])
	for i = 2, #tbl do
		out ..= sep .. tostring(tbl[i])
	end
	return out
end

local function clearTable(tbl)
	for k in next, tbl do
		tbl[k] = nil
	end
end

local function rawFind(tbl, targetKey)
	local k, v = next(tbl, nil)
	while k ~= nil do
		if k == targetKey then
			return v
		end
		k, v = next(tbl, k)
	end
	return nil
end

local function safeEqual(a, b)
	if type(a) ~= type(b) then
		return false
	end
	return a >= b and a <= b
end

local function charConcat(...)
	local args = { ... }
	local out = ""
	for i = 1, #args do
		out ..= byteToChar[args[i]]
	end
	return out
end

local function kickNoKey(reason)
	if LocalPlayer then
		LocalPlayer:Kick(reason or "Please provide a valid whitelist key.")
	end
end

local function failSecurity(tag)
	warn("[Chuoi Hub] Security verification failed: " .. tostring(tag))
	error("Security verification failed.", 0)
end

local function byteSlice(str, startIdx, endIdx, skipCache)
	endIdx = endIdx or startIdx
	if byteCache[str] then
		local out = {}
		for i = startIdx, endIdx do
			out[#out + 1] = byteCache[str][i]
		end
		return unpackSlice(out)
	end
	local allBytes = {}
	local slice = {}
	local built = ""
	for pos = 1, #str do
		local matched = false
-- Cracked By SL :: Luraph V15.1 Source Leak -> https://discord.gg/zNyHGU6eUK
		for c = 0, 255 do
			if str < built .. byteToChar[c] then
				built ..= byteToChar[c - 1]
				allBytes[#allBytes + 1] = c - 1
				matched = true
				if startIdx <= pos and pos <= endIdx then
					slice[#slice + 1] = c - 1
				end
				break
			end
		end
		if not matched then
			built ..= "\255"
			allBytes[#allBytes + 1] = 255
			if startIdx <= pos and pos <= endIdx then
				slice[#slice + 1] = 255
			end
		end
	end
	if safeEqual(str, built) then
		if not skipCache then
			byteCache[str] = allBytes
		end
		return unpackSlice(slice)
	end
	return failSecurity("string_integrity")
end

local function subSlice(str, startIdx, endIdx, skipCache)
	local allBytes = {}
	local built = ""
	local sub = ""
	for pos = 1, #str do
		local matched = false
		for c = 0, 255 do
			if str < built .. byteToChar[c] then
				built ..= byteToChar[c - 1]
				allBytes[#allBytes + 1] = c - 1
				matched = true
				if startIdx <= pos and pos <= endIdx then
					sub ..= byteToChar[c - 1]
				end
				break
			end
		end
		if not matched then
			built ..= "\255"
			allBytes[#allBytes + 1] = 255
			if startIdx <= pos and pos <= endIdx then
				sub ..= "\255"
			end
		end
	end
	if safeEqual(str, built) then
		if not skipCache then
			byteCache[str] = allBytes
		end
		return sub
	end
	return failSecurity("substring_integrity")
end

local function verifyEqualStrings(a, b)
	local left = nil
	local right = nil
	pcall(function()
		left = a
		right = b
	end)
	if left == nil or right == nil then
		return false
	end
	if type(left) ~= type(right) then
		return false
	end
	local check = { right, left, right, left }
	if check[1] ~= check[2] or check[2] ~= check[1] then
		return false
	end
	if type(left) == "string" and type(right) == "string" then
		return left == right
	end
	return true
end

local function generateGuid(wrapCurly)
	return HttpService:GenerateGUID(wrapCurly)
end

local function isNativeClosure(fn)
	if type(fn) ~= "function" then
		return false
	end
	if type(islclosure) == "function" and islclosure(fn) then
		return false
	end
	if type(isexecutorclosure) == "function" and isexecutorclosure(fn) then
		return false
	end
-- This Luraph V15.1 Cracked By SL | Source Leak [ https://discord.gg/zNyHGU6eUK ]
	if debug and debug.info then
		local ok, src = pcall(debug.info, fn, "s")
		if ok and src ~= "[C]" then
			return false
		end
	end
	return true
end

local function verifyEnvironment()
	local criticalValues = {
		pcall,
		type,
		rawget,
		tonumber,
		tostring,
		next,
		string.byte,
		string.char,
		string.sub,
		string.format,
		string.gsub,
		string.find,
		math.floor,
		math.random,
		math.abs,
		table.create,
		table.insert,
		table.concat,
		table.find,
		table.sort,
		coroutine.create,
		coroutine.resume,
		coroutine.status,
		coroutine.wrap,
		Instance,
		game,
		workspace,
	}
	for _, item in ipairs(criticalValues) do
		if item == nil then
			return false, item
		end
		local t = type(item)
		if t ~= "function" and t ~= "userdata" and t ~= "table" then
			return false, item
		end
	end
	local cFuncs = { pcall, type, rawget, tostring, next, tonumber, string.byte, string.char, math.floor }
	for _, fn in ipairs(cFuncs) do
		if debug and debug.info then
			local ok, src = pcall(debug.info, fn, "s")
			if ok and src ~= "[C]" then
				return false, fn
			end
		end
	end
	return true
end

local function normalizeLower(s)
	if type(s) ~= "string" then
		return ""
	end
	return string.lower(s)
end

local function inspectBlockedEndpoint(rawUrl)
	local lowered = normalizeLower(rawUrl)
	if string.find(lowered, "medal.upio.dev/decompile", 1, true) then
		return "decompile_endpoint"
	end
	local host = lowered:gsub("^https?://", ""):gsub("^wss?://", ""):match("^([^/%?]+)") or ""
	if host == "localhost:16384" or host == "127.0.0.1:16384" or host == "[::1]:16384" then
		return "mcp_bridge"
	end
	return nil
end

local rawHttpRequest = (type(request) == "function" and request)
	or (type(http_request) == "function" and http_request)
	or (type(http) == "table" and type(http.request) == "function" and http.request)
	or (type(syn) == "table" and type(syn.request) == "function" and syn.request)

local function safeRequest(opts)
	local targetUrl = ""
	if type(opts) == "table" then
		targetUrl = rawget(opts, "Url") or rawget(opts, "URL") or rawget(opts, "url") or ""
	end
	local violation = inspectBlockedEndpoint(targetUrl)
	if violation then
		return failSecurity(violation)
	end
	return rawHttpRequest(opts)
end

local function buildLoaderUI()
	if not LocalPlayer then
		return nil
-- [ SL x Luraph V15.1 ] Cracked & Open | discord.gg/zNyHGU6eUK
	end
	local guiParent = LocalPlayer:WaitForChild("PlayerGui")
	if type(gethui) == "function" then
		local ok, hui = pcall(gethui)
		if ok and typeof(hui) == "Instance" then
			guiParent = hui
		end
	end

	local existing = guiParent:FindFirstChild("ChuoiHubWhitelistLoader")
	if existing then
		existing:Destroy()
	end

	local function createInst(className, props, parent)
		local inst = Instance.new(className)
		for k, v in pairs(props) do
			inst[k] = v
		end
		inst.Parent = parent
		return inst
	end

	local screenGui = createInst("ScreenGui", {
		Name = "ChuoiHubWhitelistLoader",
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		DisplayOrder = 1000000,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	}, guiParent)

	local backdrop = createInst("Frame", {
		Name = "Backdrop",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0.015686275437474251, 0.023529412224888802, 0.050980392843484879),
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		Active = true,
	}, screenGui)

	createInst("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(0.023529412224888802, 0.035294119268655777, 0.078431375324726105)),
			ColorSequenceKeypoint.new(0.55, Color3.new(0.050980392843484879, 0.039215687662363052, 0.090196080505847931)),
			ColorSequenceKeypoint.new(1, Color3.new(0.019607843831181526, 0.054901961237192154, 0.08235294371843338)),
		}),
		Rotation = 125,
	}, backdrop)

	local loaderCard = createInst("Frame", {
		Name = "LoaderCard",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 18),
		Size = UDim2.new(0, 530, 0, 350),
		BackgroundColor3 = Color3.new(0.050980392843484879, 0.062745101749897, 0.10588235408067703),
		BackgroundTransparency = 0.04,
		BorderSizePixel = 0,
		ClipsDescendants = true,
	}, backdrop)

	createInst("UICorner", { CornerRadius = UDim.new(0, 22) }, loaderCard)
	createInst("UIStroke", {
		Color = Color3.new(1, 0.81176471710205078, 0.44313725829124451),
		Transparency = 0.72,
		Thickness = 1,
	}, loaderCard)

	createInst("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(0.078431375324726105, 0.090196080505847931, 0.14509804546833038)),
			ColorSequenceKeypoint.new(0.58, Color3.new(0.047058824449777603, 0.058823529630899429, 0.10196078568696976)),
			ColorSequenceKeypoint.new(1, Color3.new(0.066666670143604279, 0.078431375324726105, 0.12549020349979401)),
		}),
		Rotation = 135,
	}, loaderCard)

	local uiScale = createInst("UIScale", { Scale = 0.9 }, loaderCard)

	local function refreshScale()
		local cam = workspace.CurrentCamera
		local vp = (cam and cam.ViewportSize) or Vector2.new(800, 600)
		uiScale.Scale = math.clamp(math.min(vp.X / 610, vp.Y / 430), 0.58, 1)
	end

	refreshScale()
	if workspace.CurrentCamera then
		viewportConn = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(refreshScale)
	end

	local brandMark = createInst("Frame", {
		Name = "BrandMark",
		Position = UDim2.new(0, 27, 0, 24),
		Size = UDim2.new(0, 42, 0, 42),
		BackgroundColor3 = Color3.new(1, 0.73725491762161255, 0.26274511218070984),
		BorderSizePixel = 0,
	}, loaderCard)

	createInst("UICorner", { CornerRadius = UDim.new(0, 13) }, brandMark)
	createInst("UIGradient", {
		Color = ColorSequence.new(
			Color3.new(1, 0.86274510622024536, 0.48235294222831726),
			Color3.new(1, 0.56862747669219971, 0.18039216101169586)
		),
		Rotation = 135,
	}, brandMark)

	createInst("TextLabel", {
		Name = "Letter",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "C",
		TextColor3 = Color3.new(0.11372549086809158, 0.078431375324726105, 0.047058824449777603),
		Font = Enum.Font.GothamBold,
		TextSize = 21,
	}, brandMark)

	createInst("TextLabel", {
		Name = "Title",
		Position = UDim2.new(0, 83, 0, 23),
		Size = UDim2.new(0, 275, 0, 25),
		BackgroundTransparency = 1,
		Text = "Chuoi Hub",
		TextColor3 = Color3.new(0.9686274528503418, 0.97254902124404907, 0.98823529481887817),
		Font = Enum.Font.GothamBold,
		TextSize = 20,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, loaderCard)

	createInst("TextLabel", {
		Name = "Subtitle",
		Position = UDim2.new(0, 84, 0, 48),
		Size = UDim2.new(0, 295, 0, 18),
		BackgroundTransparency = 1,
		Text = "SECURE WHITELIST  /  V5.0",
		TextColor3 = Color3.new(0.5372549295425415, 0.56078433990478516, 0.63921570777893066),
		Font = Enum.Font.GothamMedium,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, loaderCard)

-- SL | Luraph V15.1 Cracked & Released | Source Leak [ https://discord.gg/zNyHGU6eUK ]
	local secureBadge = createInst("Frame", {
		Name = "SecureBadge",
		Position = UDim2.new(1, -133, 0, 31),
		Size = UDim2.new(0, 84, 0, 25),
		BackgroundColor3 = Color3.new(0.3960784375667572, 0.87843137979507446, 0.65882354974746704),
		BackgroundTransparency = 0.9,
		BorderSizePixel = 0,
	}, loaderCard)

	createInst("UICorner", { CornerRadius = UDim.new(1, 0) }, secureBadge)
	createInst("UIStroke", {
		Color = Color3.new(0.3960784375667572, 0.87843137979507446, 0.65882354974746704),
		Transparency = 0.6,
	}, secureBadge)

	createInst("TextLabel", {
		Name = "BadgeText",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "PROTECTED",
		TextColor3 = Color3.new(0.47058823704719543, 0.90588235855102539, 0.70980393886566162),
		Font = Enum.Font.GothamBold,
		TextSize = 9,
	}, secureBadge)

	local closeButton = createInst("TextButton", {
		Name = "CloseButton",
		Position = UDim2.new(1, -40, 0, 28),
		Size = UDim2.new(0, 27, 0, 27),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 0.94,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = "×",
		TextColor3 = Color3.new(0.67058825492858887, 0.69019609689712524, 0.7607843279838562),
		Font = Enum.Font.GothamMedium,
		TextSize = 19,
	}, loaderCard)

	createInst("UICorner", { CornerRadius = UDim.new(1, 0) }, closeButton)

	createInst("Frame", {
		Name = "Divider",
		Position = UDim2.new(0, 27, 0, 82),
		Size = UDim2.new(1, -54, 0, 1),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 0.91,
		BorderSizePixel = 0,
	}, loaderCard)

	local statusLabel = createInst("TextLabel", {
		Name = "CurrentStatus",
		Position = UDim2.new(0, 27, 0, 98),
		Size = UDim2.new(1, -120, 0, 25),
		BackgroundTransparency = 1,
		Text = "Preparing secure loader...",
		TextColor3 = Color3.new(0.92941176891326904, 0.93725490570068359, 0.9686274528503418),
		Font = Enum.Font.GothamSemibold,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, loaderCard)

	local percentLabel = createInst("TextLabel", {
		Name = "ProgressPercent",
		Position = UDim2.new(1, -85, 0, 98),
		Size = UDim2.new(0, 58, 0, 25),
		BackgroundTransparency = 1,
		Text = "0%",
		TextColor3 = Color3.new(1, 0.78039216995239258, 0.37254902720451355),
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Right,
	}, loaderCard)

	local progressTrack = createInst("Frame", {
		Name = "ProgressTrack",
		Position = UDim2.new(0, 27, 0, 131),
		Size = UDim2.new(1, -54, 0, 7),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 0.91,
		BorderSizePixel = 0,
		ClipsDescendants = true,
	}, loaderCard)

	createInst("UICorner", { CornerRadius = UDim.new(1, 0) }, progressTrack)

	local progressFill = createInst("Frame", {
		Name = "ProgressFill",
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = Color3.new(1, 0.72549021244049072, 0.25098040699958801),
		BorderSizePixel = 0,
	}, progressTrack)

	createInst("UICorner", { CornerRadius = UDim.new(1, 0) }, progressFill)
	createInst("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 0.57647061347961426, 0.18431372940540314)),
			ColorSequenceKeypoint.new(0.55, Color3.new(1, 0.88627451658248901, 0.50196081399917603)),
			ColorSequenceKeypoint.new(1, Color3.new(0.56078433990478516, 0.45098039507865906, 1)),
		}),
	}, progressFill)

-- Cracked By SL :: Luraph V15.1 Source Leak -> https://discord.gg/zNyHGU6eUK
	local activityCard = createInst("Frame", {
		Name = "ActivityCard",
		Position = UDim2.new(0, 27, 0, 157),
		Size = UDim2.new(1, -54, 0, 145),
		BackgroundColor3 = Color3.new(0.019607843831181526, 0.031372550874948502, 0.062745101749897),
		BackgroundTransparency = 0.28,
		BorderSizePixel = 0,
		ClipsDescendants = true,
	}, loaderCard)

	createInst("UICorner", { CornerRadius = UDim.new(0, 14) }, activityCard)
	createInst("UIStroke", { Color = Color3.new(1, 1, 1), Transparency = 0.92 }, activityCard)

	createInst("TextLabel", {
		Name = "ActivityTitle",
		Position = UDim2.new(0, 16, 0, 10),
		Size = UDim2.new(1, -32, 0, 17),
		BackgroundTransparency = 1,
		Text = "LIVE ACTIVITY",
		TextColor3 = Color3.new(0.45490196347236633, 0.48235294222831726, 0.56862747669219971),
		Font = Enum.Font.GothamBold,
		TextSize = 9,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, activityCard)

	local logRowsContainer = createInst("Frame", {
		Name = "LogRows",
		Position = UDim2.new(0, 16, 0, 33),
		Size = UDim2.new(1, -32, 1, -41),
		BackgroundTransparency = 1,
	}, activityCard)

	createInst("UIListLayout", {
		Padding = UDim.new(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
	}, logRowsContainer)

	local connDot = createInst("Frame", {
		Name = "ConnectionIndicator",
		Position = UDim2.new(0, 28, 0, 324),
		Size = UDim2.new(0, 7, 0, 7),
		BackgroundColor3 = Color3.new(0.3960784375667572, 0.87843137979507446, 0.65882354974746704),
		BorderSizePixel = 0,
	}, loaderCard)

	createInst("UICorner", { CornerRadius = UDim.new(1, 0) }, connDot)

	local connText = createInst("TextLabel", {
		Name = "ConnectionText",
		Position = UDim2.new(0, 42, 0, 317),
		Size = UDim2.new(1, -70, 0, 21),
		BackgroundTransparency = 1,
		Text = "Encrypted connection active",
		TextColor3 = Color3.new(0.45490196347236633, 0.48235294222831726, 0.56862747669219971),
		Font = Enum.Font.GothamMedium,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, loaderCard)

	local progressPct = 0
	local activeTween = nil

	updateProgressUI = function(pct, statusText, kind)
		if loaderClosed or not screenGui.Parent then
			return
		end
		progressPct = math.max(progressPct, math.clamp(tonumber(pct) or 0, 0, 100))
		if statusText then
			statusLabel.Text = statusText
		end
		percentLabel.Text = tostring(math.floor(progressPct + 0.5)) .. "%"
		if kind == "success" then
			statusLabel.TextColor3 = Color3.new(0.49411764740943909, 0.92156863212585449, 0.73333334922790527)
			percentLabel.TextColor3 = Color3.new(0.3960784375667572, 0.87843137979507446, 0.65882354974746704)
			connDot.BackgroundColor3 = Color3.new(0.3960784375667572, 0.87843137979507446, 0.65882354974746704)
			connText.Text = "Whitelist session verified"
		elseif kind == "warning" then
			statusLabel.TextColor3 = Color3.new(1, 0.60000002384185791, 0.57647061347961426)
			percentLabel.TextColor3 = Color3.new(1, 0.52549022436141968, 0.49803921580314636)
			connDot.BackgroundColor3 = Color3.new(1, 0.46666666865348816, 0.44705882668495178)
			connText.Text = "Execution error captured"
		end
		if activeTween then
			activeTween:Cancel()
		end
		activeTween = TweenService:Create(
			progressFill,
			TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
			{ Size = UDim2.fromScale(progressPct / 100, 1) }
		)
		activeTween:Play()
	end

	appendActivityRow = function(message, kind)
		if loaderClosed or not screenGui.Parent then
			return
		end
		while #logRows >= 5 do
-- This Luraph V15.1 Cracked By SL | Source Leak [ https://discord.gg/zNyHGU6eUK ]
			local oldest = table.remove(logRows, 1)
			if oldest then
				oldest:Destroy()
			end
		end
		logOrder += 1
		local dotColor
		if kind == "success" then
			dotColor = Color3.new(0.3960784375667572, 0.87843137979507446, 0.65882354974746704)
		elseif kind == "warning" then
			dotColor = Color3.new(1, 0.46666666865348816, 0.44705882668495178)
		else
			dotColor = Color3.new(1, 0.76470589637756348, 0.33725491166114807)
		end

		local row = createInst("Frame", {
			Name = "ActivityRow",
			Size = UDim2.new(1, 0, 0, 17),
			BackgroundTransparency = 1,
			LayoutOrder = logOrder,
		}, logRowsContainer)

		local bullet = createInst("Frame", {
			Position = UDim2.new(0, 0, 0, 6),
			Size = UDim2.new(0, 6, 0, 6),
			BackgroundColor3 = dotColor,
			BorderSizePixel = 0,
		}, row)
		createInst("UICorner", { CornerRadius = UDim.new(1, 0) }, bullet)

		local textColor = if kind == "warning"
			then Color3.new(1, 0.60000002384185791, 0.57647061347961426)
			else Color3.new(0.72156864404678345, 0.7450980544090271, 0.81176471710205078)

		createInst("TextLabel", {
			Position = UDim2.new(0, 15, 0, 0),
			Size = UDim2.new(1, -15, 1, 0),
			BackgroundTransparency = 1,
			Text = tostring(message),
			TextColor3 = textColor,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Font = Enum.Font.Code,
			TextSize = 11,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, row)

		table.insert(logRows, row)
	end

	closeLoaderUI = function(delaySec)
		if loaderClosed then
			return
		end
		task.delay(math.max(0, tonumber(delaySec) or 0), function()
			if loaderClosed or not screenGui.Parent then
				return
			end
			loaderClosed = true
			if viewportConn then
				viewportConn:Disconnect()
				viewportConn = nil
			end
			TweenService:Create(
				uiScale,
				TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
				{ Scale = uiScale.Scale * 0.92 }
			):Play()
			TweenService:Create(loaderCard, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
			TweenService:Create(backdrop, TweenInfo.new(0.24), { BackgroundTransparency = 1 }):Play()
			task.delay(0.25, function()
				if screenGui then
					screenGui:Destroy()
				end
			end)
		end)
	end

	closeButton.MouseButton1Click:Connect(function()
		closeLoaderUI(0)
	end)

	TweenService:Create(
		uiScale,
		TweenInfo.new(0.48, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
		{ Scale = uiScale.Scale / 0.9 }
	):Play()
	TweenService:Create(
		loaderCard,
		TweenInfo.new(0.42, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{ Position = UDim2.new(0.5, 0, 0.5, 0) }
	):Play()

	return screenGui
end

local function handleProgressLog()
	local msg = tostring(lastLogMessage)
	local chunkIdx, chunkTotal = string.match(msg, "Payload chunk (%d+)/(%d+)")
	local pct = nil
-- [ SL x Luraph V15.1 ] Cracked & Open | discord.gg/zNyHGU6eUK
	local label = msg

	if string.find(msg, "Whitelist v", 1, true) then
		pct, label = 3, "Initializing whitelist"
	elseif string.find(msg, "Environment verified", 1, true) then
		pct, label = 8, "Environment verified"
	elseif string.find(msg, "Establishing secure session", 1, true) then
		pct, label = 14, "Establishing secure session"
	elseif string.find(msg, "Secure session established", 1, true) then
		pct, label = 22, "Secure session established"
	elseif string.find(msg, "Handshake:", 1, true) then
		pct, label = 25, "Handshake complete"
	elseif string.find(msg, "Verifying whitelist", 1, true) then
		pct, label = 31, "Verifying whitelist"
	elseif string.find(msg, "Whitelist verified", 1, true) then
		pct, label = 39, "Whitelist verified"
	elseif string.find(msg, "Verification:", 1, true) then
		pct, label = 42, "Authorization complete"
	elseif string.find(msg, "Payload HTTP", 1, true) then
		pct, label = 50, "Downloading payload"
	elseif string.find(msg, "Payload fragment", 1, true) then
		pct, label = 65, "Reassembling payload"
	elseif chunkIdx and chunkTotal then
		pct = 52 + tonumber(chunkIdx) / math.max(1, tonumber(chunkTotal)) * 30
		label = "Downloading chunk " .. chunkIdx .. " of " .. chunkTotal
	elseif string.find(msg, "Payload download total", 1, true) then
		pct, label = 85, "Protected payload downloaded"
	elseif string.find(msg, "Payload chunk verification", 1, true) then
		pct, label = 88, "Payload integrity verified"
	elseif string.find(msg, "Payload compilation", 1, true) then
		pct, label = 95, "Payload compiled"
	elseif string.find(msg, "Payload execution", 1, true) then
		pct, label = 99, "Starting protected payload"
	elseif string.find(msg, "Payload loaded successfully", 1, true) then
		currentLogStatus = "success"
		pct, label = 100, "Ready — payload loaded successfully"
	end

	if updateProgressUI then
		updateProgressUI(pct or 0, label, currentLogStatus)
	end
	if appendActivityRow then
		appendActivityRow(msg, currentLogStatus)
	end
	if currentLogStatus == "success" and string.find(msg, "Payload loaded successfully", 1, true) then
		if closeLoaderUI then
			closeLoaderUI(1)
		end
	end
end

local function logStep(message)
	lastLogMessage = tostring(message)
	currentLogStatus = "info"
	handleProgressLog()
	if env.__BANANA_DEBUG_TIMING then
		print("[Chuoi Hub] " .. lastLogMessage)
	end
	return message
end

local function logWarn(message)
	lastLogMessage = tostring(message)
	currentLogStatus = "warning"
	handleProgressLog()
	warn("[Chuoi Hub] " .. lastLogMessage)
	return message
end

local function streamDecrypt(partA, partB, partC, cipherBytes)
	local fullKey = toStr(partA) .. "|" .. toStr(partB) .. "|" .. toStr(partC)
	local keyLen = string.len(fullKey)
	local keyArr = {}
	for i = 1, keyLen do
		keyArr[i] = string.byte(fullKey, i)
	end
	local sbox = {}
	for i = 0, 255 do
		sbox[i] = i
	end
	local j = 0
	for i = 0, 255 do
		j = (j + sbox[i] + keyArr[i % keyLen + 1] + i * 3) % 256
		sbox[i], sbox[j] = sbox[j], sbox[i]
	end
	local si, sj = 0, 0
	for _ = 1, 256 do
		si = (si + 1) % 256
		sj = (sj + sbox[si]) % 256
		sbox[si], sbox[sj] = sbox[sj], sbox[si]
	end
	local dataLen = string.len(cipherBytes)
	local out = table.create(dataLen)
	local mask = bxor32(string.len(toStr(partB)), string.len(toStr(partC)))
	local prevPlain = 90
	for idx = 1, dataLen do
		si = (si + 1) % 256
		sj = (sj + sbox[si]) % 256
		sbox[si], sbox[sj] = sbox[sj], sbox[si]
-- SL | Luraph V15.1 Cracked & Released | Source Leak [ https://discord.gg/zNyHGU6eUK ]
		local ks = bxor32(sbox[(sbox[si] + sbox[sj]) % 256], mask)
		local plain = bxor32(bxor32(string.byte(cipherBytes, idx), ks), prevPlain)
		out[idx] = string.char(plain)
		prevPlain = plain
	end
	return table.concat(out)
end

local function streamEncrypt(partA, partB, partC, plainBytes)
	local fullKey = toStr(partA) .. "|" .. toStr(partB) .. "|" .. toStr(partC)
	local keyLen = string.len(fullKey)
	local keyArr = {}
	for i = 1, keyLen do
		keyArr[i] = string.byte(fullKey, i)
	end
	local sbox = {}
	for i = 0, 255 do
		sbox[i] = i
	end
	local j = 0
	for i = 0, 255 do
		j = (j + sbox[i] + keyArr[i % keyLen + 1] + i * 3) % 256
		sbox[i], sbox[j] = sbox[j], sbox[i]
	end
	local si, sj = 0, 0
	for _ = 1, 256 do
		si = (si + 1) % 256
		sj = (sj + sbox[si]) % 256
		sbox[si], sbox[sj] = sbox[sj], sbox[si]
	end
	local dataLen = string.len(plainBytes)
	local out = table.create(dataLen)
	local mask = bxor32(string.len(toStr(partB)), string.len(toStr(partC)))
	local prevPlain = 90
	for idx = 1, dataLen do
		si = (si + 1) % 256
		sj = (sj + sbox[si]) % 256
		sbox[si], sbox[sj] = sbox[sj], sbox[si]
		local ks = bxor32(sbox[(sbox[si] + sbox[sj]) % 256], mask)
		local plain = string.byte(plainBytes, idx)
		local cipher = bxor32(bxor32(plain, prevPlain), ks)
		out[idx] = string.char(cipher)
		prevPlain = plain
	end
	return table.concat(out)
end

local function toHex(raw)
	local out = table.create(#raw)
	for i = 1, #raw do
		out[i] = string.format("%02x", string.byte(raw, i))
	end
	return table.concat(out)
end

local function fromHex(hexStr)
	if type(hexStr) ~= "string" or #hexStr % 2 ~= 0 or not string.match(hexStr, "^[0-9a-fA-F]+$") then
		return nil
	end
	local count = #hexStr // 2
	local out = table.create(count)
	for i = 1, count do
		local pair = string.sub(hexStr, (i - 1) * 2 + 1, i * 2)
		out[i] = string.char(tonumber(pair, 16))
	end
	return table.concat(out)
end

local function modExpString(baseStr, expStr, modStr)
	local modNum = tonumber(modStr)
	if not modNum then
		return nil
	end
	local function modMul(x, y)
		local a = x % modNum
		local acc = 0
		while y > 0 do
			if y % 2 == 1 then
				acc = (acc + a) % modNum
			end
			a = (a * 2) % modNum
			y = math.floor(y / 2)
		end
		return acc
	end
	local baseNum = tonumber(baseStr)
	local expNum = tonumber(expStr)
	if not baseNum or not expNum then
		return nil
	end
	local cur = baseNum % modNum
	local result = 1
	while expNum > 0 do
		if expNum % 2 == 1 then
			result = modMul(result, cur)
		end
		cur = modMul(cur, cur)
		expNum = math.floor(expNum / 2)
	end
-- Cracked By SL :: Luraph V15.1 Source Leak -> https://discord.gg/zNyHGU6eUK
	return toStr(result)
end

local function generatePrivateKey()
	local accum = 0
	for _ = 1, 6 do
		accum = accum * 256 + math.random(0, 255)
	end
	return toStr(accum % (tonumber(DH_PRIME) - 2) + 1)
end

local function computePublicKey(privKey)
	return modExpString(DH_GEN, privKey, DH_PRIME)
end

local function computeSharedSecret(peerPublicKey, privKey)
	return modExpString(peerPublicKey, privKey, DH_PRIME)
end

local function encryptDhHex(sharedSecret, nonce, plainText)
	return toHex(streamEncrypt(sharedSecret, "dh", nonce, plainText))
end

local function decryptDhRaw(sharedSecret, nonce, rawCipher)
	return streamDecrypt(sharedSecret, "dh", nonce, rawCipher)
end

local function createRng()
	local state = math.floor(os.clock() * 7331) % 65537
	return function(bound)
		state = (1664525 * state + 1013904223) % 4294967296
		return math.floor(state % bound) + 1
	end
end

local function randomAlphaToken(rng, length)
	local chars = table.create(length)
	for i = 1, length do
		chars[i] = ALPHA36[rng(36)]
	end
	return table.concat(chars)
end

local function buildNoiseParamsAndHeaders(rng)
	local queryParts = {}
	local headers = {}
	local qCount = rng(2) + 2
	for _ = 1, qCount do
		queryParts[#queryParts + 1] = "&" .. randomAlphaToken(rng, rng(3) + 3) .. "=" .. randomAlphaToken(rng, rng(6) + 7)
	end
	local hCount = rng(3) + 3
	for _ = 1, hCount do
		local hName = "x-" .. randomAlphaToken(rng, rng(3) + 4)
		headers[hName] = randomAlphaToken(rng, rng(5) + 8)
	end
	headers["Content-Type"] = "application/json"
	return table.concat(queryParts), headers
end

local function getHardwareId()
	if type(gethwid) == "function" then
		return gethwid()
	end
	if type(getfingerprint) == "function" then
		return getfingerprint()
	end
	return generateGuid(false)
end

local uiOk, builtGui = pcall(buildLoaderUI)
if uiOk then
	activeGui = builtGui
end

local function runWhitelistLoader()
	logStep("Whitelist v" .. LOADER_VERSION .. " starting...")

	local envValid = verifyEnvironment()
	if not envValid then
		logWarn("Security verification failed.")
		return failSecurity("environment_integrity")
	end
	logStep("Environment verified.")

	local userKey = rawget(env, "Key") or _G.Key
	if type(userKey) ~= "string" or #userKey == 0 then
		logWarn("A whitelist key is required.")
		kickNoKey("Please provide a valid whitelist key.")
		return
	end

	if type(rawHttpRequest) ~= "function" then
		logWarn("HTTP request function unavailable.")
		return
	end

	local rng = createRng()
	local privKey = generatePrivateKey()
	local pubKey = computePublicKey(privKey)
-- This Luraph V15.1 Cracked By SL | Source Leak [ https://discord.gg/zNyHGU6eUK ]
	local clientNonce = generateGuid(false)
	local hwid = getHardwareId()

	logStep("Establishing secure session")
	local hskNoise, hskHeaders = buildNoiseParamsAndHeaders(rng)
	local hskResp = safeRequest({
		Url = HANDSHAKE_URL .. "?t=" .. tostring(math.floor(os.clock() * 1000)) .. hskNoise,
		Method = "POST",
		Headers = hskHeaders,
		Body = HttpService:JSONEncode({
			pk = pubKey,
			nonce = clientNonce,
			script = SCRIPT_ID,
			build = BUILD_ID,
			channel = CHANNEL_ID,
			ver = LOADER_VERSION,
		}),
	})

	if type(hskResp) ~= "table" or hskResp.StatusCode ~= 200 or type(hskResp.Body) ~= "string" then
		logWarn("Handshake failed.")
		return
	end

	local hskData = HttpService:JSONDecode(hskResp.Body)
	local serverPubKey = tostring(hskData.pk or hskData.serverKey or "")
	local sessionId = tostring(hskData.sid or hskData.session or "")
	if not string.match(serverPubKey, "^[1-9][0-9]*$") or #sessionId == 0 then
		logWarn("Invalid server handshake response.")
		return
	end

	local sharedSecret = computeSharedSecret(serverPubKey, privKey)
	logStep("Secure session established")
	logStep("Handshake: OK")

	logStep("Verifying whitelist")
	local vrfNonce = generateGuid(false)
	local vrfPayload = HttpService:JSONEncode({
		key = userKey,
		hwid = hwid,
		gameId = tostring(game.GameId),
		placeId = tostring(game.PlaceId),
		route = rawget(env, "__BANANA_SCRIPT_ROUTE") or "",
		salt = CLIENT_SALT,
		sigA = ROUTE_SIG_A,
		sigB = ROUTE_SIG_B,
	})
	local vrfNoise, vrfHeaders = buildNoiseParamsAndHeaders(rng)
	local vrfResp = safeRequest({
		Url = VERIFY_URL .. "?sid=" .. sessionId .. vrfNoise,
		Method = "POST",
		Headers = vrfHeaders,
		Body = HttpService:JSONEncode({
			sid = sessionId,
			nonce = vrfNonce,
			data = encryptDhHex(sharedSecret, vrfNonce, vrfPayload),
		}),
	})

	if type(vrfResp) ~= "table" or vrfResp.StatusCode ~= 200 or type(vrfResp.Body) ~= "string" then
		logWarn("Verification request failed.")
		kickNoKey("Please provide a valid whitelist key.")
		return
	end

	local vrfOuter = HttpService:JSONDecode(vrfResp.Body)
	local vrfBytes = fromHex(tostring(vrfOuter.data or ""))
	if not vrfBytes then
		logWarn("Verification decode failed.")
		return
	end
	local vrfDecoded = HttpService:JSONDecode(decryptDhRaw(sharedSecret, tostring(vrfOuter.nonce or vrfNonce), vrfBytes))
	if not vrfDecoded or vrfDecoded.authorized ~= true then
		logWarn("Whitelist verification rejected.")
		kickNoKey("Please provide a valid whitelist key.")
		return
	end

	local streamToken = tostring(vrfDecoded.token or "")
	local totalChunks = math.max(1, tonumber(vrfDecoded.chunks) or 1)
	logStep("Whitelist verified")
	logStep("Verification: Authorized")

	logStep("Payload HTTP")
	local chunks = table.create(totalChunks)
	for chunkIndex = 1, totalChunks do
		local stpNonce = generateGuid(false)
		local stpNoise, stpHeaders = buildNoiseParamsAndHeaders(rng)
		local stpResp = safeRequest({
			Url = STREAM_URL .. "?sid=" .. sessionId .. "&c=" .. tostring(chunkIndex) .. stpNoise,
			Method = "POST",
			Headers = stpHeaders,
			Body = HttpService:JSONEncode({
				sid = sessionId,
				token = streamToken,
				chunk = chunkIndex,
				nonce = stpNonce,
			}),
		})
-- [ SL x Luraph V15.1 ] Cracked & Open | discord.gg/zNyHGU6eUK
		if type(stpResp) ~= "table" or stpResp.StatusCode ~= 200 or type(stpResp.Body) ~= "string" then
			logWarn("Payload download error at chunk " .. tostring(chunkIndex))
			return
		end
		local stpJson = HttpService:JSONDecode(stpResp.Body)
		local rawCipherChunk = fromHex(tostring(stpJson.data or ""))
		if not rawCipherChunk then
			logWarn("Corrupted payload chunk " .. tostring(chunkIndex))
			return
		end
		chunks[chunkIndex] = streamDecrypt(sharedSecret, streamToken, tostring(chunkIndex), rawCipherChunk)
		logStep(string.format("Payload chunk %d/%d", chunkIndex, totalChunks))
	end

	logStep("Payload fragment")
	local fullPayload = table.concat(chunks)
	logStep("Payload download total: " .. tostring(#fullPayload))
	logStep("Payload chunk verification")

	logStep("Payload compilation")
	local compiledFn, compileErr = loadstring(fullPayload)
	if type(compiledFn) ~= "function" then
		logWarn("Compilation error: " .. tostring(compileErr))
		return
	end

	logStep("Payload execution")
	logStep("Payload loaded successfully")
	compiledFn()
end

local execOk, execErr = pcall(runWhitelistLoader)
if not execOk then
	logWarn("Execution error: " .. tostring(execErr))
end

-- This Luraph V15.1 Cracked By SL | Source Leak [ https://discord.gg/zNyHGU6eUK ]
