function onCreate()
  addCharacterToList('cablecrow','1')
  makeAnimatedLuaSprite('vine','Vines',400,500)
  scaleObject('vine',0.8,0.8)
  addAnimationByPrefix('vine','idle','Vine',24,false)
  addLuaSprite('vine',false)
  setProperty('vine.visible',false)
  end
function onStepHit()
  if curStep==1910 then
    doTweenAlpha('dad','dad',0,0.5)
  end
  if curStep==1912 then
    makeLuaSprite('mic','Mic',580,350)
    scaleObject('mic',0.4,0.4)
    addLuaSprite('mic',true)
  end
  if curStep==1916 then
    makeLuaSprite('arm','Arm1',-3000,400)
    scaleObject('arm',0.4,0.4)
    addLuaSprite('arm',true)
  end
  if curStep==1917 then
    doTweenX('arm','arm',700,2)
  end
  if curStep==1930 then
    doTweenX('mic','mic',-3000,4)
    doTweenX('arm','arm',-3000,2)
  end
  if curStep==1950 then
    doTweenX('mic3','mic',6000,3)
    doTweenAngle('mic4','mic',3000,3)
    end
  if curStep==1958 then
    triggerEvent('Change Character','1','cablecrow')
    doTweenAlpha('dad2','dad',1,0.5)
  end
  end