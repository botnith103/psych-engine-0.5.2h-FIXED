--Code by doctor krazy, credit me if used.
--You may modify it to suit your needs.

local IsItDone = false					--Don't Touch
local shitass = 0						--Don't Touch
local poop = 0							--Don't Touch
local penis = 0							--Don't Touch
local ArrayDeezNuts = {}				--Don't Touch
local timer = 2							--Default Timer
local notesnumber = 4					--Default Note Numbers
local notesize = 1						--Default Note Size (changing it here won't do anything)
local NoteXOffset = 450					--Note Spawning XOffset (Parented to Boyfriend's X Position.)
local NoteYOffset = 50					--Note Spawning YOffset (Parented to Boyfriend's y Position.)
local NoteSpacer = 148 					--Spacing Between Notes
local noteTextures = 'NOTE_assets'		--Default Value for Note texture in case it can't detect it (Check your note assets path, especially if its a pixel stage)

function onEvent(name, notesnumbervalue, timervalue)
	if name == 'Bushwack' then
		if notesnumbervalue ~= '' then
			notesnumber = tonumber(notesnumbervalue)
		end
		if timervalue ~= '' then
			timer = tonumber(timervalue)
		end
		if timervalue ~= '-1' then
			runTimer('iamstoopid', 12)
		end
		CreateNotes()
	end
end

function CreateNotes()
	if not inGameOver then
		poop = 0
		shitass = 0
		notesize = 1*(0.935^notesnumber)
		if getPropertyFromClass('PlayState', 'isPixelStage') then
			noteTextures = 'pixelUI/'..getPropertyFromGroup('strumLineNotes', 4, 'texture')
			notesize = 8*(0.935^notesnumber)
			NoteSpacer = 18
		else
			noteTextures = getPropertyFromGroup('strumLineNotes', 4, 'texture')
		end
		ArrayDeezNuts = {}
		while shitass < notesnumber do
			makeAnimatedLuaSprite('NotesBase'..shitass, tostring(noteTextures), getCharacterX('boyfriend')+math.abs(math.floor(NoteSpacer*notesize)*shitass)-NoteXOffset, getCharacterY('boyfriend.y')+(200+math.floor(notesnumber*10))-NoteYOffset)
			addAnimationByIndices('NotesBase'..shitass, '1', 'purple', 0)
			addAnimationByIndices('NotesBase'..shitass, '2', 'blue', 0)
			addAnimationByIndices('NotesBase'..shitass, '3', 'green', 0)
			addAnimationByIndices('NotesBase'..shitass, '4', 'red', 0)
			scaleObject('NotesBase'..shitass, notesize, notesize)
			addLuaSprite('NotesBase'..shitass, true)
			if getPropertyFromClass('PlayState', 'isPixelStage') then
				setProperty('NotesBase'..shitass..'.antialiasing', false)
			end
			randomarrow = getRandomInt(1,4)
			objectPlayAnimation('NotesBase'..shitass, tostring(randomarrow), true)
			shitass = shitass+1
			table.insert(ArrayDeezNuts, shitass, randomarrow)
		end

		doTweenZoom('camZoomIn', 'camGame', 1.1, 1, 'circInOut')
		characterPlayAnim('boyfriend', 'scared', true)
		playSound('bf_grabbed_by_vine')
		setProperty('boyfriend.specialAnim', true)
		setProperty('boyfriend.stunned', true)
		setProperty('vine.visible',true)
    objectPlayAnimation('vine','idle',false)
		doinyouremom = true
		IsItDone = false
	end
end

function RemakeArrows()
	if not inGameOver then
		penis=0
		while penis<notesnumber do
			removeLuaSprite('NotesBase'..penis)
			penis = penis+1
		end
		if penis >= notesnumber then
			CreateNotes()
		end
	end
end

local keypressarray = {'left', 'down', 'up', 'right'}

function onUpdate()
	if not inGameOver then
		if doinyouremom then
			for e = 1,notesnumber  do
				if keyJustPressed(keypressarray[e]) and ArrayDeezNuts[1] == e then
					table.remove(ArrayDeezNuts, 1)
					removeLuaSprite('NotesBase'..poop)
					poop=poop+1
				elseif keyJustPressed(keypressarray[e]) and ArrayDeezNuts[1] ~= e then
					RemakeArrows()
				end
			end
			if poop >= notesnumber and not IsItDone then
				doinyouremom = false
				IsItDone = true
				characterPlayAnim('boyfried','axe',true)
				doTweenZoom('camZoomIn', 'camGame', 0.9, 0.5, 'circInOut')
				setProperty('boyfriend.specialAnim', true)
				playSound('bf_axe_chop')
				setProperty('boyfriend.stunned', false)
				setProperty('vine.visible',false)
				characterDance('boyfriend')
			end
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'iamstoopid' then
		if IsItDone then
			IsItDone = false
			setProperty('boyfriend.stunned', false)
		else
			setProperty('health', -500)
		end
	end
end