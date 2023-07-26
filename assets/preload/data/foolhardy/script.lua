local cammove = false;

function onUpdate()
songPos = getPropertyFromClass('Conductor', 'songPosition');
currentBeat = (songPos / 1000) * (bpm / 170)

  if curStep == 2426 then
  doTweenAlpha('zardyalmostgone', 'dad', 0.50, 1, 'linear')
  cameraShake('game', 0.02, 0.6)
  end
  if curStep == 2432 then
  cammove = true
  end
  if cammove == true then
  doTweenX('camX', 'camHUD', 300*math.sin((currentBeat+1*0.1)*math.pi), 6)
  end
  if curStep == 2943 then
  doTweenAlpha('zardygone', 'dad', 0, 0.5, 'linear')
  end -- write by HayatoKawajiri#4229 aka Alternative Universal UT
end -- given to imposterdesus